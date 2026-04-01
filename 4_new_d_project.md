# 4_new_d_project.sh

Creates a new D project from the template repository in any directory.


## Usage

```bash
new_d_project <project_name> "<description>"
```


## Step-by-step

1. Navigate to the parent directory where you want the new project created:
   ```bash
   cd ~/dev/d
   ```

2. Create the project:
   ```bash
   new_d_project my_new_project "My new D project"
   ```

3. Enter the new project:
   ```bash
   cd my_new_project
   ```

4. Run the sanity check to confirm the build and debug setup:
   ```bash
   ./sanity_check_macos.sh
   ```

5. Open in VS Code:
   ```bash
   code .
   ```

6. Close Terminal and VS Code.

## Example

```bash
mkdir -p ~/dev/d 

cd ~/dev/d

new_d_project hello_world "Hello World in D"

cd hello_world

./sanity_check_macos.sh

code .
```

## Expected Output

```
Cloning into 'my_new_project'...
remote: Enumerating objects: ...
...
```
