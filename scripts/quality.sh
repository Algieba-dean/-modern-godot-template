#!/usr/bin/env bash
set -euo pipefail

uv sync --dev
uv run gdformat --check scripts tests
uv run gdlint scripts tests

SKIP=no-commit-to-branch uv run pre-commit run --all-files --show-diff-on-failure

./scripts/validate_project.sh
./scripts/run_tests.sh
