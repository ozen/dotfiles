# Refactoring

Use this playbook for behavior-preserving renames, moves, extractions, inlining, deduplication, and structural cleanup. Route behavior changes to Feature and defect corrections to Bug fix.

1. Pin the current behavior with a characterization test, equivalence check, snapshot, or direct runtime observation.
2. Name the target shape and the reader-load problem it solves. Apply `$principle-model-the-domain` only when the new structure removes branches, invalid states, or repeated rules.
3. Apply `$principle-subtract-before-you-add` and `$principle-laziness-protocol`. Delete dead paths, collapse one-caller wrappers, and remove redundant validation before adding structure.
4. Inventory callers, string references, documentation, generated artifacts, and CI assumptions before moving an API or symbol.
5. Move in small verifiable units. When compatibility is not required, migrate every caller and delete the old API in the same wave.
6. Prove behavior remains unchanged against the pin and the real artifact. Type checking or compilation alone is insufficient.
7. Confirm the result reduces layers, hidden state, or duplicated decisions. Revert speculative cleanup that does not earn its place.

Leave the verified refactor in the worktree unless the user explicitly requests PR delivery.
