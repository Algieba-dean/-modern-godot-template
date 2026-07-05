# Testing

This project uses GdUnit4.

## Local

```powershell
.\scripts\run_tests.ps1
```

To run a specific folder:

```powershell
.\scripts\run_tests.ps1 -TestPath res://tests/
```

## CI

The GitHub Actions workflow runs tests with `MikeSchulze/gdUnit4-action`.

Keep tests deterministic. Avoid depending on editor-only state, local absolute paths, frame timing, or imported files that are not committed.
