# Task

Update `src/manifest.py` so `parse_manifest_line` accepts pipe-delimited metadata lines in addition to the existing separators.

## Scope

- Allowed files: `src/manifest.py`, `tests/`
- Do not change `src/banner.py`.
- Keep the banner output stable.

## Desired Behavior

- `parse_manifest_line("name|AgentTaskBench")` returns the key/value pair.
- Existing separator behavior stays valid.
- The banner format remains unchanged.

## Validation

Run the example validator and confirm the regression tests pass.

