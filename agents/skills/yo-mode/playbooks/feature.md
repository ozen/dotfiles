# Feature

Use this playbook for new or changed behavior.

1. Inspect the current subsystem and explain the existing behavior and ownership.
2. Name the domain shape, invariants, owner, and boundary contracts before writing logic. Apply `$principle-foundational-thinking` and `$principle-model-the-domain` when their triggers match.
3. For a broad or unresolved design, present the target model and material choices before implementation. Wait only when the user requested a plan first or the remaining choice is product direction.
4. For work large enough to delegate, write a short throughput checkpoint covering blocking steps, independent workstreams, shared mutable state, and the smallest safe decomposition.
5. Implement the smallest general solution in the worktree. Keep policy with its owner and validate external data at boundaries.
6. Add coverage for every changed behavior. Verify on the matching runtime or user-facing surface, then run the relevant broader checks.
7. Inspect downstream fallout, the final diff, and the resulting documentation. Report the chosen model, tradeoffs, proof, and open decisions.

Do not commit or open a PR unless the user explicitly requests PR delivery.
