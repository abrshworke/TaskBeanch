#!/usr/bin/env bash
set -u

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
example_arg="${1:-}"

if [[ -z "$example_arg" ]]; then
  echo "Usage: ./scripts/run_validation.sh <example-folder>"
  exit 2
fi

if [[ "$example_arg" = /* ]]; then
  example_path="$example_arg"
else
  example_path="$repo_root/$example_arg"
fi

if [[ ! -d "$example_path" ]]; then
  echo "FAIL: example folder not found: $example_arg"
  exit 1
fi

if [[ -f "$example_path/validate.sh" ]]; then
  if (cd "$example_path" && bash ./validate.sh); then
    echo "PASS: $example_arg"
    exit 0
  fi
  echo "FAIL: $example_arg"
  exit 1
fi

if [[ -f "$example_path/validate.ps1" ]]; then
  if command -v pwsh >/dev/null 2>&1; then
    if (cd "$example_path" && pwsh -File ./validate.ps1); then
      echo "PASS: $example_arg"
      exit 0
    fi
    echo "FAIL: $example_arg"
    exit 1
  fi
  if command -v powershell >/dev/null 2>&1; then
    if (cd "$example_path" && powershell -File ./validate.ps1); then
      echo "PASS: $example_arg"
      exit 0
    fi
    echo "FAIL: $example_arg"
    exit 1
  fi
  echo "FAIL: no PowerShell runtime found for $example_arg"
  exit 1
fi

echo "FAIL: no validation script found in $example_arg"
exit 1

