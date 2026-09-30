---
name: pr-comments
description: Evaluate PR comments, fix clear validated issues, and bring uncertain feedback or solutions to the user for a decision.
---

Use the PR URL or number supplied by the user or established in the conversation. Otherwise infer the PR from the current repository and branch if unambiguous. Ask for the target when multiple candidates remain. Evaluate the PR comments; use subagents when their number or scope warrants it. When a comment is validated and the solution is obvious, implement and verify the fix, commit and push it, and reply to the comment explaining the resolution. Report unvalidated comments or uncertain solutions to the user with options for them to decide.
