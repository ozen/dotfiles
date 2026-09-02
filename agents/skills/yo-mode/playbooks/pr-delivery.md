# PR delivery

Use this playbook only after the user explicitly asks for commits or a pull request. Do not infer delivery authority from an implementation request.

1. Re-read repository Git and GitHub instructions. Use the required integration or CLI path.
2. Inspect the complete diff, unrelated work, branch base, and verification state before staging anything.
3. Run the relevant checks against the final diff. Apply `$principle-prove-it-works` and state any inconclusive surface verification.
4. Shape small, ordered commits when the user requested commits. Each commit must be understandable and safe to review on its own.
5. Apply `$technical-writing` and `$unslop` to the title and description.
6. Explain the problem and resulting behavior before implementation detail. Include scope, real tradeoffs, blast radius, verification results, and material limits. Summarize the architectural change instead of listing files.
7. Prefer narrow review units. Use a stack only when the changes have real ordering or dependency boundaries.
8. Open or update the PR through the authorized GitHub path, then verify the resulting title, body, base, head, and URL.

Opening a PR does not authorize merging, deployment, or ongoing babysitting.
