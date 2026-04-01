#!/bin/bash
# clean.sh - Remove dub build artifacts for macOS

# Must be run from the project root (where dub.json lives)

if [ ! -f "dub.json" ]; then
    echo "Error: dub.json not found. Must be run from the project root." >&2
    exit 1
fi

# Extract project name from dub.json
project_name=$(grep -o '"name"[[:space:]]*:[[:space:]]*"[^"]\+"' dub.json | head -n1 | sed 's/.*: *"\([^"]*\)"/\1/')
if [ -z "$project_name" ]; then
    echo "Error: Could not determine project name from dub.json." >&2
    exit 1
fi

# Remove .dub build folder
if [ -d ".dub" ]; then
    echo "Removing .dub/ directory..."
    rm -rf .dub
fi

# Remove dub build folder
if [ -d "dub" ]; then
    echo "Removing dub/ directory..."
    rm -rf dub
fi

target_name=$(grep -o '"targetName"[[:space:]]*:[[:space:]]*"[^"]\+"' dub.json | head -n1 | sed 's/.*: *"\([^"]*\)"/\1/')
if [ -z "$target_name" ]; then
    target_name="$project_name"
fi

# Remove executables and debug symbol files matching project name (macOS: no .exe/.obj/.pdb)
for f in "$target_name" "$target_name.o"; do
    if [ -e "$f" ]; then
        echo "Removing $f..."
        rm -f "$f"
    fi
    # Also check in source/ if present
    if [ -e "source/$f" ]; then
        echo "Removing source/$f..."
        rm -f "source/$f"
    fi
    # Also check in bin/ if present
    if [ -e "bin/$f" ]; then
        echo "Removing bin/$f..."
        rm -f "bin/$f"
    fi
    # Also check in build/ if present
    if [ -e "build/$f" ]; then
        echo "Removing build/$f..."
        rm -f "build/$f"
    fi
    # Also check in debug/ if present
    if [ -e "debug/$f" ]; then
        echo "Removing debug/$f..."
        rm -f "debug/$f"
    fi
    # Remove from .dub if present
    if [ -e ".dub/$f" ]; then
        echo "Removing .dub/$f..."
        rm -f ".dub/$f"
    fi
    # Remove from .dub/obj if present
    if [ -e ".dub/obj/$f" ]; then
        echo "Removing .dub/obj/$f..."
        rm -f ".dub/obj/$f"
    fi
    # Remove from .dub/build if present
    if [ -e ".dub/build/$f" ]; then
        echo "Removing .dub/build/$f..."
        rm -f ".dub/build/$f"
    fi
done

# Remove macOS debug symbol bundle produced by ldc2
if [ -d "$target_name.dSYM" ]; then
    echo "Removing $target_name.dSYM/ directory..."
    rm -rf "$target_name.dSYM"
fi
