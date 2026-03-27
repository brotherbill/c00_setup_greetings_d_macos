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

sed_in_place() {
    local expr="$1"
    local file="$2"
    if [ "$(uname)" = "Darwin" ]; then
        sed -i '' "$expr" "$file"
    else
        sed -i "$expr" "$file"
    fi
}

escape_sed_replacement() {
    printf '%s' "$1" | sed 's/[\\/&|]/\\&/g'
}

if [ -d "$DEST" ]; then
    echo "[INFO] The directory '$DEST' already exists. Please choose a different project name or delete the existing directory if you want to recreate it. No files were changed."
    exit 0
fi

# Case-insensitive check for existing directories in current directory
NAME_LOWER="$(printf '%s' "$NAME" | tr '[:upper:]' '[:lower:]')"
for dir in */; do
    dir_name="${dir%/}"
    dir_name_lower="$(printf '%s' "$dir_name" | tr '[:upper:]' '[:lower:]')"
    if [ "$dir_name_lower" = "$NAME_LOWER" ]; then
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
NAME_ESCAPED="$(escape_sed_replacement "$NAME")"
while IFS= read -r -d '' file; do
    sed_in_place "s|c00_greetings_d_wsl_ubuntu_template|$NAME_ESCAPED|g" "$file"
done < <(find "$DEST" -type f \( -name '*.md' -o -name '*.json' -o -name '*.d' -o -name '*.gitignore' \) -print0)

# Update description in dub.json
DUB_FILE="$DEST/dub.json"
if [ -f "$DUB_FILE" ]; then
    DESCRIPTION_ESCAPED="$(escape_sed_replacement "$DESCRIPTION")"
    sed_in_place "s|\("description": \)\".*\"|\1\"$DESCRIPTION_ESCAPED\"|" "$DUB_FILE"
fi

# Update description in launch.json if present
LAUNCH_FILE="$DEST/.vscode/launch.json"
if [ -f "$LAUNCH_FILE" ]; then
    DESCRIPTION_ESCAPED="$(escape_sed_replacement "$DESCRIPTION")"
    sed_in_place "s|\("description": \)\".*\"|\1\"$DESCRIPTION_ESCAPED\"|" "$LAUNCH_FILE"
fi
