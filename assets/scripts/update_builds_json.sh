#!/bin/bash
#
# JSON Build Update Script for PBRP (GitHub Actions Compatible)
#
# Copyright (C) 2019 - 2020, PitchBlack Recovery Project
# This script updates the builds JSON file for PBRP releases
# Only updates for BETA and OFFICIAL builds, always auto-pushes
#
# Usage: ./update_builds_json.sh CODENAME VERSION DEPLOY_TYPE SF_LINK GH_LINK [CHANGELOG]
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
    echo -e "${cyan}Usage: $0 CODENAME VERSION DEPLOY_TYPE SF_LINK GH_LINK [CHANGELOG]${nocol}"
    echo -e "${cyan}Example: $0 rolex 3.1.0 OFFICIAL 'https://sf.net/...' 'https://github.com/...' 'Updated recovery'${nocol}"
    echo
    echo -e "${yellow}Arguments:${nocol}"
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
if [ $# -lt 5 ]; then
    echo -e "${red}Error: Insufficient arguments${nocol}"
    show_usage
    exit 1
fi

# Parse arguments
CODENAME=$1
VERSION=$2
DEPLOY_TYPE=$3
SF_LINK=$4
GH_LINK=$5
CHANGELOG=${6:-""}

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

# Check if git is available
if ! command -v git &> /dev/null; then
    echo -e "${red}Error: git is required but not installed.${nocol}"
    exit 1
fi

# Generate BUILD_DATE if not set
if [ -z "$BUILD_DATE" ]; then
    export TZ="Asia/Kolkata"
    BUILD_DATE=$(date +%Y%m%d)
fi

# JSON Build Update Function
function update_builds_json() {
    echo -e "${cyan}=== Starting JSON Update Process ===${nocol}"
    echo -e "${cyan}Device: ${CODENAME}${nocol}"
    echo -e "${cyan}Version: ${VERSION}${nocol}"
    echo -e "${cyan}Build Type: ${DEPLOY_TYPE}${nocol}"
    echo

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
        echo -e "${yellow}⚠️  Please create _oem/\${VENDOR}/\${CODENAME}.md & submit PR to: https://github.com/PitchBlackRecoveryProject/PitchBlackRecoveryProject.github.io${nocol}"
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
    echo -e "${cyan}=== Committing and Pushing JSON Changes ===${nocol}"
    
    cd "$REPO_DIR"
    
    # Configure git for GitHub Actions
    git config user.name "$GITHUB_ACTOR"
    git config user.email "$GITHUB_EMAIL"
    
    # Set up authentication for GitHub Actions
    if [ -n "$GH_BOT_TOKEN" ]; then
        git remote set-url origin "https://${GH_BOT_TOKEN}@github.com/${TARGET_REPO}.git"
    fi
    
    # Add the JSON file
    git add "assets/json/builds-${CODENAME}.json"
    
    # Check if there are changes to commit
    if git diff --cached --quiet; then
        echo -e "${yellow}No changes to commit${nocol}"
        cd ..
        return 0
    fi
    
    # Commit the changes
    COMMIT_MSG="🤖 Update ${CODENAME} to ${VERSION} (${DEPLOY_TYPE})

- Device: ${CODENAME}
- Version: ${VERSION}
- Build Type: ${DEPLOY_TYPE}
- Build Date: ${BUILD_DATE_FORMATTED}

Automated update from PBRP build system"
    
    git commit -m "$COMMIT_MSG"
    
    if [ $? -ne 0 ]; then
        echo -e "${red}❌ Failed to commit changes${nocol}"
        cd ..
        return 1
    fi
    
    echo -e "${green}✅ Changes committed successfully${nocol}"
    
    # Always push changes (auto-push is always enabled)
    echo -e "${cyan}Pushing changes to repository...${nocol}"
    
    # Push Changes To GitHub
    if git push origin 2>/dev/null; then
        echo -e "${green}✅ Changes pushed to github successfully${nocol}"
    else
        echo -e "${red}❌ Failed to push changes${nocol}"
        echo -e "${yellow}Please check your git credentials or GH_BOT_TOKEN${nocol}"
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
    # Clean up cloned repository
    if [ -d "PitchBlackRecoveryProject.github.io" ]; then
        rm -rf "PitchBlackRecoveryProject.github.io"
    fi
}

# Set trap for cleanup
trap cleanup EXIT

# Main execution
echo -e "${green}=== PBRP JSON Build Updater (GitHub Actions) ===${nocol}"
echo -e "${cyan}Only OFFICIAL and BETA builds will be processed${nocol}"
echo

# Call the main function
if update_builds_json; then
    echo
    echo -e "${green}🎉 === JSON UPDATE COMPLETED SUCCESSFULLY === 🎉${nocol}"
    echo -e "${green}✅ Device: ${CODENAME}${nocol}"
    echo -e "${green}✅ Version: ${VERSION} (${DEPLOY_TYPE})${nocol}"
    echo -e "${green}✅ JSON file updated and pushed to ${TARGET_REPO}${nocol}"
    echo
    exit 0
else
    echo
    echo -e "${red}❌ === JSON UPDATE FAILED === ❌${nocol}"
    echo -e "${red}Please check the error messages above${nocol}"
    echo
    exit 1
fi
