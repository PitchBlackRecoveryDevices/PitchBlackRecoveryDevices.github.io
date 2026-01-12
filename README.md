### **New Device Addition Checklist**
---

### **Required Files**

1. **Device Information File**  
   Create: `_oem/<vendor>/<codename>.md`  
   ```markdown
   ---
   layout: device
   title: "{Device Name}"
   codename: {codename}
   oem: {OEM Name}
   permalink: /{codename}/
   redirect_from: /devices/{oem}/{codename}/
   supportstatus: Current/Discontinued
   maintainer: {Your GitHub Username/Name} # Without @
   ddof: "/dev/block/bootdevice/by-name/recovery"
   devicetree: "https://github.com/PitchBlackRecoveryProject/device_{vendor}_{codename}-pbrp"
   xdathread: "https://forum.xda-developers.com/t/..."
   ---

   {% include disclaimer.html %}

   {% include download.html %}

   {% include pbrpinstall.html %}

   {% include fastbootinstall.html %}

   {% include ddinstall.html %}

   {% include avb.html %}
   ```
**You can check _includes to add/remove what you want**

2. **Build Information File**  
   Create: `assets/json/builds-{codename}.json`  
   ```json
   {
     "latest": {
       "version": "4.0.0",
       "build_type": "OFFICIAL/UNOFFICIAL",
       "date": "YYYY-MM-DD",
       "download_link": "https://sourceforge.net/projects/pbrp/files/{codename}/PBRP-{codename}-4.0-YYYYMMDD-HHMM-OFFICIAL.zip/download",
       "github_release": "https://github.com/PitchBlackRecoveryProject/device_{vendor}_{codename}/releases/tag/4.0",
       "changelog": "- Initial release\n- Fixed XYZ"
     }
   }
   ```

3. **Updating The Builds**  
   Edit: `assets/json/builds-{codename}.json`  
   ```json
   {
     "latest": {
       "version": "4.0.0",
       "build_type": "OFFICIAL/UNOFFICIAL",
       "date": "YYYY-MM-DD",
       "download_link": "https://sourceforge.net/projects/pbrp/files/{codename}/PBRP-{codename}-4.0-YYYYMMDD-HHMM-OFFICIAL.zip/download",
       "github_release": "https://github.com/PitchBlackRecoveryProject/device_{vendor}_{codename}/releases/tag/4.0",
       "changelog": "- Fixed XYZ"
     }
     "older_builds": [
       {
         "version": "4.0.0",
         "build_type": "OFFICIAL/UNOFFICIAL",
         "date": "YYYY-MM-DD",
         "download_link": "https://sourceforge.net/projects/pbrp/files/{codename}/PBRP-{codename}-4.0-YYYYMMDD-HHMM-OFFICIAL.zip/download",
         "changelog": "- Initial Release"
       }
     ]
   }
   ```
