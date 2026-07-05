# Godot Game Template

![Godot](https://img.shields.io/badge/Godot-4.7-blue)
![Tests](https://img.shields.io/badge/tests-GdUnit4-6f42c1)
![License](https://img.shields.io/badge/license-MIT-green)

A Godot 4 game project template with reproducible local tooling, GdUnit4 tests, GDScript linting, CI, and repository hygiene.

## Setup Guide

After creating a new project from this template, run:

```powershell
.\init_project.ps1
```

The script updates the project display name, repository slug, author metadata, README headings, and the smoke test placeholder.

## Development

### Prerequisites

- Godot 4.7+
- PowerShell on Windows, or Bash on Linux/macOS
- [uv](https://github.com/astral-sh/uv) for development tooling
- GdUnit4 is vendored in `addons/gdUnit4`

Set `GODOT_BIN` if the `godot` command is not already on your `PATH`.

```powershell
$env:GODOT_BIN = 'C:\path\to\godot.exe'
```

```bash
export GODOT_BIN=/path/to/godot
```

Install development tools with:

```powershell
uv sync --dev
```

### Common Commands

| Task | Windows | Linux/macOS |
| :--- | :--- | :--- |
| Run full quality gate | `.\scripts\quality.ps1` | `./scripts/quality.sh` |
| Validate project load | `.\scripts\validate_project.ps1` | `./scripts/validate_project.sh` |
| Run tests | `.\scripts\run_tests.ps1` | `./scripts/run_tests.sh` |
| Run a test path | `.\scripts\run_tests.ps1 -TestPath res://tests/` | `./scripts/run_tests.sh res://tests/` |
| Check GDScript format | `uv run gdformat --check scripts tests` | `uv run gdformat --check scripts tests` |
| Lint GDScript | `uv run gdlint scripts tests` | `uv run gdlint scripts tests` |
| Run all pre-commit hooks | `uv run pre-commit run --all-files` | `uv run pre-commit run --all-files` |
| Open editor | `& "$env:GODOT_BIN" --path .` | `"$GODOT_BIN" --path .` |

## Project Structure

```text
.
|-- addons/gdUnit4/       # GdUnit4 test framework
|-- addons/godot_mcp/     # Optional Godot MCP runtime autoload
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

Run tests:

```powershell
.\scripts\run_tests.ps1
```

```bash
./scripts/run_tests.sh
```

Run every local check:

```powershell
.\scripts\quality.ps1
```

```bash
./scripts/quality.sh
```

## Template Notes

- `reference/` is ignored and reserved for local template references.
- `builds/` and `reports/` are ignored generated outputs.
- Keep game code small and testable: put reusable logic in scripts/resources, then cover it with GdUnit4 before wiring it into scenes.
