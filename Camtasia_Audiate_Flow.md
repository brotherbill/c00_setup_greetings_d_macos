# Camtasia, Audiate, and Adobe Podcast Enhancer — Mac OS (for Windows/Linux devs)

> **Note:** <kbd>Cmd</kbd> = Apple/Home/Windows key (not Ctrl)

## Assumptions
- Camtasia, Audiate, and Adobe Podcast Enhancer are installed on Mac OS.

## 0. Create folder in ~/Movies/1_software_update (or other step name)

## 1. Record Screen (Camtasia)
1. <kbd>Cmd</kbd> + <kbd>Space</kbd>, type `Camtasia`, <kbd>Return</kbd>
1. Click **New Recording** (brings up Camtasia Editor Recorder)
1.  Disable Camtasia Rev
1. Click big red **Rec** to start
1. Click big red **Rec** twice to stop
1. No pause/delete during record (unlike Windows)

## 2. Export Audio (.wav)
1. File > Export > Export Audio Only...
1. Folder: 1_setup_d_environment_for_macos (or other)
1. Name: 1_software_update_RAW.wav (or other)
1. Format: .wav
1. Click Export
1. Click Reveal in Finder


## 3. Enhance Audio (Adobe)
1. Visit: https://podcast.adobe.com/en/enhance
1. Drag/drop .wav file.  (*Wait a minute for audio enhancements*)
1. Close Finder containing RAW file.
1. Click Download
1. Open Downloads folder and rename file:
    1. In Terminal: `open ~/Downloads` and rename as needed.
    1. Rename to `~/Downloads/1_software_update_ADOBE_ENHANCED.wav`

## 4. Replace raw audio with Adobe Enhanced audio
1. Drag ~/Downloads/1_software_update_ADOBE_ENHANCED.wav to Camtasia > Media Bin
1. Close Finder containing ADOBE_ENHANCED.wav file
1. With timeline head at 0:00:00;00, right-click on ADOBE_ENHANCED.wav file > Add to Timeline at Playhead.
1. Rename Track 1 to Video.
1. Rename Track 2 to Audio.
1. Right-click on Video timeline, then right-click Silence Audio

## 5. Edit in Audiate
1. 