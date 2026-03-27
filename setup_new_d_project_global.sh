#!/bin/bash
# This script sets up new_d_project.sh for global use by copying it to ~/scripts and updating the PATH if needed.
# Usage: Run this script from the project folder containing new_d_project.sh

SCRIPT_NAME="new_d_project.sh"
SANITY_SCRIPT_NAME="sanity_check_macos.sh"
USER_SCRIPTS="$HOME/scripts"
SOURCE="$(pwd)/$SCRIPT_NAME"
DEST="$USER_SCRIPTS/$SCRIPT_NAME"
WRAPPER="$USER_SCRIPTS/new_d_project"
SOURCE_SANITY="$(pwd)/$SANITY_SCRIPT_NAME"
DEST_SANITY="$USER_SCRIPTS/$SANITY_SCRIPT_NAME"

# Create scripts directory if it doesn't exist
if [ ! -d "$USER_SCRIPTS" ]; then
    mkdir -p "$USER_SCRIPTS"
fi

# Copy new_d_project.sh to scripts directory
cp "$SOURCE" "$DEST"
chmod +x "$DEST"

# Copy sanity script to scripts directory when present.
if [ -f "$SOURCE_SANITY" ]; then
    cp "$SOURCE_SANITY" "$DEST_SANITY"
    chmod +x "$DEST_SANITY"
fi

# Create a wrapper script for easy calling
cat > "$WRAPPER" << EOF
#!/bin/bash
"$DEST" "\$@"
EOF
chmod +x "$WRAPPER"

# Detect shell profile file (macOS uses .zprofile, Linux uses .bashrc)
if [ "$(uname)" = "Darwin" ]; then
    PROFILE="$HOME/.zprofile"
else
    PROFILE="$HOME/.bashrc"
fi

# Add scripts directory to PATH in profile if not already present
if ! grep -q 'HOME/scripts' "$PROFILE" 2>/dev/null; then
    echo 'export PATH="$HOME/scripts:$PATH"' >> "$PROFILE"
    export PATH="$HOME/scripts:$PATH"
    echo "Added $USER_SCRIPTS to your PATH. Restart your terminal or run: source $PROFILE"
else
    echo "$USER_SCRIPTS is already in your PATH."
fi

echo "new_d_project is now globally available. You can call it from any folder:"
echo "new_d_project my_new_project 'My new D project'"