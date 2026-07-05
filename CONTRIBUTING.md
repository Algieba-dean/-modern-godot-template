# Contributing

## Setup

1. Install Godot 4.7 or newer.
2. Install `uv`.
3. Set `GODOT_BIN` if `godot` is not on your `PATH`.
4. Open the project once in the editor so Godot imports assets.
5. Run the local checks:

```powershell
.\scripts\quality.ps1
```

On Linux/macOS:

```bash
./scripts/quality.sh
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
- Run `uv run gdformat --check scripts tests`.
- Run `uv run gdlint scripts tests`.
- Or run all checks with `scripts/quality.ps1` on Windows or `scripts/quality.sh` on Linux/macOS.
- Check any changed scenes in the Godot editor.
- Fill out the PR template and mention any skipped validation.
