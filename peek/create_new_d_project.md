# Creating a New D Project (WSL-Ubuntu)

This guide explains how to create a new D project from the template using the provided Bash scripts.

## 1. Grant Execute Permission to setup_new_d_project_global.sh

Before running the setup script, make sure it is executable:

```bash
chmod +x setup_new_d_project_global.sh
```

## 2. Run the Setup Script

This will copy the project creation script to your user scripts directory and add it to your PATH:

```bash
./setup_new_d_project_global.sh

source ~/.zprofile
```

## 3. Create a New Project

You can now create a new project from anywhere:
```bash
new_d_project <project_name> "<description>"
```

Example:

```bash
cd ~/dev/d

new_d_project my_new_project "My new D project for WSL Ubuntu"
```

This will clone the template in ~/d/dev, update all references, and set your project description.

## 4. (Optional) Organize Your Projects

To keep your projects organized, you can create a directory and navigate to it before creating new projects.

Here is a silly example.

```bash
mkdir -p ~/dev/d/path/to/my/new/project/

cd ~/dev/d/path/to/my/new/project/

new_d_project war_games_tic_tac_toe "tic-tac-toe game for 2 players, 1 player or 0 players"
```

In VS Code

1. Open folder to `~/path/to/my/new/project/war_games_tic_tac_toe`
2. Add a breakpoint on line 5
3. Press F5 to debug

## 5. Using Windows File Explorer to explore Ubuntu file system

Although **WSL (Ubuntu)** is truly running **Ubuntu** on a **Windows 11** PC, it is in **Windows**, all the way down (*see: Giant Turtles supporting the Earth*).

> **Note:** In all example paths, `bb` is the author's WSL (Ubuntu) username. You must substitute your own Ubuntu username in place of `bb` for these examples to work on your system. To check your username, run `whoami` in your WSL terminal.

The secret decoder ring is that **WSL (Ubuntu)** path `~` is **Windows** path `\\wsl$\Ubuntu\home\bb`

So if you want to explore our **war_games_tic_tac_toe** game with File Explorer, enter this into File Explorer path box:  `\\wsl$\Ubuntu\home\bb\dev\d\path\to\my\new\project\war_games_tic_tac_toe`

You should see all the project files and directories in your **war_games_tic_tac_toe** project.

**Congratulations, you can create your own D projects and debug them.**
**You are ready to start the first lesson on Chapter 01**
