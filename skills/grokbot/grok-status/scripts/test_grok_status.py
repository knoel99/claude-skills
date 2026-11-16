import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

SCRIPT = Path(__file__).with_name("grok-status.py")


def run(d: Path):
    return subprocess.run(
        [sys.executable, str(SCRIPT), "--log", str(d / "run.log"), "--out", str(d / "status.txt"),
         "--messages", str(d / "messages.jsonl"), "--session", str(d / "session"),
         "--output", str(d / "output.md"), "--once"],
        capture_output=True, text=True,
    )


class GrokStatusTest(unittest.TestCase):
    def test_missing_log_does_not_crash(self):
        with tempfile.TemporaryDirectory() as tmp:
            d = Path(tmp)
            self.assertEqual(run(d).returncode, 0)
            self.assertEqual(len((d / "status.txt").read_text().splitlines()), 4)

    def test_finished_log(self):
        with tempfile.TemporaryDirectory() as tmp:
            d = Path(tmp)
            (d / "run.log").write_text('{"type":"text","data":"hello"}\n{"type":"end"}\n')
            self.assertEqual(run(d).returncode, 0)
            self.assertTrue((d / "status.txt").read_text().startswith("Finished."))
            self.assertIn("hello", (d / "messages.jsonl").read_text())


if __name__ == "__main__":
    unittest.main()
