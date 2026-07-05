$ErrorActionPreference = "Stop"

function Read-Default {
    param(
        [string]$Prompt,
        [string]$Default
    )

    $value = Read-Host "$Prompt [$Default]"
    if ([string]::IsNullOrWhiteSpace($value)) {
        return $Default
    }
    return $value.Trim()
}

Write-Host ""
Write-Host "Initializing Godot game project from template"
Write-Host ""

$projectName = Read-Default "Project display name" "MyGodotGame"
$repoSlug = Read-Default "Repository slug" ($projectName -replace '\s+', '-' | ForEach-Object { $_.ToLowerInvariant() })
$authorName = Read-Default "Author name" "Your Name"
$licenseYear = Read-Default "License year" (Get-Date -Format "yyyy")

$replacements = @{
    "Godot Game Template" = $projectName
    "GodotGameTemplate" = ($projectName -replace '[^A-Za-z0-9_]', '')
    "godot-game-template" = $repoSlug
    "Algieba-dean" = $authorName
    "2026" = $licenseYear
}

$ignoreDirs = @(
    ".git",
    ".godot",
    "reference",
    "addons\gdUnit4"
)

$ignoreFiles = @(
    "init_project.ps1"
)

Get-ChildItem -Recurse -File | ForEach-Object {
    $path = $_.FullName
    $relative = Resolve-Path -Relative $path

    foreach ($dir in $ignoreDirs) {
        if ($relative -like ".\$dir\*") {
            return
        }
    }

    if ($ignoreFiles -contains $_.Name) {
        return
    }

    try {
        $content = Get-Content -Raw -LiteralPath $path -Encoding UTF8
    }
    catch {
        return
    }

    $updated = $content
    foreach ($key in $replacements.Keys) {
        $updated = $updated.Replace($key, $replacements[$key])
    }

    if ($updated -ne $content) {
        Set-Content -LiteralPath $path -Value $updated -Encoding UTF8 -NoNewline
        Write-Host "Updated $relative"
    }
}

Write-Host ""
Write-Host "Next steps:"
Write-Host "1. Open the project in Godot once to import assets."
Write-Host "2. Run .\scripts\validate_project.ps1"
Write-Host "3. Run .\scripts\run_tests.ps1"
Write-Host "4. Delete init_project.ps1 after initialization."
