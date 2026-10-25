---
name: explore-alternatives
description: Lay out the realistic ways to reach a goal, with pros, cons, cost, and risk for each, and recommend one. Use when the user asks "what are my options", "compare approaches", "X or Y", or needs to choose between solutions.
disable-model-invocation: true
---

Help the user choose between real alternatives for one clear goal.

First, state the goal and its success criteria in one short block. If the conversation already contains a goal statement, reuse it. If the goal is too vague to judge options against, stop and suggest `crystallize-goal`.

List the alternatives. Always include:

- the option the user already leans toward, if any,
- at least two genuinely different approaches, not variations of one approach,
- "do nothing" or "defer", with its real cost.

Look up facts that change the comparison (existing code, library limits, prices) before you judge. Do not ask the user for facts you can find.

For each alternative:

    ### <Name>
    <one or two sentences: what it is>

    **Pros**
    - ...

    **Cons**
    - ...

    **Cost / effort:** ...
    **Main risk:** ...
    **Reversible:** yes / partly / no

Then compare all alternatives in one table against the same success criteria. Do not add a criterion for one option only.

Finish with:

- **Recommendation**: one option and the single strongest reason for it.
- **Switch condition**: the fact that would make you pick a different option.

If the analysis shows that the goal itself is wrong, say so. Do not act on the choice until the user confirms it.
