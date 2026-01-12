#!/usr/bin/env python3
import os
import json
import urllib.request
import re
import xml.etree.ElementTree as ET
from datetime import datetime
from email.utils import parsedate_to_datetime

# Configuration
DEVICES_JSON_URL = "https://raw.githubusercontent.com/PitchBlackRecoveryProject/vendor_utils/pb/pb_devices.json"
REPO_ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
OEM_DIR = os.path.join(REPO_ROOT, "_oem")
JSON_DIR = os.path.join(REPO_ROOT, "assets", "json")

# Regex to match PBRP filenames
ZIP_META_PATTERN = re.compile(
    r"(?:PBRP|PitchBlack)-.*?-(\d+(?:\.\d+)+)-(\d{8}).*?-(OFFICIAL|BETA|UNOFFICIAL).*?\.zip",
    re.IGNORECASE
)

def fetch_json(url):
    try:
        with urllib.request.urlopen(url) as response:
            return json.loads(response.read().decode())
    except Exception as e:
        print(f"Error fetching JSON {url}: {e}")
        return None

def fetch_sourceforge_builds(target_codename):
    rss_url = f"https://sourceforge.net/projects/pbrp/rss?path=/{target_codename}"
    builds = []
    
    try:
        req = urllib.request.Request(
            rss_url, 
            data=None, 
            headers={'User-Agent': 'PBRP-Manager/1.0'}
        )
        with urllib.request.urlopen(req) as response:
            xml_data = response.read().decode()
            
        root = ET.fromstring(xml_data)
        for item in root.findall('./channel/item'):
            title = item.find('title').text 
            link = item.find('link').text
            pub_date_str = item.find('pubDate').text
            
            if not title.startswith(f"/{target_codename}/"): continue
            filename = title.split('/')[-1]
            if not (filename.endswith('.zip') or filename.endswith('.img')): continue
                
            match = ZIP_META_PATTERN.search(filename)
            version = "Unknown"
            build_type = "UNOFFICIAL"
            date_str = "Unknown"
            timestamp = 0
            
            try:
                dt = parsedate_to_datetime(pub_date_str)
                date_str = dt.strftime("%Y-%m-%d")
                timestamp = dt.timestamp()
            except: pass

            if match:
                version = match.group(1)
                raw_date = match.group(2)
                build_type = match.group(3).upper()
                if len(raw_date) == 8:
                    date_str = f"{raw_date[0:4]}-{raw_date[4:6]}-{raw_date[6:8]}"
            elif filename.endswith('.img'):
                version = "Image"
                build_type = "IMG"

            download_link = link if link.endswith('/download') else f"{link}/download"

            builds.append({
                "version": version,
                "build_type": build_type,
                "date": date_str,
                "download_link": download_link,
                "github_release": None,
                "changelog": "- Auto-fetched from SourceForge",
                "_timestamp": timestamp
            })
            
    except urllib.error.HTTPError as e:
        if e.code == 404: return []
        print(f"    -> Warning: SF HTTP Error ({e.code})")
        return []
    except Exception as e:
        print(f"    -> Warning: Could not fetch SF data ({e})")
        return []

    builds.sort(key=lambda x: x['_timestamp'], reverse=True)
    for b in builds: del b['_timestamp']
    return builds

def process_device(vendor, device_codename, build_source_codename, specific_data):
    vendor_lower = vendor.lower()
    vendor_dir = os.path.join(OEM_DIR, vendor_lower)
    md_path = os.path.join(vendor_dir, f"{device_codename}.md")
    
    if os.path.exists(md_path): return False

    print(f"Checking: {vendor}/{device_codename} (Source: {build_source_codename})...")

    found_builds = fetch_sourceforge_builds(build_source_codename)
    if not found_builds:
        print(f"  -> [SKIP] No builds found on SourceForge for '{build_source_codename}'")
        return False

    if not os.path.exists(vendor_dir): os.makedirs(vendor_dir)
    print(f"  -> [NEW] Found {len(found_builds)} builds! Creating pages...")

    device_name = specific_data.get('name', device_codename.capitalize())
    raw_maintainer = specific_data.get('maintainer', 'Unknown')
    maintainer = raw_maintainer.replace('@', '').strip()
    
    # Use build_source_codename (Parent) for the repo tree URL
    tree_url = f"https://github.com/PitchBlackRecoveryProject/android_device_{vendor_lower}_{build_source_codename}-pbrp"

    md_content = f"""---
layout: device
title: "{device_name}"
codename: {device_codename}
permalink: /{device_codename}/
redirect_from: /devices/{vendor_lower}/{device_codename}/
oem: {vendor}
supportstatus: Current
maintainer: {maintainer}
devicetree: "{tree_url}"
---

{{% include disclaimer.html %}}

{{% include download.html %}}

{{% include pbrpinstall.html %}}
"""
    try:
        with open(md_path, 'w') as f: f.write(md_content)
        print(f"  -> Created MD: {md_path}")
    except Exception as e:
        print(f"  -> Error creating MD: {e}")
        return False

    if not os.path.exists(JSON_DIR): os.makedirs(JSON_DIR)
    json_path = os.path.join(JSON_DIR, f"builds-{device_codename}.json")
    
    json_data = {
        "latest": found_builds[0],
        "older_builds": found_builds[1:] if len(found_builds) > 1 else []
    }

    try:
        with open(json_path, 'w') as f: json.dump(json_data, f, indent=2)
        print(f"  -> Created JSON: {json_path}")
    except Exception as e:
        print(f"  -> Error creating JSON: {e}")
    
    return True

def main():
    print(f"Connecting to master device list...")
    data = fetch_json(DEVICES_JSON_URL)
    if not data: return

    child_to_parent_map = {}
    for vendor, devices in data.items():
        for key, device_data in devices.items():
            if "unified" in device_data and isinstance(device_data["unified"], list):
                for child in device_data["unified"]:
                    child_to_parent_map[child] = key

    processed_codenames = set()
    new_devices_count = 0

    # 1. Process Explicit Entries
    for vendor, devices in data.items():
        for key, device_data in devices.items():
            build_source = child_to_parent_map.get(key, key)
            if process_device(vendor, key, build_source, device_data):
                new_devices_count += 1
            processed_codenames.add(key)

    # 2. Process Implicit Children
    for vendor, devices in data.items():
        for key, device_data in devices.items():
            if "unified" in device_data and isinstance(device_data["unified"], list):
                parent_source = key
                parent_maintainer = device_data.get('maintainer', 'Unknown')
                for child in device_data["unified"]:
                    if child not in processed_codenames:
                        fallback_data = {"name": child.capitalize(), "maintainer": parent_maintainer}
                        if process_device(vendor, child, parent_source, fallback_data):
                            new_devices_count += 1
                        processed_codenames.add(child)

    print("-" * 30)
    print(f"Sync Complete.")
    print(f"New Devices Added: {new_devices_count}")

if __name__ == "__main__":
    main()
