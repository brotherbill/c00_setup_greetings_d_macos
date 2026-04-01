

# Camtasia Mac to Windows Workflow

This guide covers moving a Camtasia project from Mac to Windows for advanced editing (including Audiate integration).

## 0. Create Transfer Folder on Mac
1. In Terminal, run:
	```bash
	mkdir -p ~/Movies/camtasia_transfer/
	```

## 1. Record on Mac
1. Open Camtasia for Mac
2. When saving, use the path `~/Movies/camtasia_transfer/` 

## 2. Capture Video (Detailed Steps)
1. Open Camtasia
2. Click **New Recording**, then click big red **rec** button
3. Do your "Show and Tell"
4. Ensure all windows to be recorded are on the right monitor
5. Click **Rec** once or twice to end recording
6. <kbd>Cmd</kbd> + S to save
    1. Save As: **1_software_updates.cmproj**
    1. Folder: **camtasia_transfer**
    1. Click: **Save** button

## 3. Dehydrate on Mac (Export for Windows)
1. **File > Export > Project for Windows...**
2. Save Zip as: **1_software_updates.zip**
3. Save folder: **camtasia_transfer**
4. Click **Save**, then click **Close**
5. Drag `~/Movies/1_software_updates.zip` to DropBox

## 4. Rehydrate on Windows
1. Download `1_software_updates.zip` from DropBox to **Downloads** folder.
2. Copy to **Videos** folder.
3. **cd Videos**
4. **Expand zip file.**
5. **Add** empty folders **edit** and **out**.

## 5. Export Audio for Enhancement (Windows)
1. In Camtasia for Windows, select the Audio track (already separated).
2. **Select** the Audio track.  **Export > Export Audio Only...**
3. **Save** as a **.wav** file in the **edit** folder (e.g., `edit/1_software_updates_raw.wav`).
4. **Upload** the exported .wav file to Adobe Podcast for audio enhancement.
5. **Download** the enhanced .wav file from Adobe Podcast when processing is complete.

## 6. Edit on Windows (Camtasia + Audiate)
- Continue all further editing, captions, and enhancements on Windows
- Use Audiate for captions and audio editing as needed

---

**Tip:** Always do all caption editing in Audiate before importing to Camtasia to avoid sync issues.
