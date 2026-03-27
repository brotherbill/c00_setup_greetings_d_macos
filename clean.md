# clean.sh (Beginner Guide)

This guide explains how to run `clean.sh` safely, step by step.

`clean.sh` deletes D build artifacts so your next build/debug run starts clean.

## What this script removes

| Artifact | Description |
|---|---|
| `.dub/` | dub cache and build metadata |
| `dub/` | dub output folder |
| `greetings_d` | compiled executable |
| `greetings_d.o` | object file |
| `greetings_d.dSYM/` | macOS debug symbol bundle (from ldc2) |

It also checks common subfolders for `greetings_d` and `greetings_d.o`:
`source/`, `bin/`, `build/`, `debug/`, `.dub/`, `.dub/obj/`, `.dub/build/`.

## Important safety rule

Run this script only from the `greetings_d` project root (the folder that contains `dub.json` with `"name": "greetings_d"`).

If you run it in the wrong place, the script stops with:

```text
Error: must be run from the greetings_d project root.
```

## Step-by-step (one command at a time)

1. Go to your project folder:

```bash
cd /path/to/c00_setup_greetings_d_macos
```

2. Confirm you are in the right folder:

```bash
pwd
```

3. (Optional but helpful) list current build artifacts before cleaning:

```bash
ls -la
```

4. Run the cleanup script:

```bash
./clean.sh
```

5. Build and debug again:

- In VS Code, press **F5**.

This triggers the task `dub: build debug` and recreates artifacts fresh.

## Typical output

You may see lines like:

```text
Removing .dub/ directory...
Removing dub/ directory...
Removing greetings_d...
Removing greetings_d.dSYM/ directory...
```

If a file/folder is not present, nothing is removed for that item.

## Troubleshooting

If `./clean.sh` says permission denied:

```bash
chmod +x clean.sh
./clean.sh
```

If the script says you are in the wrong directory, run:

```bash
pwd
cat dub.json
```

Make sure `dub.json` belongs to `greetings_d`, then run `./clean.sh` again.
