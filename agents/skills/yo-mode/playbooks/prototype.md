# Prototype

Use this playbook when a throwaway experiment can settle an empirical design, interaction, timing, or behavior question. The output is a decision and evidence, not production code.

1. State the exact decision the prototype must settle.
2. Gather only the references needed to define realistic alternatives.
3. Build the smallest experiment in an isolated scratch directory outside production source.
4. When the design space is genuinely open, compare two or three labeled variants through one switcher or repeatable runner.
5. Observe the deciding behavior on the matching surface. Capture screenshots for visual choices and measured output for behavioral or timing choices.
6. Present the alternatives, evidence, tradeoffs, and recommendation. Mark unreachable observations as inconclusive.
7. Keep the prototype throwaway. Route the chosen direction to Feature for production implementation.
