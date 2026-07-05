param(
    [string]$GodotBin = $env:GODOT_BIN
)

$ErrorActionPreference = "Stop"

if ([string]::IsNullOrWhiteSpace($GodotBin)) {
    $GodotBin = "E:\steam\steamapps\common\Godot Engine\godot.windows.opt.tools.64.exe"
}

if (-not (Test-Path -LiteralPath $GodotBin)) {
    throw "Godot executable not found: $GodotBin"
}

& "$GodotBin" --headless --path . --quit
exit $LASTEXITCODE
