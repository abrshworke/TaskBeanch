# Result Format

Use a consistent result format so pass/fail evidence is easy to review.

## Recommended Fields

- status
- summary
- validation command
- validation output
- files changed
- notes

## Suggested Status Values

- PASS
- FAIL
- PARTIAL

## Example

```md
## Status
PASS

## Validation
./scripts/run_validation.sh examples/python_bugfix

## Files Changed
- examples/python_bugfix/src/discounts.py
- examples/python_bugfix/tests/test_discounts.py
```

