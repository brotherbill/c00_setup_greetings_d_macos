# greetings_d

Minimal D project with working macOS Apple Silicon build and F5 debug setup in VS Code.


## Express Route

These are the shortest known-good steps to go from a mostly reset Mac mini to a working D setup for this repo.

**Note:**
You can also follow these steps on a mature developer's machine that already has VS Code, XCode, or other tools installed. In that case, you may safely skip or skim steps for software you already have. There is no harm in re-running these steps; at worst, you may be prompted to confirm or update existing installations, but nothing will be broken or lost.

## 1. Software Update

Update to latest version of Mac OS.

## 2. Install XCode

Use Apple Store to install XCode.
Open XCode, then close it.


## 3. Install VS Code

1. Go to: https://code.visualstudio.com

2. Download the installer for macOS (Apple Silicon if available).

3. Open the downloaded file and drag Visual Studio Code to the Applications folder.

4. Launch VS Code from Applications.

5. (Optional) Add VS Code to your PATH for command-line launching:

  Open VS Code, press `Windows+Shift+P`, type `Shell Command: Install 'code' command in PATH` and run it.

6. Open Terminal, create `~/dev/d` and clone this repository:

  ```bash
  mkdir -p ~/dev/d
  
  cd ~/dev/d
  
  git clone https://github.com/brotherbill/c00_setup_greetings_d_macos.git
  
  cd c00_setup_greetings_d_macos
  ```

7. Close Terminal

8. Open VS Code, open folder to ~/dev/d/c00_setup_greetings_d_macos

   (*Trust the authors if prompted*)

9. Close VS Code

## 4. Download LDC Instead of DMD

DMD has no native arm64 macOS build. The x86_64 DMD binary (v2.112.0) was tried under Rosetta, but it
hangs at startup in `rt.sections_darwin.getTLSRange` — the D runtime's Thread Local Storage detection
code is incompatible with Rosetta's TLS emulation on Apple Silicon. This is a known, unfixed limitation;
the official dlang.org install script explicitly states that DMD does not support macOS aarch64/arm64.
LDC is the correct compiler for Apple Silicon Macs.

Visit  https://github.com/ldc-developers/ldc/releases

Download the current macOS ARM64 archive.

Example:

```text
ldc2-1.42.0-osx-arm64.tar.xz
```

Expand it in Finder.

If macOS blocks `ldc2` or `dub` the first time you run them:

1. Click `Done`.
2. Open `System Settings` -> `Privacy & Security`.
3. Click `Open Anyway` for the blocked binary.

Close browser, Finder and Terminal.

## 5. Move the Toolchain to a Stable Folder

Do not keep the compiler in Downloads as this is too volatile a folder for long term assets.

In Terminal, run:

```bash
mkdir -p ~/tools

mv ~/Downloads/ldc2-1.42.0-osx-arm64 ~/tools/
```

Final tool location:

```bash
~/tools/ldc2-1.42.0-osx-arm64
```

Close Terminal.

## 6. Add LDC and DUB to PATH

Run these in Terminal, one command at a time.

1. This documents the minimal, safe steps to add LDC (the D compiler) and DUB to your `PATH` by creating `~/.zprofile`.

   Summary (baby steps):

   1. Set your home directory as working directory:

   ```bash
   cd ~
   ```

   2. Create `~/.zprofile` with the following contents. Use the heredoc below — the closing `EOF` is only a delimiter and will not be written into the file.
      1. Get file from https://www.adrive.com/public/Rz3zaP/zprofile.txt

   ```bash
   cat > ~/.zprofile <<'EOF'
   if [ -x /opt/homebrew/bin/brew ]; then
       eval "$(/opt/homebrew/bin/brew shellenv)"
   fi
   
   if [ -d "$HOME/tools/ldc2-1.42.0-osx-arm64/bin" ]; then
       export PATH="$HOME/tools/ldc2-1.42.0-osx-arm64/bin:$PATH"
   fi
   EOF
   ```

   Notes:

   - Do NOT leave a literal `EOF` line inside the saved `~/.zprofile`. `EOF` is only the heredoc delimiter used when creating the file.
   - Using `<<'EOF'` writes the literal `$HOME` into the file. That's fine and portable — it will expand when the shell sources the file.

   3. If you downloaded LDC and macOS flagged the binaries, remove quarantine
   and create a short `ldc` symlink so `ldc` is available alongside `ldc2`.

   ```bash
   /usr/bin/xattr -dr com.apple.quarantine "$HOME/tools/ldc2-1.42.0-osx-arm64/bin"
   /bin/ln -sf "$HOME/tools/ldc2-1.42.0-osx-arm64/bin/ldc2" "$HOME/tools/ldc2-1.42.0-osx-arm64/bin/ldc"
   ```

   4. Apply the new profile immediately in the current session:

   ```bash
   source ~/.zprofile
   ```

   5. Verify the binaries are on your `PATH` (run one or both):

   ```bash
   command -v ldc || which ldc
   command -v dub || which dub
   echo "$PATH" | tr ':' '\n'  # optional: inspect PATH entries
   ```

   6. If you use `~/.zshrc` and it doesn't pick up `~/.zprofile` for interactive shells, add this line to `~/.zshrc`:

   ```bash
   source ~/.zprofile
   ```

   7. If changes don't persist in new terminal windows, restart your terminal or log out/in.

   If you'd like, I can also:

   - verify the file contents for you (you can paste `cat -n ~/.zprofile` output),
   - or update `~/.zshrc` to source `~/.zprofile`.

   Additional actions performed (record):

   - These steps (removing quarantine and creating a short `ldc` symlink) were moved into Step 6 above so `ldc` is available before verification. If you prefer the explicit commands recorded here as well, I can restore them.

   These actions were taken on Mar 27

1. Close Terminal.

## 7. Verify the Toolchain

Run these in Terminal, one command at a time.

If any command prints `zsh: killed`, do this before retrying that same command:

1. Click `Done` on the macOS dialog.
2. Open `System Settings` -> `Privacy & Security`.
3. Click `Open Anyway` for the blocked binary (`dub` or `ldc2`).
4. Authenticate when prompted.
5. Re-run only the command that was blocked.

```bash
dub --version | head -n 1
```

```bash
ldc2 --version | head -n 1
```

```bash
which dub
```

```bash
which ldc2
```

Expected result:

- `dub --version` prints DUB version information
- `ldc2 --version` prints compiler version information
- `which dub` prints a path under `/Users/<your-user>/tools/ldc2-1.42.0-osx-arm64/bin/dub`
- `which ldc2` prints a path under `/Users/<your-user>/tools/ldc2-1.42.0-osx-arm64/bin/ldc2`
- You may need to approve `dub` and `ldc2` separately in `Privacy & Security`.

## 8. Open This Repo in VS Code

Open the folder for this repo in VS Code.

Reference paths for this setup:

- Parent folder: `/Users/bb/dev/d`
- Repo folder: `/Users/bb/dev/d/c00_setup_greetings_d_macos`

Optional terminal check (one command at a time):

```bash
cd /Users/bb/dev/d/c00_setup_greetings_d_macos
```

```bash
pwd
```

```bash
cd ..
```

```bash
pwd
```

## 9. Set VS Code Theme (Course Standard)

Course standard:

- Use `Default High Contrast` (dark, high contrast).

In VS Code:

1. Open `Code` -> `Settings` -> `Theme` -> `Color Theme`
2. Choose `Default High Contrast`

Light theme options for students who prefer light mode:

- `Default Light Modern`
- `Default High Contrast Light`

Students may use any color theme that is comfortable and readable for them.

## 10. Install VS Code Extensions

Open the Extensions view:

- Click the Extensions icon in the left Activity Bar (looks like four squares), or
- Press `Cmd+Shift+X`

Install these extensions one at a time:

1. `code-d` by `WebFreak`
2. `CodeLLDB` by `Vadim Chugunov`

For each extension:

1. Type the name in the Extensions search box.
2. Click the extension in the search results to open it in the center pane.
3. Click the `Install` button in the center pane — do not use the Install button in the left search results list, as it is easy to accidentally install the wrong extension.

If VS Code asks, allow the publisher and continue installation.

## 11. Build the Project

This repo already includes the needed VS Code files:

- `.vscode/tasks.json`
- `.vscode/launch.json`

Run these in Terminal, one command at a time.

1. Navigate to the repo folder:

```bash
cd ~/dev/d/c00_setup_greetings_d_macos
```

(`~` is shorthand for your home folder — for example, `/Users/bb` on the instructor's setup.)

2. Confirm you are in the right folder:

```bash
pwd
```

Expected result: `/Users/<your-username>/dev/d/c00_setup_greetings_d_macos`

3. Build the project:

```bash
dub build --build=debug --compiler=ldc2
```

## 12. Debug with F5

Open `source/app.d`, set a breakpoint, then press `F5`.

If VS Code asks you to choose a debug configuration, select:

```text
Debug greetings_d
```

On the first debug run on macOS, you may be prompted for your sudo password. This allows the debugger to attach to the process. Enter the password and continue.

Expected result:

- the build runs first
- the debugger stops at the breakpoint
- pressing `F10` advances execution
- program output appears in the VS Code Terminal pane

For this repo, the output is:

```text
Greetings from D!
```

## Current Workspace Configuration

Build task:

```json
{
	"label": "dub: build debug",
	"type": "shell",
	"command": "dub",
	"args": ["build", "--build=debug", "--compiler=ldc2"]
}
```

Launch config:

```json
{
	"name": "Debug greetings_d",
	"type": "lldb",
	"request": "launch",
	"cwd": "${workspaceFolder}",
	"program": "${workspaceFolder}/greetings_d",
	"preLaunchTask": "dub: build debug",
	"console": "integratedTerminal"
}
```

## Troubleshooting

- If `ldc2` or `dub` is blocked by macOS, use `System Settings` -> `Privacy & Security` -> `Open Anyway`.
- If `ldc2` or `dub` is `command not found`, open a new terminal or run `source ~/.zprofile`.
- If the build fails because the toolchain moved, restore it to `~/tools/ldc2-1.42.0-osx-arm64` or update `~/.zprofile`.
- If debug runs but no output appears in the terminal pane, confirm `.vscode/launch.json` uses `"console": "integratedTerminal"`.
- If you try the official DMD macOS package on Apple Silicon, it may crash with a segmentation fault. LDC is the working path documented here.

## Quick Sanity Check (macOS)

After setup, run this from the repo root:

```bash
./sanity_check_macos.sh
```

It verifies:

- `dub` and `ldc2` are in `PATH`
- debug build works with `ldc2`
- `.vscode/tasks.json` uses `dub: build debug` with `ldc2`
- `.vscode/launch.json` uses `lldb` with `preLaunchTask` set to `dub: build debug`
