# Mermaid Conventions for Agentic Module Design

Load this file at design-process step 2-3. It defines which mermaid
diagram types the architect emits at which step, and the
GitHub-render gotchas to avoid.

## Diagram-per-step mapping

| Step | Diagram type | Purpose |
|---|---|---|
| 2 | `flowchart` | component composition: which modules, which depend on which |
| 3 | `sequenceDiagram` | thread spawn / fan-in / interlock points |
| 3.5 | `flowchart LR` | dependency graph: this module + external modules + closure edges |
| loop | `flowchart LR` | A8 ALIGNMENT LOOP body with B9 GOAL STEWARD gate, A7 cold-reader subgraph, B10 HUMAN CHECKPOINT escape, bounded round counter |
| supervised | `flowchart LR` | A9 SUPERVISED EXECUTION: LLM plan node, S7 tool node (cylinder), S4 verifier tool, B10 checkpoint, retry budget |
| optional | `classDiagram` | only when modeling true type hierarchies (rare for primitive design) |

Keep each diagram under 25 nodes. Larger diagrams indicate the
design is a god-module; split it.

## Conventions

### Component diagram (step 2, flowchart)

- Node label = primitive name; do NOT include file extensions in
  labels (extensions are harness-specific affordances).
- Use a node-shape convention to mark module type:

```
flowchart LR
    P((PERSONA))
    S[SKILL]
    R[/RULE/]
    O{ORCHESTRATOR}
    A[(ASSET)]
```

- Edges = `depends-on` (link) relationships, NOT call sequences.
- Mark new vs existing modules:
  - existing: default style.
  - new: `:::new` class with a single class definition at the end:

```
classDef new stroke-dasharray: 5 5;
class NewModule new;
```

### Sequence diagram (step 3, sequenceDiagram)

- Each `participant` = one thread (orchestrator, parent, child A,
  child B, ...).
- Use `->>` for spawn, `-->>` for fan-in / return.
- Annotate interlocks with a `Note over` block.

```
sequenceDiagram
    participant Parent
    participant ChildA
    participant ChildB
    Parent->>ChildA: spawn (lens A)
    Parent->>ChildB: spawn (lens B)
    ChildA-->>Parent: findings
    ChildB-->>Parent: findings
    Note over Parent: synthesize; single-writer interlock on output
```

### Dependency graph diagram (step 3.5, flowchart LR)

- One node per module in scope plus one node per declared external
  module dependency.
- Edge labels mark composition mode: `INLINE`, `LOCAL SIBLING`,
  `EXTERNAL`.
- Show transitive closure edges only when you can name them
  deterministically; otherwise mark `(closure: ...)` as a comment.
- Do NOT include manifest filenames or CLI commands; this diagram
  is at the substrate layer.

```
flowchart LR
    Self[your design]
    Sib[local sibling primitive]
    Ext[(owner/foo)]
    ExtClosure[(owner/foo's deps...)]
    Self -- INLINE --> Self
    Self -- LOCAL SIBLING --> Sib
    Self -- EXTERNAL --> Ext
    Ext -. transitive .-> ExtClosure
```

### Loop and gate diagrams (A7 / A8 / B9 / B10)

When the design includes A8 ALIGNMENT LOOP, A7 ADVERSARIAL REVIEW,
B9 GOAL STEWARD, or B10 HUMAN CHECKPOINT, render the loop body as
`flowchart LR` (not sequenceDiagram) so the GO/REFINE branch and the
round counter are visible.

Conventions:

- The persisted goal artifact (B4 PLAN MEMENTO) is a cylinder node:
  `G[(GOAL +<br/>criteria)]`. Re-injection edges flow OUT of it
  toward each round body.
- A B9 GOAL STEWARD gate is a labeled rectangle with the persona
  name on line 1 and `B9 GOAL STEWARD` on line 2. Two outgoing
  edges, labeled `GO` and `REFINE`, are mandatory.
- A B10 HUMAN CHECKPOINT is rendered as a node with `B10 HUMAN
  CHECKPOINT` on line 1 and the operator-action label on line 2.
  It MUST be reached from at least one bounded condition (e.g.,
  round-counter exhausted) -- never as a default fallback.
- A7 cold-reader threads sit in their own subgraph titled with the
  pattern name (`A7 ADVERSARIAL REVIEW (COLD READERS, fresh
  context)`); each cold-reader node carries the literal annotation
  `fresh ctx<br/>artifact only` to make the warm-context anti-
  pattern visually impossible to miss.
- The round counter terminates the loop explicitly: a diamond node
  `RC{round < max?}` with `yes` looping back to the round body and
  `no` flowing to the human checkpoint. UNBOUNDED LOOP is ruled
  out by construction.

Worked instances: see the diagrams in
`examples/01-readme-iteration.md` for the canonical
A8 + A1 + A7 + B9 + B10 composition rendered with these
conventions.

### Tradeoff citation in handoff diagrams (step 3.1)

When step 3.1 invoked `pattern-tradeoffs.md`, the handoff diagram
captions a comment node citing the matrix and row, e.g.:

```
%% tradeoff: matrix #5 synthesis style -> CEO-ARBITRATED row
```

Diagrams without a tradeoff citation when alternatives were in
tension fail the lint pass.

## GitHub-render gotchas (drift-known)

- `classDiagram` does NOT support inline `:::cssClass` shorthand on
  relationship lines. Use standalone `class Name:::cssClass` lines
  only. Inline form parses on Mermaid Live but fails on GitHub.
- Avoid Unicode arrows (e.g. fancy dashes); use ASCII `-->`,
  `->>`, `-->>`.
- Quote any node label containing `:` or parentheses.
- Subgraphs with the same label across multiple diagrams in one
  file occasionally collapse on GitHub; use unique subgraph IDs.

## What the diagrams MUST and MUST NOT show

MUST show:
- Every primitive module the design depends on.
- Every spawn / fan-in / interlock.
- Whether each module is new or existing.
- Every CROSSING into deterministic substrate (S7 DETERMINISTIC
  TOOL BRIDGE). Tool-call results crossing back into the LLM's
  next inference step use double-line edges (`==>`); thin single-
  arrow edges (`-->`) stay LLM-internal.

MUST NOT show:
- Specific file paths or extensions (harness-specific).
- Specific spawn-tool names (harness-specific).
- Internal procedure steps inside one module (those belong in
  the module's natural-language body, drafted later).

## Tool-call node convention (A9 / S7 diagrams)

When a diagram crosses into deterministic substrate via a tool
call:

- Render the tool as a cylinder: `T[(TOOL<br/>label)]`. The label
  names the SUBSTRATE category, not the harness syntax: one of
  `CLI`, `script`, `MCP`, `API`. Example:
  `T[(TOOL<br/>S7 bridge<br/>CLI / script / MCP / API)]`.
- Use double-line `==>` for the edge that carries the tool's
  RESULT into the LLM's next inference step. This is the visible
  signal that the LLM is now interpreting deterministic output, not
  generating it.
- Use thin `-->` for LLM-internal control flow (plan -> select
  tool -> emit invocation parameters).
- Mark a B10 HUMAN CHECKPOINT before any irreversible tool call as
  a diamond: `CHK{B10 human<br/>checkpoint}` with an `abort,
  escalate` exit edge.
- The verifier of an A9 SUPERVISED EXECUTION pattern is ITSELF a
  tool node (S4 deterministic), never an LLM node. Diagrams that
  show "LLM verifies" after a tool call are flagging
  VERIFY-WITH-LLM-ONLY; redraw.

Canonical fragment (lift into A9 designs):

```
flowchart LR
  P[LLM: plan] --> CHK{B10 human<br/>checkpoint?}
  CHK -->|approve| T[(TOOL<br/>S7 bridge)]
  T ==> R[(RESULT)]
  R --> V[(TOOL<br/>verifier S4)]
  V ==> OK{pass?}
```

## Output discipline

Each diagram block in the handoff packet sits between fenced
``` ```mermaid ``` ``` markers. The handoff packet is markdown;
diagrams are the load-bearing artifacts.
