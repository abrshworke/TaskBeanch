# Failure Modes

AgentTaskBench is built to make common agent failures visible.

## Scope Drift

The agent changes unrelated code, rewrites files it was not asked to touch, or expands the task beyond the requested boundary.

## Partial Completion

Only part of the task is done, but the response sounds finished.

## Validation Theater

The agent claims success without running the validator or without checking the actual exit status.

## Hidden Regression

The requested behavior appears correct, but another behavior quietly breaks.

## Assumption Overreach

The agent fills in missing details with guesses instead of asking or constraining the solution.

## Weak Result Reporting

The response says "done" but does not record what passed, what failed, or what changed.

