#!/bin/bash
#
# JSON Build Update Script for PBRP (GitHub Actions Compatible)
# With Integrated Device Page Creation
#
# Copyright (C) 2019 - 2020, PitchBlack Recovery Project
# This script updates the builds JSON file for PBRP releases and creates device pages
# Only updates for BETA and OFFICIAL builds, always auto-pushes
#
# Usage: ./update_builds_json.sh VENDOR CODENAME VERSION DEPLOY_TYPE SF_LINK GH_LINK [CHANGELOG]
#

# Color definitions
blue='\033[0;34m'
cyan='\033[0;36m'
green='\e[0;32m'
yellow='\033[0;33m'
red='\033[0;31m'
nocol='\033[0m'
purple='\e[0;35m'
white='\e[0;37m'

# Function to show usage
show_usage() {
    echo -e "${cyan}Usage: $0 VENDOR CODENAME VERSION DEPLOY_TYPE SF_LINK GH_LINK [CHANGELOG]${nocol}"
    echo -e "${cyan}Example: $0 xiaomi rolex 3.1.0 OFFICIAL 'https://sf.net/...' 'https://github.com/...' 'Updated recovery'${nocol}"
    echo
    echo -e "${yellow}Arguments:${nocol}"
    echo -e "  VENDOR      : Device vendor/OEM (e.g., xiaomi, samsung)"
    echo -e "  CODENAME    : Device codename (e.g., rolex)"
    echo -e "  VERSION     : PBRP version (e.g., 3.1.0)"
    echo -e "  DEPLOY_TYPE : Build type (OFFICIAL/BETA only - TEST builds are ignored)"
    echo -e "  SF_LINK     : SourceForge download link"
    echo -e "  GH_LINK     : GitHub release link"
    echo -e "  CHANGELOG   : Build changelog (optional)"
    echo
    echo -e "${yellow}Note: Only OFFICIAL and BETA builds will update JSON. TEST builds are skipped.${nocol}"
}

# Check arguments
if [ $# -lt 6 ]; then
    echo -e "${red}Error: Insufficient arguments${nocol}"
    show_usage
    exit 1
fi

# Parse arguments
VENDOR=$1
CODENAME=$2
VERSION=$3
DEPLOY_TYPE=$4
SF_LINK=$5
GH_LINK=$6
CHANGELOG=${7:-""}

# Check if build type is BETA or OFFICIAL only
if [[ ! "$DEPLOY_TYPE" =~ ^(OFFICIAL|BETA)$ ]]; then
    echo -e "${yellow}Skipping JSON update - Deploy type '$DEPLOY_TYPE' is not OFFICIAL or BETA${nocol}"
    echo -e "${cyan}JSON updates are only performed for OFFICIAL and BETA builds${nocol}"
    exit 0
fi

# Environment variables for GitHub Actions
GH_BOT_TOKEN=${GH_BOT_TOKEN:-""}
GITHUB_ACTOR=${GITHUB_ACTOR:-"PBRP Bot"}
GITHUB_EMAIL=${GITHUB_EMAIL:-"pitchblackrecovery@gmail.com"}

# Repository settings
TARGET_REPO="PitchBlackRecoveryProject/PitchBlackRecoveryProject.github.io"
TARGET_REPO_URL="https://github.com/${TARGET_REPO}"
DEVICES_JSON_URL="https://raw.githubusercontent.com/PitchBlackRecoveryProject/vendor_utils/refs/heads/pb/pb_devices.json"

# Check if jq is installed
if ! command -v jq &> /dev/null; then
    echo -e "${yellow}jq is required for JSON updates but not installed.${nocol}"
    echo -e "${cyan}Installing jq...${nocol}"
    
    # Install jq (GitHub Actions compatible)
    if command -v apt-get &> /dev/null; then
        apt-get update -qq && apt-get install -y jq
    elif command -v apk &> /dev/null; then
        apk add --no-cache jq
    elif command -v yum &> /dev/null; then
        yum install -y jq
    elif command -v brew &> /dev/null; then
        brew install jq
    else
        echo -e "${red}Could not install jq automatically. Please install it manually.${nocol}"
        exit 1
    fi
    
    # Verify installation
    if ! command -v jq &> /dev/null; then
        echo -e "${red}Failed to install jq. Please install it manually and try again.${nocol}"
        exit 1
    fi
fi

# Check if git and curl are available
for cmd in git curl; do
    if ! command -v $cmd &> /dev/null; then
        echo -e "${red}Error: $cmd is required but not installed.${nocol}"
        exit 1
    fi
done

# Generate BUILD_DATE if not set
if [ -z "$BUILD_DATE" ]; then
    export TZ="Asia/Kolkata"
    BUILD_DATE=$(date +%Y%m%d)
fi

# Function to fetch device info from pb_devices.json
fetch_device_info() {
    local vendor=$1
    local codename=$2
    local temp_devices_file="/tmp/pb_devices.json"
    
    echo -e "${cyan}Fetching device information for ${vendor}/${codename}...${nocol}"
    
    # Download devices JSON
    if ! curl -s -L "$DEVICES_JSON_URL" -o "$temp_devices_file"; then
        echo -e "${red}❌ Failed to download devices JSON${nocol}"
        return 1
    fi
    
    # Validate JSON
    if ! jq empty "$temp_devices_file" 2>/dev/null; then
        echo -e "${red}❌ Invalid devices JSON format${nocol}"
        rm -f "$temp_devices_file"
        return 1
    fi
    
    # Extract device info using the new JSON structure
    local device_info=$(jq -r --arg vendor "$vendor" --arg codename "$codename" '
        .[$vendor]?[$codename]? // null
    ' "$temp_devices_file")
    
    rm -f "$temp_devices_file"
    
    if [ "$device_info" = "null" ] || [ -z "$device_info" ]; then
        echo -e "${yellow}⚠️  Device ${vendor}/${codename} not found in pb_devices.json${nocol}"
        return 1
    fi
    
    # Export device info as global variables
    DEVICE_NAME=$(echo "$device_info" | jq -r '.name // "Unknown Device"')
    DEVICE_MAINTAINER=$(echo "$device_info" | jq -r '.maintainer // "Unknown"')
    
    echo -e "${green}✅ Device info found:${nocol}"
    echo -e "${cyan}  Name: ${DEVICE_NAME}${nocol}"
    echo -e "${cyan}  Vendor: ${vendor}${nocol}"
    echo -e "${cyan}  Maintainer: ${DEVICE_MAINTAINER}${nocol}"
    
    return 0
}

# Function to create device page if it doesn't exist
create_device_page() {
    local codename=$1
    local vendor=$2
    local name=$3
    local maintainer=$4
    
    local device_dir="${REPO_DIR}/_oem/${vendor}"
    local device_file="${device_dir}/${codename}.md"
    
    # Create vendor directory if it doesn't exist
    mkdir -p "$device_dir"
    
    # Check if device page already exists
    if [ -f "$device_file" ]; then
        echo -e "${cyan}Device page already exists: ${device_file}${nocol}"
        return 0
    fi
    
    echo -e "${cyan}Creating device page: ${device_file}${nocol}"
    
    # Create device page content
    cat > "$device_file" << EOF
---
layout: device
title: "${name}"
codename: ${codename}
oem: ${vendor}
supportstatus: Current
maintainer: ${maintainer}
devicetree: "https://github.com/PitchBlackRecoveryProject/android_device_${vendor}_${codename}-pbrp"
---

{% include disclaimer.html %}

{% include supportstatus.html %}

{% include download.html %}

{% include pbrpinstall.html %}
EOF
    
    if [ $? -eq 0 ]; then
        echo -e "${green}✅ Device page created successfully${nocol}"
        return 0
    else
        echo -e "${red}❌ Failed to create device page${nocol}"
        return 1
    fi
}

# JSON Build Update Function
function update_builds_json() {
    echo -e "${cyan}=== Starting JSON Update Process ===${nocol}"
    echo -e "${cyan}Vendor: ${VENDOR}${nocol}"
    echo -e "${cyan}Device: ${CODENAME}${nocol}"
    echo -e "${cyan}Version: ${VERSION}${nocol}"
    echo -e "${cyan}Build Type: ${DEPLOY_TYPE}${nocol}"
    echo

    # Fetch device information
    if ! fetch_device_info "$VENDOR" "$CODENAME"; then
        echo -e "${yellow}⚠️  Continuing with default device information${nocol}"
        DEVICE_NAME="Unknown Device"
        DEVICE_MAINTAINER="Unknown"
    fi

    # Clone the target repository
    REPO_DIR="PitchBlackRecoveryProject.github.io"
    
    # Remove existing directory if it exists
    if [ -d "$REPO_DIR" ]; then
        rm -rf "$REPO_DIR"
    fi
    
    echo -e "${cyan}Cloning target repository...${nocol}"
    
    # Clone with authentication for GitHub Actions
    if [ -n "$GH_BOT_TOKEN" ]; then
        git clone "https://${GH_BOT_TOKEN}@github.com/${TARGET_REPO}.git" "$REPO_DIR"
    else
        git clone "$TARGET_REPO_URL" "$REPO_DIR"
    fi
    
    if [ $? -ne 0 ]; then
        echo -e "${red}❌ Failed to clone repository${nocol}"
        return 1
    fi
    
    # Define paths
    JSON_DIR="${REPO_DIR}/assets/json"
    JSON_FILE="${JSON_DIR}/builds-${CODENAME}.json"
    TEMP_FILE="/tmp/builds-${CODENAME}-temp.json"
    
    # Create directory if it doesn't exist
    mkdir -p "$JSON_DIR"
    
    # Generate changelog if not provided
    if [ -z "$CHANGELOG" ]; then
        CHANGELOG="- Updated to ${VERSION}\\n- Latest PBRP source sync\\n- Bug fixes and improvements"
        echo -e "${yellow}No changelog provided, using default changelog${nocol}"
    fi
    
    # Process changelog (replace \\n with actual newlines)
    CHANGELOG_PROCESSED=$(echo -e "$CHANGELOG")
    
    # Build date in proper format
    BUILD_DATE_FORMATTED=$(date -d "${BUILD_DATE:0:4}-${BUILD_DATE:4:2}-${BUILD_DATE:6:2}" +%Y-%m-%d 2>/dev/null || echo "${BUILD_DATE:0:4}-${BUILD_DATE:4:2}-${BUILD_DATE:6:2}")
    
    # Check if JSON file exists
    if [ ! -f "$JSON_FILE" ]; then
        echo -e "${yellow}JSON file doesn't exist, creating new one...${nocol}"
        echo '{"latest": {}, "older_builds": []}' > "$JSON_FILE"
        
        # Create device page if device info is available
        if [ "$DEVICE_NAME" != "Unknown Device" ]; then
            create_device_page "$CODENAME" "$VENDOR" "$DEVICE_NAME" "$DEVICE_MAINTAINER"
        else
            echo -e "${yellow}⚠️  Device page not created due to missing device information${nocol}"
            echo -e "${yellow}⚠️  Please manually create _oem/${VENDOR}/${CODENAME}.md & submit PR to: https://github.com/PitchBlackRecoveryProject/PitchBlackRecoveryProject.github.io${nocol}"
        fi
    fi
    
    # Validate JSON file
    if ! jq empty "$JSON_FILE" 2>/dev/null; then
        echo -e "${red}❌ Invalid JSON file format${nocol}"
        return 1
    fi
    
    # Create new build object
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
    
    if [ $? -ne 0 ]; then
        echo -e "${red}❌ Failed to create new build object${nocol}"
        return 1
    fi
    
    # Update JSON file
    jq --argjson new_build "$NEW_BUILD" '
        # Ensure older_builds is always an array
        .older_builds = (.older_builds // []) |
        # Move current latest to older_builds if it exists and has a version
        if (.latest and (.latest.version // "") != "") then
            .older_builds = [.latest | del(.github_release)] + .older_builds
        else
            .
        end |
        # Set new latest build
        .latest = $new_build |
        # Keep only last 10 older builds to prevent file from growing too large
        .older_builds = (.older_builds // [])[:10]
    ' "$JSON_FILE" > "$TEMP_FILE"
    
    if [ $? -ne 0 ]; then
        echo -e "${red}❌ Failed to update JSON file${nocol}"
        return 1
    fi
    
    # Validate updated JSON
    if ! jq empty "$TEMP_FILE" 2>/dev/null; then
        echo -e "${red}❌ Generated invalid JSON${nocol}"
        rm -f "$TEMP_FILE"
        return 1
    fi
    
    # Replace original file
    if mv "$TEMP_FILE" "$JSON_FILE"; then
        echo -e "${green}✅ Successfully updated $JSON_FILE${nocol}"
        echo -e "${cyan}Added $VERSION ($DEPLOY_TYPE) build for $CODENAME${nocol}"
        
        # Show the updated structure
        echo -e "${cyan}Latest build info:${nocol}"
        jq '.latest' "$JSON_FILE"
        
        # Show older builds count
        OLDER_COUNT=$(jq '.older_builds | length' "$JSON_FILE")
        echo -e "${cyan}Older builds count: ${OLDER_COUNT}${nocol}"
        
        # Commit and push changes
        if commit_and_push_changes; then
            return 0
        else
            echo -e "${red}❌ Failed to commit and push changes${nocol}"
            return 1
        fi
    else
        echo -e "${red}❌ Failed to update JSON file${nocol}"
        return 1
    fi
}

# Commit and push JSON changes to target repository
function commit_and_push_changes() {
    echo -e "${cyan}=== Committing and Pushing Changes ===${nocol}"
    
    cd "$REPO_DIR" || return 1

    # Configure git for GitHub Actions
    git config user.name "$GITHUB_ACTOR"
    git config user.email "$GITHUB_EMAIL"

    # Set up GitHub authentication if token is available
    if [ -n "$GH_BOT_TOKEN" ]; then
        git remote set-url origin "https://${GH_BOT_TOKEN}@github.com/${TARGET_REPO}.git"
    fi

    # Track staged changes
    DEVICE_PAGE="_oem/${VENDOR}/${CODENAME}.md"
    device_page_msg=""
    device_page_note=""

    # Add main build JSON file
    git add "assets/json/builds-${CODENAME}.json"

    # Conditionally add device page if it's new (not tracked yet)
    if [ -f "$DEVICE_PAGE" ]; then
        if ! git ls-files --error-unmatch "$DEVICE_PAGE" >/dev/null 2>&1; then
            git add "$DEVICE_PAGE"
            echo -e "${cyan}Added new device page to commit${nocol}"
            device_page_msg=" + device page"
            device_page_note="- Device Page: Created ${DEVICE_PAGE}"
        fi
    fi

    # Exit early if nothing to commit
    if git diff --cached --quiet; then
        echo -e "${yellow}No changes to commit${nocol}"
        cd ..
        return 0
    fi

    # Compose commit message
    COMMIT_MSG="🤖 Update On ${BUILD_DATE_FORMATTED} ${CODENAME} to ${VERSION} (${DEPLOY_TYPE})${device_page_msg}

- Device: ${CODENAME}
- Version: ${VERSION}
- Build Type: ${DEPLOY_TYPE}
- Build Date: ${BUILD_DATE_FORMATTED}
${device_page_note:+$device_page_note}

Automated update from PBRP build system"

    # Commit changes
    if git commit -m "$COMMIT_MSG"; then
        echo -e "${green}✅ Changes committed successfully${nocol}"
    else
        echo -e "${red}❌ Failed to commit changes${nocol}"
        cd ..
        return 1
    fi

    # Push to GitHub
    echo -e "${cyan}Pushing changes to repository...${nocol}"
    if git push origin; then
        echo -e "${green}✅ Changes pushed to GitHub successfully${nocol}"
    else
        echo -e "${red}❌ Failed to push changes${nocol}"
        echo -e "${yellow}⚠️  Please check your git credentials or GH_BOT_TOKEN${nocol}"
        cd ..
        return 1
    fi

    cd ..
    return 0
}

# Cleanup function
cleanup() {
    echo -e "${cyan}Cleaning up temporary files...${nocol}"
    rm -f "/tmp/builds-${CODENAME}-temp.json"
    rm -f "/tmp/pb_devices.json"
    # Clean up cloned repository
    if [ -d "PitchBlackRecoveryProject.github.io" ]; then
        rm -rf "PitchBlackRecoveryProject.github.io"
    fi
}

# Set trap for cleanup
trap cleanup EXIT

# Main execution
echo -e "${green}=== PBRP JSON Build Updater with Device Page Creation (GitHub Actions) ===${nocol}"
echo -e "${cyan}Only OFFICIAL and BETA builds will be processed${nocol}"
echo

# Call the main function
if update_builds_json; then
    echo
    echo -e "${green}🎉 === JSON UPDATE COMPLETED SUCCESSFULLY === 🎉${nocol}"
    echo -e "${green}✅ Device: ${CODENAME}${nocol}"
    echo -e "${green}✅ Version: ${VERSION} (${DEPLOY_TYPE})${nocol}"
    echo -e "${green}✅ JSON file updated and pushed to ${TARGET_REPO}${nocol}"
    if [ "$DEVICE_NAME" != "Unknown Device" ]; then
        echo -e "${green}✅ Device page: _oem/${VENDOR}/${CODENAME}.md${nocol}"
    fi
    echo
    exit 0
else
    echo
    echo -e "${red}❌ === JSON UPDATE FAILED === ❌${nocol}"
    echo -e "${red}Please check the error messages above${nocol}"
    echo
    exit 1
fi
