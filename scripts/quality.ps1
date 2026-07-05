param(
    [string]$GodotBin = $env:GODOT_BIN
)

$ErrorActionPreference = "Stop"

uv sync --dev
uv run gdformat --check scripts tests
uv run gdlint scripts tests

$env:SKIP = "no-commit-to-branch"
uv run pre-commit run --all-files --show-diff-on-failure

& "$PSScriptRoot\validate_project.ps1" -GodotBin $GodotBin
& "$PSScriptRoot\run_tests.ps1" -GodotBin $GodotBin
