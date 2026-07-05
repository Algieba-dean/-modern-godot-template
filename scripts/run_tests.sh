#!/usr/bin/env bash
set -euo pipefail

GODOT_BIN="${GODOT_BIN:-godot}"
TEST_PATH="${1:-res://tests/}"

"$GODOT_BIN" --headless --path . -s -d "res://addons/gdUnit4/bin/GdUnitCmdTool.gd" -a "$TEST_PATH"
