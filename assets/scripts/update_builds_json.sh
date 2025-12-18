#!/bin/bash
#
# JSON Build Update Script for PBRP (GitHub Actions Compatible)
# With Integrated Device Page Creation & Unified Device Support
#
# Usage: ./update_builds_json.sh VENDOR CODENAME VERSION DEPLOY_TYPE SF_LINK [CHANGELOG]

# Color definitions
cyan='\033[0;36m'
green='\e[0;32m'
yellow='\033[0;33m'
red='\033[0;31m'
nocol='\033[0m'

# Function to show usage
show_usage() {
    echo -e "${cyan}Usage: $0 VENDOR CODENAME VERSION DEPLOY_TYPE SF_LINK [CHANGELOG]${nocol}"
    exit 1
}

# Check arguments
if [ $# -lt 5 ]; then
    echo -e "${red}Error: Insufficient arguments${nocol}"
    show_usage
fi

# Parse arguments
VENDOR=$1
CODENAME=$2
VERSION=$3
DEPLOY_TYPE=$4
SF_LINK=$5
CHANGELOG=${6:-""}

# Generate GitHub release link
if [[ "$DEPLOY_TYPE" == "BETA" ]]; then
    GH_LINK="https://github.com/PitchBlackRecoveryProject/android_device_${VENDOR}_${CODENAME}-pbrp/releases/tag/${VERSION}-${DEPLOY_TYPE}"
else
    GH_LINK="https://github.com/PitchBlackRecoveryProject/android_device_${VENDOR}_${CODENAME}-pbrp/releases/tag/${VERSION}"
fi

# Check if build type is BETA or OFFICIAL only
if [[ ! "$DEPLOY_TYPE" =~ ^(OFFICIAL|BETA)$ ]]; then
    echo -e "${yellow}Skipping JSON update - Deploy type '$DEPLOY_TYPE' is not OFFICIAL or BETA${nocol}"
    exit 0
fi

# Environment variables
GH_BOT_TOKEN=${GH_BOT_TOKEN:-""}
GITHUB_ACTOR=${GITHUB_ACTOR:-"PBRP Bot"}
GITHUB_EMAIL=${GITHUB_EMAIL:-"pitchblackrecovery@gmail.com"}

# Repository settings
TARGET_REPO="PitchBlackRecoveryProject/PitchBlackRecoveryProject.github.io"
TARGET_REPO_URL="https://github.com/${TARGET_REPO}"
DEVICES_JSON_URL="https://raw.githubusercontent.com/PitchBlackRecoveryProject/vendor_utils/refs/heads/pb/pb_devices.json"

# Check dependencies
for cmd in jq git curl; do
    if ! command -v $cmd &> /dev/null; then
        echo -e "${red}Error: $cmd is required.${nocol}"
        exit 1
    fi
done

# Generate BUILD_DATE
if [ -z "$BUILD_DATE" ]; then
    export TZ="Asia/Kolkata"
    BUILD_DATE=$(date +%Y%m%d)
fi
BUILD_DATE_FORMATTED=$(date -d "${BUILD_DATE:0:4}-${BUILD_DATE:4:2}-${BUILD_DATE:6:2}" +%Y-%m-%d 2>/dev/null || echo "${BUILD_DATE:0:4}-${BUILD_DATE:4:2}-${BUILD_DATE:6:2}")
CHANGELOG_PROCESSED=$(echo -e "$CHANGELOG")

# Setup Repository
REPO_DIR="PitchBlackRecoveryProject.github.io"
if [ -d "$REPO_DIR" ]; then rm -rf "$REPO_DIR"; fi

echo -e "${cyan}Cloning website repository...${nocol}"
if [ -n "$GH_BOT_TOKEN" ]; then
    git clone --quiet "https://${GH_BOT_TOKEN}@github.com/${TARGET_REPO}.git" "$REPO_DIR"
else
    git clone --quiet "$TARGET_REPO_URL" "$REPO_DIR"
fi

if [ $? -ne 0 ]; then
    echo -e "${red}❌ Failed to clone repository${nocol}"
    exit 1
fi

# Fetch Device Database
echo -e "${cyan}Fetching device database...${nocol}"
curl -sL "$DEVICES_JSON_URL" -o pb_devices.json

if ! jq empty pb_devices.json 2>/dev/null; then
    echo -e "${red}❌ Invalid device database JSON${nocol}"
    exit 1
fi

# --- Helper function to find vendor object ignoring case ---
get_vendor_json() {
    jq -r --arg v "$1" '
        to_entries[] | select(.key | ascii_downcase == ($v | ascii_downcase)) | .value
    ' pb_devices.json
}

# --- Determine List of Devices to Update ---
declare -a TARGET_LIST

# 1. Get the JSON object for this Vendor
VENDOR_JSON=$(get_vendor_json "$VENDOR")

if [ -z "$VENDOR_JSON" ]; then
    echo -e "${red}❌ Vendor '$VENDOR' not found in database${nocol}"
    exit 1
fi

# 2. Get the specific device entry (Parent)
DEVICE_ENTRY=$(echo "$VENDOR_JSON" | jq -r --arg c "$CODENAME" '.[$c] // empty')

# 3. Check for "unified" array in the parent
UNIFIED_CHILDREN=$(echo "$DEVICE_ENTRY" | jq -r '.unified[]? // empty')

if [ -n "$UNIFIED_CHILDREN" ]; then
    echo -e "${yellow}Detected Unified Build ($CODENAME). Processing children...${nocol}"
    
    PARENT_MAINTAINER=$(echo "$DEVICE_ENTRY" | jq -r '.maintainer // "Unknown"')
    
    for child in $UNIFIED_CHILDREN; do
        # Check if child has own entry
        CHILD_DATA=$(echo "$VENDOR_JSON" | jq -r --arg c "$child" '.[$c] // empty')
        
        if [ -n "$CHILD_DATA" ]; then
            C_NAME=$(echo "$CHILD_DATA" | jq -r '.name')
            C_MAINT=$(echo "$CHILD_DATA" | jq -r '.maintainer')
        else
            C_NAME="${child^}"
            C_MAINT="$PARENT_MAINTAINER"
        fi
        
        # Format: "CODE|NAME|MAINTAINER|REPO_TREE"
        TARGET_LIST+=("$child|$C_NAME|$C_MAINT|$CODENAME")
    done
else
    # Standard Device
    if [ -n "$DEVICE_ENTRY" ]; then
        C_NAME=$(echo "$DEVICE_ENTRY" | jq -r '.name')
        C_MAINT=$(echo "$DEVICE_ENTRY" | jq -r '.maintainer')
    else
        C_NAME="${CODENAME^}"
        C_MAINT="Unknown"
    fi
    TARGET_LIST+=("$CODENAME|$C_NAME|$C_MAINT|$CODENAME")
fi

# --- Process Updates ---
cd "$REPO_DIR" || exit 1

NEW_PAGE_CREATED=false

for item in "${TARGET_LIST[@]}"; do
    # Split string
    IFS='|' read -r T_CODE T_NAME T_MAINT T_REPO <<< "$item"
    
    # Clean maintainer name (remove @)
    T_MAINT=${T_MAINT//@/}
    
    echo -e "${cyan}Updating: ${T_CODE} (Tree: ${T_REPO})...${nocol}"
    
    # 1. Update/Create JSON
    JSON_FILE="assets/json/builds-${T_CODE}.json"
    mkdir -p assets/json
    
    if [ ! -f "$JSON_FILE" ]; then
        echo '{"latest": {}, "older_builds": []}' > "$JSON_FILE"
    fi
    
    NEW_BUILD=$(jq -n \
        --arg version "$VERSION" \
        --arg build_type "$DEPLOY_TYPE" \
        --arg date "$BUILD_DATE_FORMATTED" \
        --arg download_link "$SF_LINK" \
        --arg github_release "$GH_LINK" \
        --arg changelog "$CHANGELOG_PROCESSED" \
        '{
            version: $version,
            build_type: $build_type,
            date: $date,
            download_link: $download_link,
            github_release: $github_release,
            changelog: $changelog
        }')
        
    jq --argjson new_build "$NEW_BUILD" '
        .older_builds = (.older_builds // []) |
        if (.latest and (.latest.version // "") != "") then
            .older_builds = [.latest | del(.github_release)] + .older_builds
        else
            .
        end |
        .latest = $new_build |
        .older_builds = (.older_builds // [])[:10]
    ' "$JSON_FILE" > "${JSON_FILE}.tmp" && mv "${JSON_FILE}.tmp" "$JSON_FILE"
    
    
    # 2. Update/Create Markdown Page
    VENDOR_LOWER=$(echo "$VENDOR" | tr '[:upper:]' '[:lower:]')
    MD_FILE="_oem/${VENDOR_LOWER}/${T_CODE}.md"
    mkdir -p "_oem/${VENDOR_LOWER}"
    
    if [ ! -f "$MD_FILE" ]; then
        cat > "$MD_FILE" <<EOF
---
layout: device
title: "${T_NAME}"
codename: ${T_CODE}
permalink: /${T_CODE}/
oem: ${VENDOR}
supportstatus: Current
maintainer: ${T_MAINT}
devicetree: "https://github.com/PitchBlackRecoveryProject/android_device_${VENDOR_LOWER}_${T_REPO}-pbrp"
---

{% include disclaimer.html %}

{% include download.html %}

{% include pbrpinstall.html %}
EOF
        echo -e "${green}  -> Created Page: $MD_FILE${nocol}"
        NEW_PAGE_CREATED=true
    fi
done

# --- Commit and Push ---
echo -e "${cyan}Pushing changes...${nocol}"

git config user.name "$GITHUB_ACTOR"
git config user.email "$GITHUB_EMAIL"

if [ -n "$GH_BOT_TOKEN" ]; then
    git remote set-url origin "https://${GH_BOT_TOKEN}@github.com/${TARGET_REPO}.git"
fi

git add assets/json/ _oem/

if git diff --cached --quiet; then
    echo -e "${yellow}No changes to commit.${nocol}"
else
    # Commit Message Format:
    COMMIT_MSG="🤖 Update On ${BUILD_DATE_FORMATTED} ${CODENAME} to ${VERSION} (${DEPLOY_TYPE})"
    
    # Append Unified tag if applicable
    if [ $(echo "${TARGET_LIST[@]}" | wc -w) -gt 1 ]; then
        COMMIT_MSG="$COMMIT_MSG [Unified]"
    fi

    # Append device page tag if a new page was created
    if [ "$NEW_PAGE_CREATED" = true ]; then
        COMMIT_MSG="$COMMIT_MSG + device page"
    fi
    
    git commit -m "$COMMIT_MSG"
    
    if git push origin; then
        echo -e "${green}✅ Successfully pushed to GitHub${nocol}"
    else
        echo -e "${red}❌ Failed to push changes${nocol}"
        exit 1
    fi
fi

# Cleanup
cd ..
rm -rf "$REPO_DIR" pb_devices.json
