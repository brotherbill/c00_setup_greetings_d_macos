# 2 Installing serve-d (D Language Server) on macOS Apple Silicon

The purpose of this installation step is to suppress the notification to add serve-d, by giving in and installing serve-d.  serve-d is not used in the course, but I have OCD, and can't tolerate that incessant notification.

serve-d is the D language server used by the VS Code `code-d` extension for autocomplete,
go-to-definition, linting, and other IDE features. The stable release only has an x86_64
macOS binary. For Apple Silicon (arm64), use the nightly pre-built binary.

## Prerequisites

- macOS Apple Silicon (arm64)
- Use Terminal for each of these steps

## Steps

### 0. Open VS Code 
1. Open folder:  `~/dev/d/c00_setup_greetings_d_macos_template`
1. Open `clipboards` folder
1. Open `2 Install serve-db Mac OS.txt`
    1. This is your source for Copy and Paste into Terminal

### 1. Create a directory for serve-d

```bash
mkdir -p ~/tools/serve-d
```

### 2. Download the latest nightly ARM64 binary

This is one line of code:

```bash
curl -L -o ~/tools/serve-d/serve-d.tar.gz
  https://github.com/Pure-D/serve-d/releases/download/nightly/serve-d_osx-nightly-arm64-20251231-3c1601.tar.gz
```

> **Note:** Check https://github.com/Pure-D/serve-d/releases/tag/nightly for a newer
> `serve-d_osx-nightly-arm64-*.tar.gz` asset if you want the latest build.

### 3. Extract the archive

```bash
tar -xzf ~/tools/serve-d/serve-d.tar.gz -C ~/tools/serve-d/
```

### 4. Verify the extracted binary

```bash
ls ~/tools/serve-d/
```

Expected output includes `serve-d` (the binary).

### 5. Make it executable

```bash
chmod +x ~/tools/serve-d/serve-d
```

### 6. Test the binary

```bash
~/tools/serve-d/serve-d --version
```

### 7. Configure VS Code to use it

Windows means Windows key or Home key or Command key.

Open VS Code.

User Settings JSON (`Windows+Shift+P` → `Preferences: Open User Settings (JSON)`) and append:

```json
"d.servedPath": "/Users/<your-username>/tools/serve-d/serve-d"
```

Be sure to append a comma to prior line, as this is a JSON file.

Replace `<your-username>` with your macOS username (e.g. `bb`).

Save. 

Close VS Code.

### 8. Reload VS Code

Open VS Code.

Windows means Windows key or Home key or Command key.

`Windows+Shift+P` → `Developer: Reload Window`.

Open Folder: `~/dev/d/c00_setup_greetings_d_macos`_template

The `serve-d not installed` notification should no longer appear, and D language
features (autocomplete, hover, go-to-definition) will be active.

Close VS Code.

## Updating serve-d

To update, download a newer nightly ARM64 asset and overwrite the existing binary:

```bash
curl -L -o ~/tools/serve-d/serve-d.tar.gz
  https://github.com/Pure-D/serve-d/releases/download/nightly/<new-filename>.tar.gz
  
tar -xzf ~/tools/serve-d/serve-d.tar.gz -C ~/tools/serve-d/

chmod +x ~/tools/serve-d/serve-d
```

Then reload VS Code.

## Notes

- The nightly binary is updated on successful CI commits; it is generally stable.
- The `d.servedPath` setting is a VS Code **User** setting (not workspace), so it applies
  to all D projects automatically.
- Do not use the `Compile serve-d` button in the VS Code notification — it requires DMD,
  which does not work on macOS Apple Silicon.
