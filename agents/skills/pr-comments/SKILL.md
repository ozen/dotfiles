---
name: pr-comments
description: Evaluate PR comments, fix clear validated issues, and bring uncertain feedback or solutions to the user for a decision.
---

Use the PR URL or number supplied by the user or established in the conversation. Otherwise infer the PR from the current repository and branch if unambiguous. Ask for the target when multiple candidates remain. Evaluate the PR comments; use subagents when their number or scope warrants it.

Treat each comment as a hypothesis, and assess its significance independently of the reviewer's confidence or severity label. Establish both whether the observation is accurate and whether it warrants a change in the surrounding system. Trace the relevant callers, invariants, safeguards, and downstream behavior to identify a credible consequence under realistic conditions. For design or maintainability feedback, identify the concrete cost it addresses. Weigh the expected benefit against the complexity and regression risk of the proposed fix; an isolated code observation is not sufficient justification for a change.

When an issue has a substantiated impact and the solution is obvious, implement and verify the fix, commit and push it, and reply to the comment explaining the resolution. Leave code unchanged when the evidence shows no actionable consequence, and report the reasoning. Distinguish that conclusion from insufficient evidence: report unresolved impact questions or uncertain solutions to the user with the relevant evidence and options for them to decide.
