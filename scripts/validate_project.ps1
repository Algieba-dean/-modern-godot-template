param(
    [string]$GodotBin = $env:GODOT_BIN
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

& "$GodotBin" --headless --path . --quit
exit $LASTEXITCODE
