# Pattern tradeoffs (cross-cutting reference)

The catalogue (Tier-3 architectural, Tier-2 design) tells you what
patterns EXIST. This file tells you when to pick X vs Y when both
fit. Architects need tradeoff matrices, not just lists.

Load this when:

- Two or more patterns from `architectural-patterns.md` or
  `design-patterns.md` fit a slot and you must choose.
- A reviewer asks "why this pattern instead of that one?"
- You are extending the catalogue and need to position a new entry
  against neighbours.

Each matrix is a closed system: every cell is named, no axis
silently dominates, and at least one row of each matrix appears in
the worked examples.

---

## 1. Hallucination countermeasures (truth #4 -> patterns)

Maps each named LLM substrate truth to the patterns that mitigate
its failure mode. Use this when reviewing a design that does NOT
name a countermeasure: the truth tells you which pattern is missing.

| Truth (system property)                | Failure mode                       | Countermeasure pattern(s)                |
|----------------------------------------|------------------------------------|------------------------------------------|
| #1 CONTEXT IS FINITE AND FRAGILE       | attention drift; goal loss         | B4 PLAN MEMENTO + B8 ATTENTION ANCHOR    |
| #2 CONTEXT MUST BE EXPLICIT            | tacit hand-off; assumed memory;    | B4 PLAN MEMENTO; explicit handoff        |
|                                        | PHANTOM DEPENDENCY (named in       | packet; declare external deps at the     |
|                                        | prose, undeclared to loader)       | distribution surface + S7/A9 probe       |
| #3 OUTPUT IS PROBABILISTIC             | high-variance outputs              | S7 DETERMINISTIC TOOL BRIDGE; S4         |
|                                        |                                    | VALIDATION DECORATOR (S7 is the primary  |
|                                        |                                    | cure for consequential side effects)     |
| #4 HALLUCINATION IS INHERENT           | fabricated facts in thin regions   | C2 PERSONA PRELOAD with GROUNDED EXPERT  |
|                                        |                                    | BRIEFING; C6 EXTERNAL CORPUS GROUNDING;  |
|                                        |                                    | A7 ADVERSARIAL REVIEW; B10 HUMAN         |
|                                        |                                    | CHECKPOINT                               |
| #5 PRETRAINING IS FROZEN AND CUTOFF    | stale facts; outdated APIs/specs   | C6 EXTERNAL CORPUS GROUNDING (primary)   |
|                                        |                                    | with explicit cutoff-aware fetch         |
| (architectural) COMPOSITION            | tangled module graph; dup logic    | R1 SPLIT; R3 EXTRACT; module SoC pass    |
| (architectural) PLAN BEFORE EXECUTION  | improvised execution; goal drift   | A1/A2/A4/A5 + B4 + A8 ALIGNMENT LOOP     |
| (architectural) DISTRIBUTION HYGIENE   | BUNDLE LEAKAGE (maintainer-scope   | ship-time vs run-time scope split:       |
|                                        | files inside user-facing module    | non-runtime assets live OUTSIDE the      |
|                                        | -> PAYLOAD BLOAT + DISPATCH        | module entrypoint (contributor-only      |
|                                        | CONTAMINATION); inverse of         | directory). See composition-substrate    |
|                                        | PHANTOM DEPENDENCY                 | "Anti-patterns flagged at this step".    |

Reviewer instruction: when flagging a design as missing a
countermeasure, name BOTH the pattern AND the truth it serves. A
naked pattern recommendation is harder to remember than a pattern
that addresses a system property.

---

## 2. Gate types (where in the system; what kind of judgement)

Quality gates are not a single thing. Cut on two axes: WHO renders
the verdict (the agent itself vs an outside source) and HOW the
verdict is rendered (programmatic check vs judgement call). The
2x2 closes the gate-design space.

```
                       PROGRAMMATIC VERDICT          JUDGEMENT VERDICT
                       (deterministic check)         (LLM or human)

INTERNAL VERDICT       S4 ACCEPTANCE OBSERVER        B9 GOAL STEWARD
(agent itself          - schema check                - "are we still on goal?"
 or its threads)       - test pass / fail            - drift detection
                       - lint                        - intent vs output
                                                        compare

EXTERNAL VERDICT       A7 ADVERSARIAL REVIEW         B10 HUMAN CHECKPOINT
(outside the agent     COLD READER (a fresh-         - human approves before
 process)              context thread reads          continuation
                       artifact, programmatic        - hard handover for
                       rubric)                          irrecoverable steps
```

Selection rule: pick the cell that matches the failure mode you
are guarding against, not the first gate that fits. A test suite
will not catch goal drift. A human checkpoint will not catch a
schema violation. A cold reader will not catch a hallucinated
external fact (use C6 grounding plus A7 with deterministic
verification instead).

---

## 3. Grounding doctrine (where the facts come from)

Two axes: WHAT source (internal vs external) and WHEN loaded (eager
vs lazy / on-demand).

```
                            EAGER LOAD                 LAZY / ON-DEMAND LOAD
                            (preloaded into context)   (loaded at the step that needs it)

INTERNAL SOURCE             C2 PERSONA PRELOAD         C1 LAZY ASSET
(corpus the agent owns:     - lens biases inference    - asset loads at step N
 personas, prior plans,     - whole-session scope         only
 project files)             - PROSE: Reduced Scope     - PROSE: Progressive
                                                        Disclosure

EXTERNAL SOURCE             EAGER EXTERNAL FETCH       C6 EXTERNAL CORPUS
(spec, web, API, live       (rare; only for stable     GROUNDING
 repo state)                cross-session anchors)     - fetch at use-time
                                                       - bound the scope of
                                                         what corpus owns
```

The `EAGER EXTERNAL FETCH` cell is rarely the right answer; live
sources go stale or fail at the worst moment. The default for
external facts is C6 LAZY EXTERNAL with an explicit fallback when
the fetch fails.

Bounded-scope rule (C6 sub-rule). Every external grounding
declaration MUST specify what the corpus is authoritative FOR.
Authority overreach (importing the corpus's framing into questions
it does not own) is a HIGH-severity finding. See agentskills.io vs
genesis taxonomy in `primitives.md` for the canonical example.

---

## 4. Threading topology (parallel vs sequential x shared state)

```
                            PARALLEL THREADS              SEQUENTIAL THREADS
                            (independent context windows) (one window flows into next)

NO SHARED STATE             B1 FAN-OUT + SYNTHESIZER      B2 CONDITIONAL DISPATCH
(each thread acts on its    - default for >=3 lenses      - one branch fires
 own inputs; merges only    - PANEL (A1) topology         - lens chosen by input
 at fan-in)                                                  class

SHARED STATE                interlock + SUPERVISOR (B3)   B5 ACCEPTANCE OBSERVER
(threads write to same      - rare; usually means SoC     between stages
 sink)                        was wrong; redesign first   - PIPELINE (A2)
                                                          - WAVE EXECUTION (A5)
```

PARALLEL + SHARED STATE is almost always a smell. If a design lands
there, redesign for SoC; one writer per sink is the durable rule.

---

## 5. Synthesis style (PANEL fan-in shapes)

When N lenses produce N verdicts, the synthesis is itself a
decision. Pick the shape:

| Shape                  | When                                             | Cost                                            |
|------------------------|--------------------------------------------------|-------------------------------------------------|
| CONSENSUS              | all N must agree                                 | high blocking risk; one outlier stalls          |
| MAJORITY               | top-N majority wins                              | suppresses dissent; loses high-info signal      |
| DISSENT-WEIGHTED       | majority view + explicit dissent rationale       | preferred default for technical reviews        |
| CEO-ARBITRATED         | a goal-steward persona arbitrates after lenses   | best when lenses optimize for different axes    |
| FALL-THROUGH (FAILED)  | concatenate N reports, no decision               | PANEL-WITHOUT-SYNTHESIS anti-pattern; redesign  |

Reviewer rule: a synthesis that does not name a shape from this
table is structurally absent. Flag PANEL-WITHOUT-SYNTHESIS.

---

## 6. Persona composition (how many lenses per thread)

| Composition                      | When                                              | Risk                                         |
|----------------------------------|---------------------------------------------------|----------------------------------------------|
| SINGLE PERSONA, FULL SESSION     | one stable lens, no role switch                   | (none material at this granularity)          |
| PERSONA CHAIN (preload several)  | one thread that needs >1 lens layered             | hybrid lens; later persona biases earlier    |
|                                  |                                                   | -- usually a smell that the work needs       |
|                                  |                                                   | splitting into multiple threads              |
| RUNTIME-RESOLVED PERSONA         | persona chosen by a dispatcher mid-flow           | mid-session persona swap (anti-pattern):     |
|                                  |                                                   | earlier tokens still in attention             |

Default: ONE thread, ONE persona. If you need >1 lens, use B1
FAN-OUT + SYNTHESIZER with one thread per lens.

---

## 7. Plan persistence (B4 PLAN MEMENTO vs B8 ATTENTION ANCHOR)

Both fight goal drift; they are not interchangeable.

| Pattern                  | What it persists                | What it re-injects                | When sufficient alone   |
|--------------------------|---------------------------------|-----------------------------------|-------------------------|
| B4 PLAN MEMENTO          | the FULL plan as an artifact    | nothing -- agent reloads on demand| short multi-step work   |
| B8 ATTENTION ANCHOR      | the GOAL + hard constraints     | a small token block per turn      | medium-length sessions  |
| B4 + B8 (combined)       | full plan in store + goal anchor| anchor every turn; plan on grounding pivot | DEFAULT for long sessions / spawn-bound work |

Selection rule: if the work is multi-step OR multi-file OR
spawn-bound, COMBINE B4 + B8. Either alone has a known failure
mode at scale.

---

## 8. Refactor triggers (R1 SPLIT vs R3 EXTRACT)

Both reduce a module's surface; the cut is different.

| Trigger                                          | Fix      | Why                                                                  |
|--------------------------------------------------|----------|----------------------------------------------------------------------|
| description contains "and" connecting 2 capabilities | R1 SPLIT | dispatcher cannot match cleanly; signature is two functions in one   |
| caller loads only fragments of body              | R1 SPLIT | the body has more than one coherent unit                             |
| body contains content that belongs to a sibling  | R3 EXTRACT | the content is not module-shaped; it is asset-shaped                |
| body inlines content that another module already owns | R3 EXTRACT + depend | duplication; depend on the existing module instead             |
| module is a thin proxy with one caller and one reference | R4 INLINE | extra hop, no value; collapse                                  |

When in doubt: R3 EXTRACT first (preserve the module surface), then
R1 SPLIT only if the remaining body still violates SRP.

---

## How to use this file

1. While walking the genesis 8-step procedure, if step 3 surfaces
   two patterns that fit the same slot, load this file.
2. Find the matrix that cuts the choice you face. Read the cell
   text and the selection rule.
3. In the step 6 handoff packet, cite the matrix you used and the
   row you chose. Reviewers should be able to reproduce the choice
   from the same matrix without reading your reasoning.

Anti-pattern: TRADEOFF SKIPPED. The handoff packet picks pattern X
over Y without naming the axis. Reviewers cannot tell whether the
choice was deliberate or accidental.

---

## 9. Execution doctrine (LLM-asserted vs tool-delegated)

For each step in the design that produces a value or causes a side
effect, decide where the work runs. This matrix prevents HAND-ROLLED
HALLUCINATION (asserting an answer in prose when a tool could produce
the actual answer).

|                       | LLM-asserted (prose-only)             | Tool-delegated (S7 bridge)                  |
|-----------------------|----------------------------------------|----------------------------------------------|
| EAGER (run now)       | OK for: judgement calls, synthesis,    | OK for: reads against systems of record     |
|                       | summary, plan composition, persona     | (current branch, file content, db row),     |
|                       | output. NOT OK for: facts, side        | quick deterministic computations (hash,     |
|                       | effects.                               | parse, lint).                                |
| LAZY (run at invoke)  | OK for: deferred prose generation      | OK for: state-changing operations behind    |
|                       | (description, body) gated by another   | B10 HUMAN CHECKPOINT or precondition gate;  |
|                       | step. NOT OK for: anything claimed     | irreversible actions (deploy, migrate,      |
|                       | "verified" in the body itself.         | delete, post, payment).                     |

Selection rule (read top-down; first match wins):

1. The step names a SIDE EFFECT against a system of record (file
   system, repo, db, queue, cluster, external API).
   -> Tool-delegated. If irreversible, gate with S4 precondition +
   B10 HUMAN CHECKPOINT.
2. The step depends on a FACT THAT MUST BE TRUE (current state,
   versioned API shape, file content, hash).
   -> Tool-delegated. LLM recall is not authoritative for present
   state; truth #5 says pretraining is frozen.
3. The step is COMPOSITION, JUDGEMENT, or LANGUAGE production
   (rationale, summary, structured plan, persona output).
   -> LLM-asserted. Bridging here loses the value the LLM brings.
4. The step is "verify" or "double-check" of a tool output.
   -> Tool-delegated by ANOTHER tool, not by the LLM (anti-pattern
   VERIFY-WITH-LLM-ONLY). The LLM may INTERPRET the second tool's
   output, but the verification itself is deterministic.

Cite this matrix in the handoff packet's per-step annotation. Each
step labelled "tool" must name the substrate (CLI / script / MCP /
API). Each step labelled "LLM" must name what kind of judgement it
performs.
