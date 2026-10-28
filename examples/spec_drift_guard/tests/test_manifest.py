import unittest

from src.manifest import parse_manifest_line


class ManifestTests(unittest.TestCase):
    def test_accepts_equals_separator(self):
        self.assertEqual(parse_manifest_line("name=AgentTaskBench"), ("name", "AgentTaskBench"))

    def test_accepts_colon_separator(self):
        self.assertEqual(parse_manifest_line("name: AgentTaskBench"), ("name", "AgentTaskBench"))

    def test_accepts_pipe_separator(self):
        self.assertEqual(parse_manifest_line("name|AgentTaskBench"), ("name", "AgentTaskBench"))

    def test_rejects_comments(self):
        with self.assertRaises(ValueError):
            parse_manifest_line("# comment")


if __name__ == "__main__":
    unittest.main()

