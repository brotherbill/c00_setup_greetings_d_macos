# Migration Plan: Moving peek Scripts to Project Root

## Goal
- Move the following scripts from the peek/ folder to the project root:
  - setup_new_d_project_global.sh
  - new_d_project.sh
  - clean.sh
- Refactor as needed for root usage.
- Update documentation to reflect new locations.

## Steps
1. Move scripts to root.
2. Update any hardcoded paths or references in scripts.
3. Update documentation (setup_D_environment_for_MacOS.md, create_new_d_project.md, create_new_d_project_BEGINNER.md) to use new script locations.
4. Remove peek/ folder if empty.

## Notes
- All scripts are Bash and should work on Mac/Linux.
- Test after migration to ensure functionality.
