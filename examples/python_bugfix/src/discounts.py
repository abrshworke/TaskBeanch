"""Simple discount helpers used by the bug-fix example."""


def apply_discount(amount_cents: int, percent_off: int) -> int:
    """Return the discounted amount in cents.

    The result rounds half up to the nearest cent.
    """
    if amount_cents < 0:
        raise ValueError("amount_cents must be non-negative")
    if percent_off < 0 or percent_off > 100:
        raise ValueError("percent_off must be between 0 and 100")

    discounted = amount_cents * (100 - percent_off)
    return (discounted + 50) // 100

