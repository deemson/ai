---
name: grill-me
description: A relentless interview to sharpen a plan, run through a Markdown file the user edits.
disable-model-invocation: true
---

Interview the user relentlessly until you reach a shared understanding — conducted through a Markdown file they edit, so a whole round costs one exchange instead of one exchange per question.

Map the plan as a **design tree**: every decision branches into the decisions that hang off it. The **frontier** is every decision whose prerequisites are already settled — the questions answerable _now_ without guessing at answers you haven't heard yet. Work the tree in **rounds**, one round per frontier, every round appended to one file. Before the first round, settle the facts the whole tree stands on.

## The file

`.grill/YYYY-mm-dd-NN-<slug>.md` in the current working directory: today's date, then a two-digit counter one higher than the highest already used on that date in `.grill/` (zero-padded, widening past 99), then a slug from the topic. Every session starts a new file — never reuse or look up an existing one by name. Resume only when the user points you at an existing grill file: absorb its settled answers and notes, re-verify its recorded facts instead of trusting them, then compute the next frontier from where it left off. Report what changed rather than silently rewriting a bullet — a fact that rotted may have invalidated a decision, not just itself.

Optimize the file for reading and editing as raw Markdown in a terminal editor. Never use Markdown tables. Present comparisons and choices as short paragraphs or bulleted lists instead. Do not assume the Markdown will be rendered.

<file-template>

# Grill: <topic>

**The plan as I understand it:** one paragraph. Edit it if it's wrong — a wrong restatement makes every question below it wrong too.

**How to answer:** fix a wrong fact by editing its bullet in place; answer a question by writing under its `>`. Leaving a `>` empty means you accept the ➡️ recommendation, so answer only where you disagree. Anything you change in an earlier round re-opens it.

## Facts

What I checked, and what I'm taking as true from here on. Every question below rests on these — strike or correct anything wrong, and use the stub for what I missed.

- <a load-bearing claim, with where it came from>
- <another> _(Round 2)_

>

## Round 1

❓ **Q1 — <question title>**

Question body — a paragraph or two, or a short bulleted list of choices.

➡️ <your recommended answer, with the reason it's your recommendation>

>

❓ **Q2 — <question title>**

➡️ <recommendation>

>

### Notes

Free text: pushback, missing context, branches the questions missed, questions of your own.

</file-template>

## Before the rounds

A question built on a wrong fact is a wasted question, and its recommendation steers the design wrong quietly. So settle what's true before the first question exists.

1. **Explore.** Investigate everything the environment can answer — filesystem, tools, the codebase — using the tools available. When independent investigations are substantial and delegation is available, run them in parallel; otherwise investigate directly. Done when you can state the situation from evidence rather than guess at it.

2. **Write the facts.** Create the file with its restatement and its `## Facts` list. A claim earns a bullet only if a question or recommendation in this session would change had it been false; give its source where that isn't obvious. Keep the restatement of intent above the list and separate from it — the facts are verified, the restatement is inferred, and the inferred one is where the expensive mistakes live. When little in the environment constrains the plan, say that outright and list what you're assuming instead; never skip this phase because the situation looks simple to you, since a situation you've misjudged as simple is exactly where a wrong fact hides. Done when every bullet is load-bearing and the list is short enough to actually be read.

3. **Hand over.** Report the file path and end your turn. Done when the user replies.

4. **Absorb corrections.** A corrected fact is evidence your picture of that area is wrong, not just that one bullet: re-verify what it touches, rewrite the list, and hand over again. Done when the list survives a pass unchanged.

Only then write Round 1.

## Each round

1. **Find the facts.** Facts are yours to find; decisions are the user's to make. The up-front phase covered what was reachable then, so this step is for facts a decision has since unlocked — the schema worth reading now that they've chosen the database. Verify those facts using the tools available, parallelizing independent checks when useful and supported, and append the findings to the `## Facts` section tagged with this round, never buried inline in the question that wanted them. An investigation still in progress is an unsettled prerequisite: only the questions downstream of it wait for the result, so put the rest of the frontier in this round. Done when every remaining frontier question is one only the user can answer.

2. **Write the round.** Append `## Round N` to the file, holding the whole frontier ranked most-consequential-first, in the template's format. Every question is one idea, carries your recommended answer, and ends in an empty stub. Close the round with its `### Notes` block. Done when every frontier question sits in the file with a recommendation and a stub.

3. **Hand over.** Report the file path and end your turn. The user edits in their own editor and replies when they're finished. Done when the user replies.

4. **Absorb.** Re-read the whole file. Write each empty stub's recommendation into it as `> _[accepted by default]_ <the recommendation>`, so the file records every decision the user made by staying silent. Read `### Notes` as first-class input to the tree. An answer the user changed in an earlier round re-opens that decision: recompute the branches downstream of it and re-ask what the change invalidated. A fact they struck or rewrote re-opens every decision that rested on it, exactly the same way. Done when every question in the file carries an answer.

Then recompute the frontier and run the next round.

## Finishing

The session ends when the frontier is empty: every branch of the design tree visited, nothing left silently assumed. Append a `## Decisions` section — the settled design written as a design, with the Q&A scaffolding stripped out. Don't restate the facts there; where a decision is only right because a fact holds, write that dependency into the decision itself. Report the path, and stop there. Act on the plan once the user confirms the shared understanding.
