import unittest

from src.discounts import apply_discount


class ApplyDiscountTests(unittest.TestCase):
    def test_standard_discount(self):
        self.assertEqual(apply_discount(1000, 20), 800)

    def test_rounds_half_up(self):
        self.assertEqual(apply_discount(999, 15), 849)

    def test_zero_discount(self):
        self.assertEqual(apply_discount(2500, 0), 2500)

    def test_full_discount(self):
        self.assertEqual(apply_discount(2500, 100), 0)

    def test_rejects_invalid_amount(self):
        with self.assertRaises(ValueError):
            apply_discount(-1, 10)

    def test_rejects_invalid_percent(self):
        with self.assertRaises(ValueError):
            apply_discount(100, 101)


if __name__ == "__main__":
    unittest.main()

