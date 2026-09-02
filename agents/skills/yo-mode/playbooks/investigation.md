# Investigation

Use this playbook for read-only explanations, diagnosis, reviews, and design questions. If the user asks for a fix or implementation, route to the matching code playbook.

1. State the question and the decision it informs.
2. Inspect the current source, tests, canonical docs, runtime evidence, and relevant branch history.
3. Separate observed behavior from inferred intent. Resolve contradictions before recommending a change.
4. Explain the current model first. Map ownership, data flow, and constraints with exact symbols or paths when useful.
5. Compare realistic alternatives when the request asks for a decision. Give a candid recommendation and name the tradeoffs.
6. Return the answer without editing files or taking external action.

Apply `$unslop` to the response. Cite only evidence inspected during the task.
