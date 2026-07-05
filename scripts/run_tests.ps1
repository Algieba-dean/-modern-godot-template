param(
    [string]$GodotBin = $env:GODOT_BIN,
    [string]$TestPath = "res://tests/"
)

$ErrorActionPreference = "Stop"

if ([string]::IsNullOrWhiteSpace($GodotBin)) {
    $command = Get-Command godot -ErrorAction SilentlyContinue
    if ($command) {
        $GodotBin = $command.Source
    }
}

if ([string]::IsNullOrWhiteSpace($GodotBin) -or -not (Test-Path -LiteralPath $GodotBin)) {
    throw "Godot executable not found. Set GODOT_BIN or pass -GodotBin."
}

& "$GodotBin" --headless --path . -s -d "res://addons/gdUnit4/bin/GdUnitCmdTool.gd" -a "$TestPath"
exit $LASTEXITCODE
