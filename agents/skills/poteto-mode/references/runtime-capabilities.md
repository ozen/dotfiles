# Runtime capability fallbacks

Use capabilities exposed by the current environment. Do not assume a particular command, tool name, schema field, execution host, or agent type.

## Delegation

Launch workers through the available agent launcher. Omit model overrides so every worker inherits the main agent's model. Express the role, write permissions, starting revision, isolation needs, completion predicate, and output contract in ordinary language.

Prefer concurrent isolated workers when supported. If delegation or concurrency is unavailable, run the same briefs serially in the current session with separate outputs. Do not reduce the worker count or omit a role. A fresh context is required only when independence is the point; disclose when the runtime cannot provide one.

## User decisions

Use structured input when available. Otherwise ask one concise plain-text question containing the same options. Ask only for irreversible actions or genuine product and preference choices that evidence cannot settle. Optional questions must not block progress; required choices must not be guessed.

## Durable objectives and wakeups

Use the environment's native durable-objective mechanism when available. Otherwise persist an objective record in the program store containing the exact objective, done predicate, current state, next check, cadence, stop conditions, and authorization boundaries. Re-read it before every audit tick.

Use an event waiter or scheduler when available. Otherwise poll only within the current run and within its time budget. If work must outlive the run and no wake mechanism exists, save a resumable checkpoint and report that unattended continuation is unavailable. Never describe persisted state as ongoing execution.

## Surface verification

Drive the real user-facing surface through any available browser, UI, terminal, CLI, native-app, or simulator automation. If no general driver exists, use a repository-provided harness that exercises the same surface. If neither exists, mark live verification `BLOCKED` or `INCONCLUSIVE`; tests alone do not convert it to `PASS`.

## Placement and isolation

Prefer isolated remote execution for self-contained work when the runtime provides it. Use a local isolated worktree or temporary directory for machine-only resources such as local authentication, transcripts, simulators, or IDE state. If placement cannot be selected, use the runtime default and name any inaccessible resource as a gap.
