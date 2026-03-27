#!/bin/bash
# Usage: new_d_project.sh <project_name> <description>
# <project_name> must be for a new project; do not use a name that matches an existing or similar project (case-ignorant) in this directory.

set -e

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <project_name> <description>"
    exit 1
fi

NAME="$1"
DESCRIPTION="$2"
REPO_URL="https://github.com/brotherbill/c00_greetings_d_wsl_ubuntu_template"
DEST="$NAME"

if [ -d "$DEST" ]; then
    echo "[INFO] The directory '$DEST' already exists. Please choose a different project name or delete the existing directory if you want to recreate it. No files were changed."
    exit 0
fi

# Case-insensitive check for existing directories in current directory
for dir in */; do
    dir_name="${dir%/}"
    if [[ "${dir_name,,}" == "${NAME,,}" ]]; then
        echo "[ERROR] A similar project already exists: '$dir_name'"
        exit 1
    fi
done

# If exact match (case-sensitive) still exists (should be caught above, but for safety)
if [ -d "$DEST" ]; then
    echo "[INFO] The directory '$DEST' already exists. Please choose a different project name or delete the existing directory if you want to recreate it. No files were changed."
    exit 0
fi

git clone "$REPO_URL" "$DEST"
if [ ! -d "$DEST" ]; then
    echo "Failed to clone repository."
    exit 1
fi

# Remove project creation scripts from the new project
rm -f "$DEST/new_d_project.ps1" "$DEST/setup_new_d_project_global.ps1" "$DEST/new_d_project.sh" "$DEST/setup_new_d_project_global.sh"

# Replace all references in all files
find "$DEST" -type f \( -name '*.md' -o -name '*.json' -o -name '*.d' -o -name '*.gitignore' \) -exec sed -i "s/c00_greetings_d_wsl_ubuntu_template/$NAME/g" {} +

# Update description in dub.json
DUB_FILE="$DEST/dub.json"
if [ -f "$DUB_FILE" ]; then
    sed -i "s/\("description": \)\".*\"/\1\"$DESCRIPTION\"/" "$DUB_FILE"
fi

# Update description in launch.json if present
LAUNCH_FILE="$DEST/.vscode/launch.json"
if [ -f "$LAUNCH_FILE" ]; then
    sed -i "s/\("description": \)\".*\"/\1\"$DESCRIPTION\"/" "$LAUNCH_FILE"
fi
