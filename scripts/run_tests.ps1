param(
    [string]$GodotBin = $env:GODOT_BIN,
    [string]$TestPath = "res://tests/"
)

$ErrorActionPreference = "Stop"

if ([string]::IsNullOrWhiteSpace($GodotBin)) {
    $GodotBin = "E:\steam\steamapps\common\Godot Engine\godot.windows.opt.tools.64.exe"
}

if (-not (Test-Path -LiteralPath $GodotBin)) {
    throw "Godot executable not found: $GodotBin"
}

& "$GodotBin" --headless --path . -s -d "res://addons/gdUnit4/bin/GdUnitCmdTool.gd" -a "$TestPath"
exit $LASTEXITCODE
