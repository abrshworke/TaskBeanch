import unittest

from src.banner import render_banner


class BannerTests(unittest.TestCase):
    def test_banner_format_is_stable(self):
        self.assertEqual(render_banner("AgentTaskBench"), "## AgentTaskBench ##")

    def test_banner_collapses_whitespace_only(self):
        self.assertEqual(render_banner("AgentTaskBench   v0.1"), "## AgentTaskBench v0.1 ##")


if __name__ == "__main__":
    unittest.main()

