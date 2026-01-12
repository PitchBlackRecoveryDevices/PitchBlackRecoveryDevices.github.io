#!/usr/bin/env python3
import os
import re

# This script migrates all existing device files in _oem/ 
# from old permalink structure to new dual-link structure.
# It forces the vendor part of the URL to be LOWERCASE.
# Old: permalink: /codename/
# New: permalink: /codename/
#      redirect_from: /devices/lower_vendor/codename/

REPO_ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
OEM_DIR = os.path.join(REPO_ROOT, "_oem")

def fix_file(file_path, vendor):
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()

    # Regex to find codename
    codename_match = re.search(r'^codename:\s*(.+)$', content, re.MULTILINE)
    if not codename_match:
        print(f"Skipping {file_path}: No codename found")
        return

    codename = codename_match.group(1).strip()
    
    # Construct desired lines (Force vendor to lowercase for URL)
    vendor_slug = vendor.lower()
    new_permalink = f"permalink: /{codename}/"
    new_redirect = f"redirect_from: /devices/{vendor_slug}/{codename}/"

    # Check if already updated
    if new_permalink in content and new_redirect in content:
        return

    # Replace old permalink
    # Case 1: permalink exists
    permalink_pattern = re.compile(r'^permalink:.*$', re.MULTILINE)
    
    if permalink_pattern.search(content):
        # Replace existing permalink
        content = permalink_pattern.sub(new_permalink + "\n" + new_redirect, content)
        print(f"Updated {vendor}/{codename}")
    else:
        # Case 2: permalink might be missing (using default), add it after codename
        content = content.replace(f"codename: {codename}", f"codename: {codename}\n{new_permalink}\n{new_redirect}")
        print(f"Added permalink to {vendor}/{codename}")

    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(content)

def main():
    print("Starting Permalink Migration...")
    if not os.path.exists(OEM_DIR):
        print(f"Error: {OEM_DIR} not found.")
        return

    count = 0
    for root, dirs, files in os.walk(OEM_DIR):
        for file in files:
            if file.endswith(".md"):
                # Get vendor from directory name
                vendor = os.path.basename(root)
                fix_file(os.path.join(root, file), vendor)
                count += 1
    
    print(f"Processed {count} files.")

if __name__ == "__main__":
    main()
