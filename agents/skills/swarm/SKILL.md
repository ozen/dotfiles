---
name: swarm
description: "Fan out N parallel workers, drain them, and return one report. Use for /swarm, 'swarm this', or parallel coverage, races, gauntlets, and exploration."
disable-model-invocation: true
---

# Swarm

Fan out N parallel isolated workers. They may cover separate slices, race the same brief, or mix both. The parent waits, aggregates, and returns one report.

## Start

Create a visible checklist with one entry per phase using the environment's planning mechanism when available; otherwise maintain it in the working notes.

1. Frame
2. Fan out
3. Aggregate
4. Report

## Phase A: Frame

1. State the done predicate and the artifact or report the swarm must return.
2. Choose the shape. Partition into slices, race N workers on identical briefs, or mix both. For a race or mixed shape, declare `first pass`, `rank all`, or `best-of` before spawning.
3. Set N from the user or derive it from the shape. N is total workers, not the runtime's concurrency limit.
4. Every worker inherits the main agent's model. Omit the `model` field on every spawn. A race compares independent attempts or approaches, never models.
5. Give each worker its own writable output when it writes. Use a worktree, branch, or `/tmp/swarm-<slug>/worker-<n>/`.

## Phase B: Fan out

Launch all N workers concurrently through the available agent launcher and omit any model override so they inherit the main agent's model. Prefer isolated remote execution when it is available and the brief is self-contained. Use a local isolated worktree or temporary directory when a worker needs resources available only on the user's computer. When the launcher cannot select placement, use its default and state any missing resource as a gap.

When a worker must start from a non-default branch or revision, name that starting point in the brief and use the launcher's supported starting-state mechanism. If none exists, create a local isolated worktree at that revision before launching. If concurrent delegation is unavailable, run the same N briefs serially with separate outputs; do not reduce N.

Every brief stands alone. Include the goal, scope, exact slice or race arm, how to verify, and what to report. Reports use `PASS`, `ISSUES`, or `BLOCKED` with evidence.

If a worker drops out, proceed with N-1 and note it.

## Phase C: Aggregate

Read the terminal results. For coverage, every required slice needs a result. For a race, apply the selection rule declared up front. Use first pass, rank all, or best-of. Do not paste raw worker dumps.

Keep a compact result table, one-line evidenced issues, and explicit gaps or dropouts.

## Phase D: Report

Return one consolidated in-chat report with the table, issue one-liners, gaps or dropouts, and the race rule when used.
