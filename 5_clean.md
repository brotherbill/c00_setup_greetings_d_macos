# 5_clean.md

## clean.sh — Remove D Build Artifacts

This document explains how to use `clean.sh` to safely remove build artifacts from the greetings_d D project on macOS.

### What It Does
- Deletes the `.dub/` and `dub/` build directories if they exist.
- Removes the compiled executable (`greetings_d`) and object file (`greetings_d.o`) from the project root, `source/`, `bin/`, and `build/` directories if present.
- Ensures you are running from the correct project root by checking for `dub.json` with the correct project name.

### Usage
1. Open a terminal and navigate to your greetings_d project root (where `dub.json` is located).
2. Run:
   ```sh
   ./clean.sh
   ```

### Safety
- The script checks for the correct project root before deleting anything.
- Only files and folders related to the build are removed.

### Example Output
```
Removing .dub/ directory...
Removing greetings_d...
Removing greetings_d.o...
```

If nothing needs to be removed, the script will exit quietly.

---

For more details, see the comments in `clean.sh`.
