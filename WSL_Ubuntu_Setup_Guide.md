# WSL Ubuntu Setup Guide

This guide will walk you through setting up **WSL** for **Ubuntu**, installing **Ubuntu** and configuring **VS Code** and **D** Language development on a fresh **Windows 11** device. (*This will also work for a mature development machine*)

... (truncated for brevity) ...

## Step 8: Start with the Project Template

1. Open **VS Code**, close **Welcome** tab
2. Open **Terminal**
3. Clone the starter project repository
   1. Run `git clone https://github.com/brotherbill/c00_setup_greetings_d_macos_template.git`
      1. This is one line, even though it may wrap around
4. Place the template and all your course projects in the directory `~/dev/d/` in your Ubuntu home folder.
   1. Run `mkdir -p ~/dev/d`
   2. Run `cd ~/dev/d`
   3. Run `git clone https://github.com/brotherbill/c00_setup_greetings_d_macos_template.git`
      1. This will create a folder named `c00_setup_greetings_d_macos_template` inside `~/dev/d/` with all the necessary files and configuration for **D** development and debugging.
5. **Warning:**  This template is intended only for testing your **D** installation and as a base for creating new **D** language projects.  It provides a ready-to-use programming environment with debugging support, so you can avoid tedious setup steps.  **Do not edit or delete this template folder**.
6. **File > Open Folder** and select **/home/bb/dev/d/c00_setup_greetings_d_macos_template** folder
   1. If asked **Do you trust the authors of the files in this folder?**
      1. Check **Trust the authors of all files in the parent folder 'd'**
      2. Click **Yes, I trust the Authors** button
7. Close **VS Code**

## Step 9: Debug D with F5

1. Open **VS Code**, close **Welcome** tab
2. **Set a breakpoint**
   1. **Open source/app.d**
   2. Click to the left of line 5 to set a breakpoint.
      1. A red dot will appear, which is the breakpoint.
3. **Start Debugging**
   1. Press **F5** to start debugging
      1. The debugger will start, and your program will pause at the breakpoint.  You can now inspect variables, step through code and use the debug console.
4. Close **VS Code**

**Congratulations, your development environment is set up, and you may now start the main body of the course, learning D language**
