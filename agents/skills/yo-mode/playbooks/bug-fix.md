# Bug fix

Use this playbook only when the user asks to fix a reported defect. A diagnosis-only request stays in Investigation.

1. Reproduce the defect on the closest reachable user-facing or runtime surface. Record the observable failure.
2. Form competing hypotheses. Use source inspection, logs, instrumentation, and focused experiments to eliminate them.
3. Confirm the root mechanism before editing. Apply `$principle-fix-root-causes`.
4. Choose the smallest fix justified by the evidence. Avoid guards or fallback paths that only hide the symptom.
5. Add focused regression coverage when a practical test target exists. The test must fail without the fix.
6. Verify the original reproduction on the same surface, then run the relevant broader checks and search for the same failure pattern elsewhere.
7. Inspect the final diff and report the root cause, fix, direct proof, broader checks, and any remaining uncertainty.

Use parallel subagents only when investigation or fallout checking divides into worthwhile independent slices. Leave the verified change in the worktree unless the user explicitly requests PR delivery.
