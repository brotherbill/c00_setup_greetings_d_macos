
# Camtasia Mac to Windows Workflow

This guide covers moving a Camtasia project from Mac to Windows for advanced editing (including Audiate integration).

## 0. Create Transfer Folder on Mac (Terminal Only)
- In Terminal, run:
	```bash
	mkdir -p ~/Movies/camtasia_transfer/
	```

## 1. Record on Mac
- Open Camtasia for Mac
- Record video/audio as usual
- When saving, use the path `~/Movies/camtasia_transfer/` (e.g., MyProject.tscproj). Use Terminal for navigation and file management whenever possible.

## 2. Dehydrate on Mac (Export for Windows)
- File > Export > Project for Windows...
- Save the resulting .zip file

## 3. Rehydrate on Windows
- Transfer .zip to Windows (USB, network, cloud, etc.)
- Unzip
- Open the .tscproj file in Camtasia for Windows

## 4. Save on Windows
- Save the project in your preferred location

## 5. Edit on Windows (Camtasia + Audiate)
- Continue all further editing, captions, and enhancements on Windows
- Use Audiate for captions and audio editing as needed

---

**Tip:** Always do all caption editing in Audiate before importing to Camtasia to avoid sync issues.
