# Creating a New D Project (Beginner)

This guide is for beginners. It explains how to create a new D project step by step, with extra commentary.

## What is a D project?
A D project is a collection of files for programming in the D language. This template helps you start quickly.

## Step-by-step Instructions

1. Make the setup script executable:
   ```bash
   chmod +x setup_new_d_project_global.sh
   ```
   This command gives permission to run the script.

2. Run the setup script:
   ```bash
   ./setup_new_d_project_global.sh
   
   source ~/.zprofile
   ```
   The first command sets up the project creation tool. The second command updates your PATH so you can use the tool anywhere.
   
3. Organize your projects and navigate to your projects folder:
   ```bash
   mkdir -p ~/dev/d
   
   cd ~/dev/d
   ```
   This creates a folder for your projects and moves you into it.

4. Create a new project:
   ```bash
   new_d_project <project_name> "<description>"
   ```
   Replace `<project_name>` with your project's name and `<description>` with a short description. Example:
   ```bash
   new_d_project my_new_project "My first D project"
   ```

5. Enter your new project and run the sanity check:
   ```bash
   cd <project_name>
   ./sanity_check_macos.sh
   ```
   This confirms your `dub`/`ldc2` setup, build task, and debug settings are ready.

## Tips
- If you see `bb` in example paths, that is the author's username. Use your own macOS username instead.
- If you get stuck, ask for help or search online. Take your time and read each step carefully.
