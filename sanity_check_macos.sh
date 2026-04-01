#!/usr/bin/env bash
set -euo pipefail

ok() {
  echo "[OK] $1"
}

fail() {
  echo "[FAIL] $1" >&2
  exit 1
}

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
TASKS_FILE="$ROOT_DIR/.vscode/tasks.json"
LAUNCH_FILE="$ROOT_DIR/.vscode/launch.json"

command -v dub >/dev/null 2>&1 || fail "dub not found in PATH"
command -v ldc2 >/dev/null 2>&1 || fail "ldc2 not found in PATH"
ok "dub and ldc2 found in PATH"

echo "$(dub --version | sed -n '1p')"
echo "$(ldc2 --version | sed -n '1p')"

( cd "$ROOT_DIR" && dub build --build=debug --compiler=ldc2 >/dev/null ) || fail "dub build failed with ldc2"
ok "debug build works with ldc2"

[[ -f "$TASKS_FILE" ]] || fail "missing .vscode/tasks.json"
[[ -f "$LAUNCH_FILE" ]] || fail "missing .vscode/launch.json"

grep -q '"label"[[:space:]]*:[[:space:]]*"dub: build debug"' "$TASKS_FILE" || fail "tasks.json missing label dub: build debug"
grep -q '"--compiler=ldc2"' "$TASKS_FILE" || fail "tasks.json does not use ldc2"
ok "tasks.json uses dub: build debug and ldc2"

grep -q '"type"[[:space:]]*:[[:space:]]*"lldb"' "$LAUNCH_FILE" || fail "launch.json type is not lldb"
grep -q '"preLaunchTask"[[:space:]]*:[[:space:]]*"dub: build debug"' "$LAUNCH_FILE" || fail "launch.json preLaunchTask mismatch"
ok "launch.json uses lldb with dub: build debug"

echo "All sanity checks passed."
#!/usr/bin/env bash
set -euo pipefail

ok() {
  echo "[OK] $1"
}

fail() {
  echo "[FAIL] $1" >&2
  exit 1
}

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
TASKS_FILE="$ROOT_DIR/.vscode/tasks.json"
LAUNCH_FILE="$ROOT_DIR/.vscode/launch.json"

command -v dub >/dev/null 2>&1 || fail "dub not found in PATH"
command -v ldc2 >/dev/null 2>&1 || fail "ldc2 not found in PATH"
ok "dub and ldc2 found in PATH"

echo "$(dub --version | sed -n '1p')"
echo "$(ldc2 --version | sed -n '1p')"

( cd "$ROOT_DIR" && dub build --build=debug --compiler=ldc2 >/dev/null ) || fail "dub build failed with ldc2"
ok "debug build works with ldc2"

[[ -f "$TASKS_FILE" ]] || fail "missing .vscode/tasks.json"
[[ -f "$LAUNCH_FILE" ]] || fail "missing .vscode/launch.json"

grep -q '"label"[[:space:]]*:[[:space:]]*"dub: build debug"' "$TASKS_FILE" || fail "tasks.json missing label dub: build debug"
grep -q '"--compiler=ldc2"' "$TASKS_FILE" || fail "tasks.json does not use ldc2"
ok "tasks.json uses dub: build debug and ldc2"

grep -q '"type"[[:space:]]*:[[:space:]]*"lldb"' "$LAUNCH_FILE" || fail "launch.json type is not lldb"
grep -q '"preLaunchTask"[[:space:]]*:[[:space:]]*"dub: build debug"' "$LAUNCH_FILE" || fail "launch.json preLaunchTask mismatch"
ok "launch.json uses lldb with dub: build debug"

echo "All sanity checks passed."
