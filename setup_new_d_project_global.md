# setup_new_d_project_global.sh

Installs `new_d_project.sh` globally so you can create new D projects from any directory.

## What It Does

1. Copies `new_d_project.sh` and `sanity_check_macos.sh` to `~/scripts/`.
2. Creates a wrapper script at `~/scripts/new_d_project` (no `.sh` extension) for convenient calling.
3. Adds `~/scripts` to your `PATH` in `~/.zprofile` (macOS) or `~/.bashrc` (Linux) if not already present.

## Prerequisites

- Run from the project directory that contains `new_d_project.sh`.
- `bash` must be available.

## Step-by-step

1. Navigate to this project's directory:
   ```bash
   cd ~/dev/d/c00_setup_greetings_d_macos_template
   ```

2. Make the script executable (*first time only*):
   ```bash
   chmod +x setup_new_d_project_global.sh
   ```

3. Run:
   ```bash
   bash setup_new_d_project_global.sh
   ```

4. Apply the PATH change to your current terminal session:
   ```bash
   source ~/.zprofile
   ```

5. Verify the tool is available:
   ```bash
   which new_d_project
   ```
   Expected output: `/Users/<your-username>/scripts/new_d_project`

## Expected Output

```
Added /Users/<your-username>/scripts to your PATH. Restart your terminal or run: source ~/.zprofile
new_d_project is now globally available. You can call it from any folder:
new_d_project my_new_project 'My new D project'
```

If `~/scripts` was already in your PATH:
```
/Users/<your-username>/scripts is already in your PATH.
new_d_project is now globally available. You can call it from any folder:
new_d_project my_new_project 'My new D project'
```

## Notes

- Re-running this script is safe. It will overwrite the previously installed copy with the latest version.
- If you update `new_d_project.sh` or `sanity_check_macos.sh`, re-run this script to push the updates globally.
- The wrapper at `~/scripts/new_d_project` simply calls the versioned `new_d_project.sh`; both files are installed.
