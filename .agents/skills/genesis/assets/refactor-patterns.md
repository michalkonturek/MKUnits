# Refactor patterns (source-time, orthogonal to the tier stack)

A refactor pattern restructures the module graph at SOURCE TIME. It is
orthogonal to the runtime topology a Tier-2 design pattern or Tier-3
architectural pattern describes. Refactor patterns answer:

> "Is this one primitive or N? Does this content belong here? Should
>  these two depend on a third?"

Apply refactor patterns BEFORE you re-pick a Tier-2 / Tier-3 pattern.
Restructuring the module graph often dissolves the need for a more
elaborate runtime topology.

---

## R1. SPLIT (decomposition)

CLASSICAL ANALOG: Function extraction; module decomposition along
Single Responsibility; Separation of Concerns refactor.

PROBLEM: a module has grown to do more than one job, OR the dispatcher
cannot route cleanly because the module's signature names two
capabilities.

TRIGGERS (any one fires):
- DESCRIPTION CONJUNCTION. The frontmatter `description` uses "and"
  between two trigger noun-phrases, or uses two distinct trigger
  verbs.
- FRAGMENT CALLERS. Real call sites need only a strict subset of the
  body. Loading the whole module on every dispatch hit pays context
  cost the caller does not benefit from.
- BODY OVER BUDGET. The module body exceeds the harness's sustainable
  per-skill load budget.
- MULTI-LENS BODY. The body internally toggles between two or more
  reviewer lenses, voices, or rule sets (the GOD MODULE smell as a
  split trigger).
- DIVERGENT CHANGE CADENCE. Two parts of the body change for unrelated
  reasons (unit-of-change / SRP violation).

PROCEDURE:
1. Identify the natural seam (one trigger noun-phrase per resulting
   module, one lens per resulting module).
2. Extract each capability into its own module, with its own
   description and its own minimal body.
3. Decide the fate of the original entrypoint: EITHER (a) it becomes
   a thin orchestrator that dispatches to the new modules via
   B2 CONDITIONAL DISPATCH, OR (b) delete it and update its callers.
   Do not leave both.

```
before                          after
+------------------+            +-------------+
| skill X          |   split    | skill X1    |
|  - capability A  |  ------>   |  - cap A    |
|  - capability B  |            +-------------+
|  - capability C  |            | skill X2    |
+------------------+            |  - cap B    |
                                +-------------+
                                | skill X3    |
                                |  - cap C    |
                                +-------------+
```

COMPOUNDING GAIN. Splitting a skill is the modularization decision
that pays twice. Once in cohesion: the caller targets exactly one job
and the dispatcher signature stays sharp. Once in attention: a split
skill becomes individually invocable via CHILD-THREAD SPAWN, so its
body runs in a fresh context window instead of competing for tokens
with the parent's session. Splits with this dual payoff are the
highest-priority candidates -- they convert a SoC win into a
context-isolation win for free.

ANTI-PATTERN (PREMATURE SPLIT): do NOT split when none of the triggers
fire. Each split adds a dispatch-table entry, a description that must
disambiguate from siblings, and a collision risk paid on every session
start. Splitting a 50-line single-trigger skill into five skills is the
agentic analogue of writing 10 functions for a 50-line program:
overhead exceeds benefit, and the dispatcher pays the cost forever.

---

## R2. FUSE (consolidation)

CLASSICAL ANALOG: Inline class; merge module.

PROBLEM: two or more sibling modules whose descriptions overlap or
whose bodies are short and always co-invoked. The dispatcher pays
collision cost; callers pay multi-spawn cost; maintainers edit two
files for one change.

TRIGGERS (any one fires):
- DISPATCH COLLISION. Two installed siblings have descriptions whose
  trigger nouns / verbs overlap. The dispatcher guesses; misses go
  silent.
- LOCKSTEP CO-INVOCATION. Module A is never invoked without module B
  immediately after. The split adds dispatch overhead with no
  composition benefit.
- TINY SIBLINGS. Multiple siblings whose bodies fall well below the
  harness's per-skill budget AND that share the same lens. Each
  sibling pays a dispatcher entry for content too small to warrant
  one.

PROCEDURE:
1. Confirm the merge does not re-trigger any R1 SPLIT signal (no
   description conjunction, no multi-lens body, etc.). If it does,
   the symptom is a wrong original split, not a missing fusion.
2. Combine into one module with a single sharp description. Update
   callers to invoke the merged entrypoint.
3. Delete the obsolete module(s) and any depend-on edges to them.

ANTI-PATTERN (FORCED FUSION): merging two modules that genuinely
serve different lenses just to reduce dispatcher entries. The
dispatcher cost was the symptom; the disease was a too-broad
description on one of them. Sharpen the description first; only fuse
if R2's triggers still fire.

---

## R3. EXTRACT (promote to module)

CLASSICAL ANALOG: Extract Class; move method to a new module.

PROBLEM: content lives INLINE inside a module body that should be its
own primitive (a persona, a rule file, a sibling skill, an asset).
The module mixes lenses, or the inlined content is needed by other
modules, or the inlined content has its own change cadence.

TRIGGERS (any one fires):
- DUPLICATED INLINE CONTENT. The same paragraph appears inside two or
  more modules' bodies. The next edit will diverge silently.
- WRONG-LENS INLINE. A module body inlines content from a different
  lens (a persona inlines a rule; a skill inlines a persona). The
  body now plays two roles.
- REUSE PRESSURE. The inlined content would be useful to a sibling
  module that does not currently load this one.
- MAINTAINER-ONLY CONTENT. The inlined content has no run-time
  consumer in the user-facing bundle (eval scenarios, contributor
  scripts, dev fixtures) but is structurally shaped like a primitive
  (e.g. a SKILL.md whose description LOOKS LIKE a real user request).

PROCEDURE:
1. Lift the content into its own primitive at the right tier (PERSONA
   SCOPING FILE for a lens, SCOPE-ATTACHED RULE FILE for a constraint,
   shared asset for knowledge).
2. Replace the inlined block in the source module with a relative-path
   reference (S5 LAZY PROXY).
3. Verify all callers of the original module still work, and any new
   callers that need the extracted content depend on it directly.
4. If the extracted module crosses a project boundary (it becomes an
   EXTERNAL MODULE per `composition-substrate.md`), ALSO DECLARE the
   new dependency at the dependent module's distribution surface
   (manifest dep entry / companion-module recommendation in the body
   + tool-call probe at the use-site). Otherwise the dependent ships
   with PHANTOM DEPENDENCY -- the reference exists in prose only and
   the harness loader cannot supply the extracted module.

ANTI-PATTERN (PROMOTION-WITHOUT-NEED): extracting content whose only
caller is and will remain the original module, where the rule of three
will plausibly never fire. Each extraction adds a file to maintain and
a load step to pay. See `composition-substrate.md` PROMOTION RULE.

NOTE: when the trigger is MAINTAINER-ONLY CONTENT, the extracted
primitive MUST be placed OUTSIDE the user-facing module's
distribution surface (a contributor-only directory whose distribution
boundary excludes it). Otherwise the extraction creates BUNDLE
LEAKAGE: see `composition-substrate.md` "Anti-patterns flagged at
this step". The package-manager realization of this rule lives in
`module-system-adapters/apm.md` "APM publish-time rules".

---

## R4. INLINE (collapse a thin proxy)

CLASSICAL ANALOG: Inline function / inline variable.

PROBLEM: a primitive exists only as a thin proxy that always loads
exactly one other primitive's content. The indirection costs a load
step and a maintenance file for no reuse benefit.

TRIGGERS (any one fires):
- SINGLE-CALLER, SINGLE-CONTENT. The primitive has exactly one caller
  and its body is exclusively a reference to one other primitive.
- DEAD VARIATION. A primitive was extracted in anticipation of N
  variants; only one variant ever existed.

PROCEDURE:
1. Confirm no in-flight or near-future caller plans to use the proxy.
2. Inline the referenced content back into the calling module's body
   (or replace the reference with a direct depend-on edge to the real
   target, skipping the proxy).
3. Delete the proxy file and any depend-on edges to it.

ANTI-PATTERN (RUSHED INLINE): inlining a proxy that genuinely shields
callers from a future migration. If the proxy exists for portability
across harnesses or for a planned variant fan-out, leave it.

---

## How refactor patterns relate

```
R1 SPLIT     <-- triggers: cohesion / dispatch / context-budget
R2 FUSE      <-- triggers: collision / lockstep / tiny-siblings
R3 EXTRACT   <-- triggers: duplication / wrong-lens / reuse pressure
R4 INLINE    <-- triggers: single-caller proxy / dead variation
```

R1 and R2 are duals (split / merge). R3 and R4 are duals (extract /
inline). Together they govern primitive granularity in both directions
and at both scales (module-level and content-level).

PROMOTION SYMMETRY: R3 EXTRACT -> promote a leaf to a depended module
when reuse pressure justifies it. R1 SPLIT -> split a monolith into
siblings when load / cohesion / dispatch-cost pressure justifies it.
See `composition-substrate.md` for the full PROMOTION RULE.

---

## When to apply (sequence guidance)

Refactor patterns run BEFORE Tier-2 and Tier-3 selection. The order:

1. Run R-pattern triggers across the existing module graph. Apply any
   that fire.
2. Re-pick the Tier-3 architectural pattern with the cleaner graph.
3. Decompose into Tier-2 design patterns.
4. Only at codegen time, load the Tier-1 idioms for the target
   harness.

A common trap: skipping step 1 and reaching for a more elaborate
Tier-3 pattern (e.g. STAFFED PLAN with per-task staffing) when the
real fix was an R1 SPLIT of an over-broad existing module.
