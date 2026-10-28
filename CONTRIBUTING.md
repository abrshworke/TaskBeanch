# Contributing

Thanks for helping improve AgentTaskBench.

The easiest way to contribute is to add a new example benchmark:

1. Create a new folder under `examples/`.
2. Include `TASK.md`, `AGENT_RULES.md`, `ACCEPTANCE_CRITERIA.md`, and `RESULT.md`.
3. Add a small, local `src/` and `tests/` setup.
4. Provide `validate.sh` and `validate.ps1`.
5. Keep the example self-contained and dependency-light.
6. Make sure the validator prints a clear PASS or FAIL.

Good examples are:

- small enough to understand quickly
- strict enough to catch real mistakes
- safe to run locally
- focused on one task or failure mode

Before opening a pull request, run the example validation scripts from the repo root.

