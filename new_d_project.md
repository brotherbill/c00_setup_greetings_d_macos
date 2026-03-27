# new_d_project.sh

Creates a new D project from the template repository in any directory.

## What It Does

1. Clones the template repo `c00_greetings_d_wsl_ubuntu_template` into a new folder named `<project_name>`.
2. Removes the project-creation scripts from the new project (they are not needed there).
3. Copies `sanity_check_macos.sh` into the new project.
4. Replaces all references to the template name with your `<project_name>` in `.md`, `.json`, `.d`, and `.gitignore` files.
5. Updates the `"description"` field in `dub.json` and `.vscode/launch.json` with your `<description>`.

## Prerequisites

- Run `setup_new_d_project_global.sh` once first so `new_d_project` is available globally.
- `git` must be available and able to reach GitHub.

## Usage

```bash
new_d_project <project_name> "<description>"
```

- `<project_name>` — name of the new project directory to create (must not already exist, case-insensitive).
- `<description>` — short description string; quote it if it contains spaces.

## Step-by-step

1. Navigate to the parent directory where you want the new project created:
   ```bash
   cd ~/dev/d
   ```

2. Create the project:
   ```bash
   new_d_project my_new_project "My new D project"
   ```

3. Enter the new project:
   ```bash
   cd my_new_project
   ```

4. Run the sanity check to confirm the build and debug setup:
   ```bash
   ./sanity_check_macos.sh
   ```

5. Open in VS Code:
   ```bash
   code .
   ```

## Example

```bash
mkdir -p ~/dev/d && cd ~/dev/d
new_d_project hello_world "Hello World in D"
cd hello_world
./sanity_check_macos.sh
code .
```

## Expected Output

```
Cloning into 'my_new_project'...
remote: Enumerating objects: ...
...
```

## Notes

- If the directory `<project_name>` already exists (case-insensitive match), the script exits safely with no changes.
- The script is cross-platform: it works on macOS and Linux.
- To test from a different directory than the project root, use the globally installed wrapper: `new_d_project` (installed by `setup_new_d_project_global.sh`).
