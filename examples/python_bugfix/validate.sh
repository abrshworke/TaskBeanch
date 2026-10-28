#!/usr/bin/env bash
set -u

python_bin="${PYTHON_BIN:-python3}"
if ! command -v "$python_bin" >/dev/null 2>&1; then
  python_bin="python"
fi

if ! command -v "$python_bin" >/dev/null 2>&1; then
  echo "FAIL: no Python interpreter found"
  exit 1
fi

"$python_bin" -m unittest discover -s tests -p 'test_*.py' -v
status=$?
if [[ $status -eq 0 ]]; then
  echo "PASS: python_bugfix"
else
  echo "FAIL: python_bugfix"
fi
exit $status

