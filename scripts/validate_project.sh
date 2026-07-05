#!/usr/bin/env bash
set -euo pipefail

GODOT_BIN="${GODOT_BIN:-godot}"

"$GODOT_BIN" --headless --path . --quit
