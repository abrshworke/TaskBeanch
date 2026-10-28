# Task

Fix the discount calculation in `src/discounts.py` so the returned amount in cents is correct for standard percentage discounts.

## Scope

- Allowed files: `src/discounts.py`, `tests/`
- Keep the public function name and signature stable.
- Do not add external dependencies.

## Desired Behavior

- `apply_discount(amount_cents, percent_off)` returns the discounted amount as an integer number of cents.
- Results should round half up to the nearest cent.
- Invalid inputs should raise `ValueError`.

## Validation

Run the example validator and confirm the tests pass.

