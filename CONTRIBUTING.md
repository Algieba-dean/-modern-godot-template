# Contributing

## Setup

1. Install Godot 4.7 or newer.
2. Open the project once in the editor so Godot imports assets.
3. Run the local checks:

```powershell
.\scripts\validate_project.ps1
.\scripts\run_tests.ps1
```

## Branches

- `main` or `master` is treated as the protected production branch.
- Use short feature branches such as `feat/card-rules`, `fix/save-load`, or `docs/setup`.

## Code Style

- Use typed GDScript where practical.
- Prefer small scripts with testable functions over large scene scripts.
- Keep scene edits narrow and preserve existing node names, resource IDs, and signal method names unless the change requires a migration.
- Add or update GdUnit4 tests for gameplay rules, state transitions, and save/load behavior.

## Pull Requests

Before opening a PR:

- Run `scripts/validate_project.ps1`.
- Run `scripts/run_tests.ps1`.
- Check any changed scenes in the Godot editor.
- Fill out the PR template and mention any skipped validation.
