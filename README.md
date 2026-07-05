# Godot Game Template

![Godot](https://img.shields.io/badge/Godot-4.7-blue)
![Tests](https://img.shields.io/badge/tests-GdUnit4-6f42c1)
![License](https://img.shields.io/badge/license-MIT-green)

A Godot 4 game project template with a small but strict development workflow: predictable folders, GdUnit4 tests, CI, contribution docs, and local scripts.

## Setup Guide

After creating a new project from this template, run:

```powershell
.\init_project.ps1
```

The script updates the project display name, repository slug, author metadata, README headings, and the smoke test placeholder.

## Development

### Prerequisites

- Godot 4.7+
- PowerShell on Windows
- GdUnit4 is vendored in `addons/gdUnit4`

Set `GODOT_BIN` if the `godot` command is not already on your `PATH`:

```powershell
$env:GODOT_BIN = 'C:\path\to\godot.exe'
```

### Common Commands

| Task | Command |
| :--- | :--- |
| Validate project load | `.\scripts\validate_project.ps1` |
| Run tests | `.\scripts\run_tests.ps1` |
| Check GDScript format | `uv run gdformat --check scripts tests` |
| Lint GDScript | `uv run gdlint scripts tests` |
| Run all pre-commit hooks | `uv run pre-commit run --all-files` |
| Run a test path | `.\scripts\run_tests.ps1 -TestPath res://tests/` |
| Open editor | `& "$env:GODOT_BIN" --path .` |

Install development tools with:

```powershell
uv sync --dev
```

### Project Structure

```text
.
|-- addons/gdUnit4/       # GdUnit4 test framework
|-- scenes/               # Runtime scenes
|-- scripts/              # Game scripts and local tooling
|-- resources/            # Shared .tres/.res resources
|-- tests/                # GdUnit4 test suites
|-- docs/                 # Project documentation
|-- openspec/             # OpenSpec planning artifacts
|-- .github/              # CI and repository templates
`-- project.godot         # Godot project settings
```

## Testing

Tests live in `tests/` and extend `GdUnitTestSuite`.

```gdscript
class_name MyFeatureTest
extends GdUnitTestSuite


func test_example() -> void:
	assert_bool(true).is_true()
```

Run locally:

```powershell
.\scripts\run_tests.ps1
```

## Template Notes

- `reference/` is ignored and reserved for local template references.
- `builds/` and `reports/` are ignored generated outputs.
- Keep game code small and testable: put reusable logic in scripts/resources, then cover it with GdUnit4 before wiring it into scenes.
