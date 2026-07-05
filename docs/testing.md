# Testing

This project uses GdUnit4.

## Local

Set `GODOT_BIN` first if the `godot` command is not on your `PATH`.

```powershell
.\scripts\run_tests.ps1
```

To run a specific folder:

```powershell
.\scripts\run_tests.ps1 -TestPath res://tests/
```

## CI

The GitHub Actions workflow runs tests with `MikeSchulze/gdUnit4-action`.

The workflow also runs `gdformat`, `gdlint`, and `pre-commit` through `uv`.

Keep tests deterministic. Avoid depending on editor-only state, local absolute paths, frame timing, or imported files that are not committed.
