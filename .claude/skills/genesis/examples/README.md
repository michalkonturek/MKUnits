# genesis worked examples

Five designs produced by the genesis skill, recommended reading order.
Each example is the verbatim output of an architect session that loaded
SKILL.md and applied the eight-step process. Numbers 03-05 are
cold-load runs from a fresh agent context (no prior conversation, no
human cleanup).

| # | File | What it shows |
|---|---|---|
| 01 | [readme-iteration.md](01-readme-iteration.md) | A8 ALIGNMENT LOOP applied to README iteration. Single-skill, single goal-steward. |
| 02 | [review-panel-architecture.md](02-review-panel-architecture.md) | Re-architecture lesson: a multi-lens panel anti-pattern (everything in one thread) and the corrected design. |
| 03 | [release-notes-single-skill.md](03-release-notes-single-skill.md) | Minimal output: 1 skill + 2 assets + 3 scripts. A9 SUPERVISED EXECUTION + S7 + S4. A1 PANEL considered and rejected (lens-count gate did not fire). |
| 04 | [pr-review-advisory.md](04-pr-review-advisory.md) | Multi-primitive panel: 6 personas + 4 assets + 3 scripts + trigger + entrypoint + rule + evals. A6 EVENT + A1 PANEL + DISSENT-WEIGHTED arbiter. R1 SPLIT considered, applied at lens content as R3 EXTRACT. |
| 05 | [pr-review-verdict.md](05-pr-review-verdict.md) | Same prompt as 04 with one constraint removed (verdict required). Regime change: deterministic bridges, schema gate, post-emit verifier loop, graceful tool probes. A8 ALIGNMENT LOOP, B5 ESCALATION, R1 SPLIT considered and rejected with WHEN-clause grounding. |

## How 03-05 were produced

A general-purpose agent received only:

1. Path to SKILL.md
2. The operator prompt verbatim (no genesis vocabulary)
3. Instructions to load assets per progressive disclosure
4. Constraints: cite patterns with WHEN-clause quotes, render mermaid, apply W6 / W6.2 / W6.3, ASCII-only, stop at step 6 handoff packet

No prior genesis context was carried in. The output is what the
skill, cold-loaded, produced.

## Why ship them

The examples answer two questions the README cannot:

- **Does the skill produce the same output every time?** No. It is
  prompt-sensitive in a disciplined way. Compare 03 (single skill) to
  04 (17 primitives) to 05 (regime change with hardened pipeline).
- **Can I trust the design choices?** Each example shows patterns
  CONSIDERED and REJECTED with WHEN-clause grounding. Most prompt
  engineering tools never show their rejection logic, so you cannot
  tell whether a design is justified or arbitrary.
