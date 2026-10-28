#!/usr/bin/env bash
set -u

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
examples_dir="$repo_root/examples"

if [[ ! -d "$examples_dir" ]]; then
  echo "No examples directory found: $examples_dir"
  exit 1
fi

pass_count=0
fail_count=0
found_any=0

run_example() {
  local example_path="$1"
  local example_name
  example_name="examples/$(basename "$example_path")"

  found_any=1

  if [[ -f "$example_path/validate.sh" ]]; then
    if (cd "$example_path" && bash ./validate.sh >/dev/null); then
      echo "PASS: $example_name"
      pass_count=$((pass_count + 1))
    else
      echo "FAIL: $example_name"
      fail_count=$((fail_count + 1))
    fi
    return
  fi

  if [[ -f "$example_path/validate.ps1" ]]; then
    if command -v pwsh >/dev/null 2>&1; then
      if (cd "$example_path" && pwsh -File ./validate.ps1 >/dev/null); then
        echo "PASS: $example_name"
        pass_count=$((pass_count + 1))
      else
        echo "FAIL: $example_name"
        fail_count=$((fail_count + 1))
      fi
      return
    fi

    if command -v powershell >/dev/null 2>&1; then
      if (cd "$example_path" && powershell -File ./validate.ps1 >/dev/null); then
        echo "PASS: $example_name"
        pass_count=$((pass_count + 1))
      else
        echo "FAIL: $example_name"
        fail_count=$((fail_count + 1))
      fi
      return
    fi

    echo "FAIL: $example_name"
    fail_count=$((fail_count + 1))
    echo "  No PowerShell runtime found"
    return
  fi

  echo "FAIL: $example_name"
  fail_count=$((fail_count + 1))
  echo "  No validation script found"
}

for example_path in "$examples_dir"/*; do
  [[ -d "$example_path" ]] || continue
  run_example "$example_path"
done

if [[ "$found_any" -eq 0 ]]; then
  echo "No example folders found under examples/"
  exit 1
fi

echo "Summary: $pass_count passed, $fail_count failed"

if [[ "$fail_count" -eq 0 ]]; then
  exit 0
fi

exit 1
