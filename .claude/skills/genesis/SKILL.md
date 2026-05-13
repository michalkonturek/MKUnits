---
name: genesis
description: >-
  Use this skill BEFORE drafting any agentic primitive module (skill,
  persona scoping file, scope-attached rule file, orchestrator workflow)
  or when refactoring an existing one. Activate whenever the task asks
  to design, restructure, or critique an agentic module across any
  agent harness (Claude Code, Copilot, Cursor, OpenCode, Codex). This
  skill drives an 8-step disciplined design process whose output is
  mermaid diagrams + an interface sketch + a persisted plan that the
  calling thread (or a coder persona it loads) then turns into
  natural-language modules. Do not skip to natural-language drafting
  before the design artifacts exist.
---

# genesis: agentic primitives architecture (design discipline)

[Architect persona](agents/genesis-architect.agent.md)

This skill encodes a disciplined process for designing agentic
primitive modules. Markdown that steers an LLM is code; you do not
write production code without a design. The output of this skill is
DESIGN ARTIFACTS, not finished modules. A separate coding step
emits the natural-language modules from the artifacts.

## When to activate

- Authoring a new skill, persona scoping file, scope-attached rule
  file, or orchestrator workflow.
- Refactoring an existing module that violates SoC, composition,
  or threading rules (e.g. sequential single-loop where fan-out
  fits).
- Cross-cutting redesigns spanning multiple primitive modules.
- Reviews where structure (not domain content) is in question.

## Hard rules

- Diagrams are written before any natural-language module body.
- No harness-specific syntax appears in the persona reasoning or in
  this SKILL.md. Harness syntax lives only in
  `assets/runtime-affordances/per-harness/<harness>.md` and is
  loaded only at step 7.
- A primitive that targets multiple harnesses MUST be designed
  against `assets/runtime-affordances/common.md` first; reaching
  into a per-harness adapter requires a justified declaration per
  `assets/runtime-affordances/portability-rules.md`.
- The handoff packet at step 6 is the only artifact passed forward.
  No tacit context.

## Process

```
   1 intent + scope
        v
   2 component diagram   <-- load assets/mermaid-conventions.md
        v                    load assets/primitives.md
        v                    load assets/design-patterns.md
        v                    load assets/architectural-patterns.md
        v                    load assets/refactor-patterns.md
   3 thread / sequence diagram
        v
 3.5 composition decision  <-- load assets/composition-substrate.md
        v                    (per-box: inline | sibling | external module)
   4 SoC pass against existing modules
        v
   5 classic + PROSE + LLM-physics compliance check
        v
   6 handoff packet (diagrams + interface sketch + declared targets
                     + module composition table + todos)
        v             [PERSIST PACKET to plan store; truth #5]
        v                                      [DESIGN ENDS HERE]
   ----- caller / coder thread takes over -----
   7a portability check
        v                  load runtime-affordances/common.md (always)
   7b draft natural-       load runtime-affordances/per-harness/<x>.md
      language module      ONLY if step 7a flagged a per-harness need
        v                  load module-system-adapters/<tool>.md
        v                  ONLY if step 3.5 declared external modules
        v                  RELOAD plan before each module / spawn
   8 validate against diagrams + lint (PROSE 5-axis, size budget,
     ASCII, coherent unit, portability honored, declared external
     modules wired correctly)
```

### Step 1 - intent + scope

Write one paragraph: the user-facing capability, the trigger
conditions, the boundary (what it does NOT do). Apply Single
Responsibility: if the paragraph contains "and" connecting two
distinct capabilities, split into two designs.

Also draft the dispatch description that will become this module's
frontmatter `description`: name the trigger nouns and verbs, the
boundary, and the intended invocation mode (FORCED | DISCOVERY |
BOTH). This is the function signature the dispatcher LLM matches
against; see the persona's "Skill dispatch" section.

The description follows four rules from the canonical spec for the
MODULE ENTRYPOINT primitive (see `assets/primitives.md` -- the
agentskills.io optimizing-descriptions page is the load-bearing
authority; verify against the live URL):

- IMPERATIVE phrasing. Frame as an instruction to the agent: "Use
  this skill when ..." rather than declarative "This skill does ...".
- USER INTENT over mechanics. Describe what the user is trying to
  achieve, not the skill's internal procedure.
- INDIRECT TRIGGERS named. List contexts where the skill applies
  EVEN IF the user does not name the domain directly. Be pushy.
- LENGTH CAP <= 1024 characters (canonical spec hard limit per
  `assets/primitives.md` MODULE ENTRYPOINT; silent rejection above
  this).

### Step 2 - component diagram (mermaid)

Load:
- `assets/primitives.md`
- `assets/design-patterns.md`
- `assets/architectural-patterns.md`
- `assets/refactor-patterns.md`
- `assets/mermaid-conventions.md`

Emit a `flowchart` showing every primitive module the design uses
and which other modules it depends on (via links). Mark which
modules already exist vs new. Mark each module with one of:
PERSONA, SKILL, RULE, ORCHESTRATOR, ASSET.

### Step 3 - thread / sequence diagram (mermaid)

Emit a `sequenceDiagram` showing:
- Which thread spawns which (subagent fan-out).
- Where parent waits (fan-in / synthesis).
- Any interlock on shared sinks (one-writer rule).

Pattern selection runs in tier order, ALWAYS:

1. Run refactor-pattern triggers (`assets/refactor-patterns.md`)
   across the existing module graph. A missing R1 SPLIT or R3
   EXTRACT will distort every downstream pattern decision.
2. Pick a TIER 3 architectural pattern from
   `assets/architectural-patterns.md`. If the design's shape matches
   PANEL, PIPELINE, ORCHESTRATOR-SAGA, STAFFED PLAN, WAVE EXECUTION,
   or EVENT-DRIVEN, name it and inherit its anti-patterns verbatim.
3. Decompose into TIER 2 design patterns
   (`assets/design-patterns.md`) along the GoF axes. ATTENTION ANCHOR
   (B8) and PLAN MEMENTO (B4) are MANDATORY on any non-trivial work.
4. TIER 1 idioms (`assets/runtime-affordances/per-harness/<x>.md`)
   load only at codegen time (step 7b), not now.

If the design has >=3 independent lenses with no shared state and
the diagram shows a single-thread loop, redo: it is a fan-out
opportunity. The default for that shape is FAN-OUT + SYNTHESIZER (B1)
realizing PANEL (A1).

### Step 3.1 - tradeoff check (only if alternatives in tension)

If step 3 surfaced two or more patterns that fit the same slot, load
`assets/pattern-tradeoffs.md`. Find the matrix that cuts the choice
(hallucination countermeasures; gate types; grounding doctrine;
threading topology; synthesis style; persona composition; plan
persistence; refactor triggers). Pick the cell that matches the
failure mode you are guarding against, not the first pattern that
fits. Cite the matrix and the row in the step 6 handoff packet so
reviewers can reproduce the choice.

Skip this step if step 3 produced an unambiguous pattern selection.

### Step 3.5 - composition decision

Load `assets/composition-substrate.md`. For EACH box in the
component diagram, decide its composition mode and record the
rationale:

- INLINE asset within this primitive (default for content unique
  to this module).
- LOCAL SIBLING primitive in the same source tree (default when
  the content is reused only within this project). Before placing
  it, ask: does the USER-FACING bundle need this AT RUNTIME? If
  no (eval scenarios, contributor scripts, dev fixtures), it is
  maintainer-scope -- place it OUTSIDE the user-facing module's
  distribution boundary (contributor-only directory). Otherwise
  the module ships with BUNDLE LEAKAGE (see
  composition-substrate.md anti-patterns).
- EXTERNAL MODULE pulled in via the project's module system
  (default when the content meets at least one of: rule of three
  -- needed in 3+ projects; independent release cadence; owned by
  a different team; benefits from version pinning across
  consumers).

Then sketch a `flowchart LR` DEPENDENCY GRAPH showing this module
plus its declared external modules and any transitive closure
edges you can name. Mark each edge with the composition mode.

If any external module is declared, two things follow. (1) The
handoff packet MUST list it under "external modules required" so
the coder step (7b) loads the module-system adapter. (2) The
emitted module that depends on it MUST DECLARE the dependency at
its OWN distribution surface -- otherwise the module ships with
PHANTOM DEPENDENCY and downstream loaders cannot supply the
adapter. The chosen DECLARATION MECHANISM is recorded in the
handoff packet (step 6) and is one of:
- manifest dependency entry, when the emitted module ships
  through a module system that supports them;
- companion-module recommendation in the SKILL.md / README body
  PLUS a tool-call probe at the use-site (mirrors the A9
  SUPERVISED EXECUTION flow this skill applies at its own step
  7b for the module-system adapter);
- both, when the module system supports manifest deps AND the
  emitted module also ships standalone to users who do not run
  that module system.

### Step 4 - SoC pass

For each module in the component diagram (now annotated with
composition modes from step 3.5), check:
- Does an existing module already do this? If yes, depend on it
  via link; do not duplicate. If the existing module lives outside
  this project, mark it EXTERNAL MODULE and revisit step 3.5.
- Does this module overlap a sibling's trigger conditions? If yes,
  redraw boundaries.
- Does this module's dispatch description collide with an installed
  sibling's description? If yes, narrow one or merge. (DISPATCH
  COLLISION; HIGH severity.)
- Does the module body trip any R1 SPLIT trigger (description
  conjunction, fragment callers, body over budget, multi-lens body,
  divergent change cadence)? If yes, redesign per R1. If none fire
  but the design splits anyway, flag PREMATURE SPLIT.
- Does the module's existence collapse to one short body always
  loaded with a sibling? Apply R2 FUSE.
- Does the body inline content that belongs in a separate persona /
  rule / asset? Apply R3 EXTRACT.
- Does a thin proxy primitive exist with one caller and one
  reference? Apply R4 INLINE.
- Does the body name a CONSEQUENTIAL SIDE EFFECT (apply, delete,
  post, deploy, migrate, mutate state) or a FACT THAT MUST BE TRUE
  (current state, version, hash, file content) and leave it as
  LLM-asserted prose? If yes, that step MUST cross S7
  DETERMINISTIC TOOL BRIDGE; pick the EXTENSION PATH (preloaded
  terminal, custom CLI/script/API, or MCP server) per the S7
  selection rule. Default to the preloaded terminal where an
  installed CLI already does the job. Wrap with A9 SUPERVISED
  EXECUTION when the work spans plan + execute + verify.
See `assets/refactor-patterns.md` for the full trigger set.

### Step 5 - compliance check

Apply each row of the persona's classic principles table; flag
violations with severity (BLOCKER / HIGH / MEDIUM / LOW). Then
apply the PROSE constraints (Progressive Disclosure, Reduced
Scope, Orchestrated Composition, Safety Boundaries, Explicit
Hierarchy) and the seven durable LLM truths. Any BLOCKER stops
the design; return to step 2.

Also enforce the MODULE ENTRYPOINT canonical spec compliance row
(BLOCKER on any miss; verify against the live spec linked from
`assets/primitives.md`):

- `name` field is 1-64 characters, lowercase `[a-z0-9-]`, no
  leading / trailing / consecutive hyphens, AND equals the parent
  directory name. Mismatch = harness rejects the module.
- SKILL.md body <= 500 lines AND <= 5000 tokens. Overflow does NOT
  stay in the body; it moves to `references/<topic>.md` and the
  body links to it with an explicit LOAD TRIGGER condition (e.g.
  "Read `references/api-errors.md` if the API returns non-200")
  rather than a generic "see references/".

### Step 6 - handoff packet (this IS the plan; persist it)

Produce a single artifact containing:
- The component diagram (step 2).
- The thread/sequence diagram (step 3).
- The dependency graph diagram (step 3.5).
- A short interface sketch per module: name, trigger description,
  inputs, outputs, dependencies (as relative links).
- The module composition table: per box, INLINE | LOCAL SIBLING
  | EXTERNAL MODULE, with rationale.
- The list of external modules required (drives whether step 7b
  loads a module-system adapter). For EACH external module, ALSO
  record the DECLARATION MECHANISM chosen at step 3.5 (manifest
  dep | companion-module recommendation + tool-call probe | both).
  Drives step 8 validation that the emitted module did not ship
  with PHANTOM DEPENDENCY.
- The declared target set: `common-only` | `<list of harnesses>`.
- The intended invocation mode per module: FORCED | DISCOVERY |
  BOTH. (Drives how strict description-collision review must be.)
- Any compliance findings still open (with severity).
- A todo list (one entry per module to draft, plus validation),
  with dependencies between entries where they exist.
- An EVALS PLAN (canonical spec for MODULE ENTRYPOINT primitive
  evaluating-skills + optimizing-descriptions; see
  `assets/primitives.md`). At minimum:
  - 2-3 CONTENT EVALS: prompt + expected output, to be exercised
    twice (with the skill loaded and without it) so the value
    delta is visible. If `with_skill` and `without_skill` produce
    indistinguishable outputs, the skill is not adding value;
    redesign or delete.
  - ~20 TRIGGER EVALS for the dispatch description: 8-10 queries
    that should trigger plus 8-10 near-miss queries that should
    NOT, split 60/40 train/val. Validation split is the ship gate.

PERSIST THE PACKET. Per truth #5 (plan before execution) and
substrate concept 6 (PLAN PERSISTENCE), the handoff packet MUST
be written to the runtime's plan store BEFORE step 7b begins.
The exact location is harness-specific (see
`runtime-affordances/per-harness/<x>.md` -> section 6); the
substrate guarantees that a slot exists in every supported
harness. If unsure, write it to a markdown file named `plan.md`
in the session's working area; that is portable.

DESIGN ENDS HERE. Stop. Do not draft natural language.

### Step 7a - portability check (caller-side)

Caller loads `assets/runtime-affordances/common.md`. For each
module in the handoff packet, check whether its required
affordances are all in the common substrate.

If yes -> declared target = `common-only`; proceed to 7b loading
only `common.md`.

If no -> consult `assets/runtime-affordances/portability-rules.md`.
Either justify reaching into a specific harness adapter (and
declare the constraint in the module header) or redesign to fit
common substrate (return to step 2).

### Step 7b - draft natural-language module(s) (caller-side)

Using the loaded substrate (and per-harness adapter if justified),
emit each module's body. This is the only step that touches
today's syntax.

RELOAD THE PLAN before drafting each module, before each spawn,
and after each spawn returns. The plan was persisted at step 6
precisely so the executor can reground itself instead of relying
on degraded recall (truth #1, substrate concept 6, patterns
B4 PLAN MEMENTO + B8 ATTENTION ANCHOR).
Update the todo list as each module reaches done.

If the handoff packet declares any EXTERNAL MODULE under "external
modules required", a MODULE-SYSTEM ADAPTER must be loaded before
emitting manifest, CLI, or lockfile content. The adapter owns that
syntax; the architect persona stays ignorant of it. The current
canonical adapter is `apm-usage` (microsoft/apm-guide); other
adapters may exist or be authored later.

Apply A9 SUPERVISED EXECUTION here -- the adapter being reachable
is a fact-that-must-be-true (truth #2 CONTEXT EXPLICIT + truth #6
HARNESSES BRIDGE). Do not skip the probe; PHANTOM DEPENDENCY is
the failure mode otherwise.

1. PROBE via tool call: list installed skills / inspect the
   companion-skill registry / check the project root for an
   existing manifest. Do not assume the adapter is loaded from
   prose alone.
2. PROBE HIT -> load the adapter, then draft module bodies that
   delegate manifest / CLI / lockfile vocabulary to it.
3. PROBE MISS -> ASK the operator before emitting any module body.
   Surface three options:
   - install the canonical adapter:
     `apm install microsoft/apm/packages/apm-guide`
     (then re-probe).
   - raw-file fallback: emit primitive folders only, no manifest;
     print an explicit "you must wire these into your module
     system manually" banner so the operator is not surprised.
   - name another adapter handle to load.
4. Never emit `apm.yml`, `package.json`, or any specific manifest
   field from LLM recall. Either the adapter supplied the
   vocabulary (probe hit) or the operator chose raw-file fallback.
   Otherwise the failure chain is TOOLLESS ASSERTION ->
   HAND-ROLLED HALLUCINATION -> silent drift.

Use the canonical directory layout for any bundled content (the
MODULE ENTRYPOINT spec linked from `assets/primitives.md` is the
source of truth; verify if anything has moved):

- `scripts/` - executable programs invoked by the skill body via
  RELATIVE path. Must be NON-INTERACTIVE (agents run in shells with
  no TTY; any prompt blocks indefinitely). Pin tool versions on
  one-off commands (e.g. `npx eslint@9.0.0`). Document with
  `--help`. Emit STRUCTURED data (JSON / CSV) on stdout, diagnostics
  on stderr. List bundled scripts in the SKILL.md body so the agent
  can find them.
- `references/` - load-on-demand documentation. Every link from the
  body MUST state the trigger condition that loads it (see step 5).
- `assets/` - templates and data the skill emits or composes against.

Calibrate prescriptiveness PER SECTION: prescriptive on fragile or
sequenced operations; freedom on judgement calls. A uniformly
prescriptive body over-constrains; a uniformly free body
under-grounds. Prefer procedures (how to approach a class of
problems) over declarations (what to produce for one instance).
For any structured output the skill must produce, INCLUDE A
TEMPLATE inline -- agents pattern-match against concrete structure
better than against prose description.

### Step 8 - validate (caller-side)

- Each emitted module matches its interface sketch in the handoff
  packet.
- Token / line budget honored where the substrate specifies one
  (SKILL.md body <= 500 lines AND <= 5000 tokens; overflow moved
  to `references/`).
- `name` field passes the regex AND matches parent directory.
- `description` <= 1024 characters, imperative, intent-first,
  indirect-triggers named.
- ASCII only.
- Coherent unit (single responsibility).
- Declared targets honored: no per-harness syntax leaked into a
  `common-only` module.
- For every external module listed in the handoff packet, the
  emitted module declares the dependency at its distribution
  surface via the mechanism recorded at step 6 (manifest entry /
  companion-module recommendation + tool-call probe at use-site /
  both). Mere prose mention of the dependency handle is NOT
  declaration -- that is PHANTOM DEPENDENCY (see architect
  anti-patterns).
- Bundled scripts are non-interactive, version-pinned, --help
  documented, stdout/stderr split.
- EVALS GATE (from the step 6 evals plan):
  - `evals/evals.json` (or equivalent) is present and exercised
    `with_skill` vs `without_skill`. If no measurable delta,
    redesign or delete -- do not ship.
  - Trigger-eval validation split passes: rate >= 0.5 on
    should-trigger queries AND < 0.5 on near-miss should-not-
    trigger queries.
- REAL-TASK REFINEMENT: after structural lint passes, run the
  skill on at least one real task, capture the trace, and revise
  from what actually happened (not what you expected). One-shot
  drafts that never met execution are not done.

## Default pattern selection

When in doubt, pick the pattern that minimizes context degradation
in any one thread:

- 1 lens, 1 procedure -> single-loop sequential.
- >=3 independent lenses, no shared state -> fan-out + synthesizer.
- 2 lenses with sequential dependency -> single-loop sequential
  with a validation gate between them.
- Long-running cross-session work -> orchestrator with persisted
  artifact between phases.

See `assets/design-patterns.md` for the design-pattern catalogue (GoF
axes) and `assets/architectural-patterns.md` for the architectural
patterns (system-topology shapes).

## Worked examples

Worked examples ship in `examples/` alongside this SKILL.md file,
not in `assets/`. They are LAZY: load only when the operator explicitly
asks for an example or when a design step needs a reference shape
to imitate. The progressive-disclosure rule for assets does NOT
apply to examples; do not load them eagerly.

- `examples/01-readme-iteration.md` -- canonical shape for any
  creative, multi-round artifact work where cold-traffic conversion
  matters and goal drift is a real risk (READMEs, landing pages, PR
  descriptions, announcement posts). Composes A8 ALIGNMENT LOOP +
  A1 PANEL + A7 ADVERSARIAL REVIEW + COLD READER SIMULATION + B9
  GOAL STEWARD + B10 HUMAN CHECKPOINT.
- `examples/02-review-panel-architecture.md` -- canonical
  re-architecture lesson for any multi-lens module (panel, audit,
  multi-perspective critique). Walks one real panel from
  single-loop anti-pattern to fan-out + parent synthesizer.
- `examples/03-release-notes-single-skill.md` -- minimal output
  reference: when A1 PANEL is NOT warranted (lens-count gate did
  not fire). A9 SUPERVISED EXECUTION + S7 + S4, single thread.
- `examples/04-pr-review-advisory.md` -- multi-primitive panel
  reference: A6 EVENT + A1 PANEL + DISSENT-WEIGHTED arbiter, no
  side effects on a system of record beyond comment posting.
- `examples/05-pr-review-verdict.md` -- consequential-write
  reference: same panel as 04 with verdict emission added. Shows
  S7 + S4 + A9 verifier hardening, and explicitly rejects A8 /
  B5 / R1 with WHEN-clause grounding -- read this when stake
  pressure tempts you to add new orchestration layers.

## Outputs

A design session produces:

- The handoff packet (section "Step 6") committed alongside the
  module(s) it designs, OR posted as a comment on the PR that
  introduces them.
- The natural-language module bodies (drafted in step 7b).

The handoff packet is the source of truth for any future
refactor: re-running this skill starts from it, not from the
emitted natural language.
