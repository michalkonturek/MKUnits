# Per-Trigger-Surface Adapter: GitHub Agentic Workflows (gh-aw)

Maps the substrate (`../common.md`) to GitHub Agentic Workflows'
concrete affordances. Load this file ONLY when a primitive declares
gh-aw as its trigger-surface target.

This adapter covers ONLY substrate primitive #5 (TRIGGER
ORCHESTRATOR) and the optional sandboxing / capability_gating /
audit_surface fields. The other five substrate primitives are
unaffected by trigger-surface choice; they are realized by
whichever inference harness (per-harness adapter) the workflow
dispatches.

Official docs cited (load-bearing for this adapter):
- https://github.github.com/gh-aw/
  -> entry point; project overview
- https://github.github.com/gh-aw/introduction/architecture/
  -> three-layer trust model (substrate / configuration / plan);
     defines the SANDBOXING + CAPABILITY_GATING + AUDIT_SURFACE
     guarantees this adapter maps to substrate primitive #5
- https://github.github.com/gh-aw/reference/frontmatter-full/
  -> CANONICAL spec for every field this adapter mentions; do NOT
     redocument here, cite this page when emitting workflow markdown
- https://github.github.com/gh-aw/reference/dependencies/
  -> APM-as-dependencies story; the bridge between this trigger-
     surface adapter and the existing `module-system-adapters/apm.md`
- https://microsoft.github.io/apm/integrations/gh-aw/
  -> APM-side view of the same integration; cite when designing
     the dependency graph for an A10 module on gh-aw

## Vendor cost (state up-front)

gh-aw is a GitHub-vendor realization. Adopting it requires:
- the repository is hosted on GitHub
- GitHub Actions is enabled for the repository
- the `gh aw` CLI extension is installed locally to compile the
  natural-language workflow markdown into Actions YAML
- the inference harness chosen for the agent step (Claude Code or
  Codex today) is itself reachable from the runner

Adopting gh-aw locks the TRIGGER SURFACE to GitHub. The inference
harness stays portable (Claude Code OR Codex inside Actions).
A primitive that needs A10 GOVERNED OUTER LOOP on a non-GitHub
trigger surface (GitLab CI, Buildkite, Jenkins, internal scheduler)
keeps the architectural shape but pays a higher correctness tax:
SANDBOXING, CAPABILITY_GATING, and AUDIT_SURFACE must be wired by
hand instead of inherited from the substrate. Declare the trigger-
surface target explicitly so this cost is visible in the primitive's
header (per `../portability-rules.md`).

## 5. TRIGGER ORCHESTRATOR

In gh-aw: a markdown file in `.github/workflows/<name>.md` with
YAML frontmatter declaring trigger, permissions, engine, tools,
imports, and (when the agent must externalize state) `safe-outputs:`.
Compiled to a GitHub Actions YAML workflow by `gh aw compile`.

The frontmatter is the architectural surface. Treat the full
frontmatter reference (cited above) as the spec; the field-by-field
mapping below names ONLY the fields a genesis design must reason
about.

Substrate field mapping:

- TRIGGER DECLARATION
  In gh-aw frontmatter: `on:` with the standard GitHub Actions
  trigger vocabulary (`push`, `pull_request`, `issue_comment`,
  `schedule`, `workflow_dispatch`, etc.) PLUS gh-aw extensions:
  `slash_command:` (e.g. `/triage` in a comment) and
  `label_command:` (a label add fires the workflow; the label is
  removed at start so it can re-fire). Slash and label commands
  are first-class A10 triggers and should be preferred when the
  user's intent is "I want to invoke this on demand from a
  GitHub UI surface".

- SESSION BOOTSTRAP
  The workflow markdown file IS a SUBSTRATE-INVOKED MODULE
  ENTRYPOINT (see `primitives.md` MODULE ENTRYPOINT, BINDING
  MODES). The trigger orchestrator instantiates the session and
  loads this file as the session root; the body is the initial
  task description; lazy `assets/` siblings are reachable as in
  any entrypoint.
  - `engine:` selects the inference harness (`copilot`, `claude`,
    `codex`). This is the per-trigger-surface adapter's HANDLE
    into the per-harness adapter axis: the substrate's
    orthogonality rule (see `../common.md`) is enforced
    structurally by gh-aw making `engine:` an explicit field.
  - `imports:` declares dependencies (see APM section below; this
    is how a genesis-architected MODULE ENTRYPOINT, PERSONA
    SCOPING FILE, or SCOPE-ATTACHED RULE FILE rides into the
    workflow).
  - `tools:` declares which tool affordances the session may use
    (preloaded `edit`, `web-fetch`, MCP server attachments).
  - `permissions:` declares the GitHub-token scope granted (often
    `contents: read` and nothing else; tighter is better).

- OUTPUT CHANNEL
  Two distinct surfaces:
  1. The Actions run log (always; auditable).
  2. SafeOutputs externalizers under `safe-outputs:`
     (e.g. `create-pull-request:`, `add-issue-comment:`,
     `create-issue:`, `add-labels:`). Each externalizer is a
     deterministic post-stage. The agent emits a buffered intent;
     the externalizer applies it under declared filters.

- SANDBOXING
  Yes -- substrate-enforced. The Actions runner VM hosts three
  privileged containers (network firewall, API proxy, MCP gateway)
  that mediate the agent container's connectivity. MCP servers run
  in isolated containers spawned by the gateway. Hardware/kernel
  isolation is inherited from the runner. Tighten further with the
  `network:` frontmatter field (allowlist of egress destinations).
  When the design requires zero outbound network at runtime, use
  pre-built APM bundles (see APM section) and a deny-all `network:`
  policy.

- CAPABILITY_GATING
  Yes -- substrate-enforced via `safe-outputs:`. The agent never
  holds a write token to GitHub. It emits intent; SafeOutputs
  applies declared filters (max-N constraints, sanitization,
  schema checks) and only then performs the write through a
  separate trusted stage. This is the canonical STRONG FORM of
  A9 SUPERVISED EXECUTION (see `../../architectural-patterns.md`).

- AUDIT_SURFACE
  Yes -- substrate-enforced. Three contributors:
  1. Actions logs (durable, indexable, viewable by anyone with
     repo read access).
  2. The compiled `.lock.yml` workflow (committed to source
     control; a reviewer can diff what the natural-language
     workflow compiled to). The frontmatter `inlined-imports:
     true` option strengthens this: every imported markdown is
     inlined into the lock file so the audit covers the COMPLETE
     content the agent saw.
  3. The optional `tracker-id:` frontmatter field stamps a stable
     identifier into every asset the workflow creates (issue, PR,
     comment, discussion); enables an auditor to retrieve every
     externalization a given workflow ever produced.
  When AUDIT_SURFACE is the load-bearing reason for choosing A10,
  populate `tracker-id` and prefer `inlined-imports: true`.

## Module distribution: APM as the native dependency mechanism

gh-aw's `imports: - uses: shared/apm.md with: packages: [...]`
gives APM packages first-class status as workflow dependencies.
For genesis this is structurally important: it closes the loop
between the per-trigger-surface adapter (this file) and the
existing module-system adapter (`../../module-system-adapters/
apm.md`).

The composition rule:

- A genesis-architected MODULE ENTRYPOINT (skill), PERSONA
  SCOPING FILE (custom agent), or SCOPE-ATTACHED RULE FILE
  (instruction) intended to run inside an A10 GOVERNED OUTER
  LOOP on gh-aw is distributed as an APM package and consumed
  via `imports: - uses: shared/apm.md`.
- The dependency graph the architect declares in the design's
  handoff packet (per `../../composition-substrate.md`) maps
  directly to the `packages:` list under that import.
- APM's lockfile (`apm.lock`) contributes to AUDIT_SURFACE: every
  package is pinned to an exact commit SHA; lockfile diffs are
  PR-reviewable. Cite this when the design's audit need extends
  to "the agent context the workflow loaded was reviewed before
  merge".
- The APM compilation target is auto-inferred from `engine:`
  (`copilot` -> Copilot target, `claude` -> Claude target,
  others -> `all`). Architects do not configure target manually.
- Cascading token fallback for package fetch:
  `GH_AW_PLUGINS_TOKEN` -> `GH_AW_GITHUB_TOKEN` -> `GITHUB_TOKEN`.
  When designing for cross-org consumption (e.g. importing a
  package from a private repo), surface this in the operator
  setup notes.

For air-gapped or zero-network designs, APM bundles (`apm pack`)
ship the resolved dependency tree as a workflow artifact;
combine with a deny-all `network:` policy.

The architect's canonical phrasing in a handoff packet for an
A10 module on gh-aw is:

  "This module is distributed as an APM package
   (see `module-system-adapters/apm.md`) and consumed by the
   gh-aw workflow via `imports: - uses: shared/apm.md`
   (see `runtime-affordances/per-trigger-surface/gh-aw.md`).
   `engine:` set to <copilot|claude|codex> selects the
   inference harness per its per-harness adapter."

This is the canonical example of cross-axis composition:
trigger-surface, module-distribution, and inference-harness as
three orthogonal axes whose adapters compose without leaking
into each other's vocabulary.

## What gh-aw does NOT do (and the per-harness adapter still does)

- gh-aw does NOT redefine PERSONA SCOPING, MODULE ENTRYPOINT,
  SCOPE-ATTACHED RULE FILE, CHILD-THREAD SPAWN, or PLAN PERSISTENCE.
  Those substrate primitives are realized by whichever inference
  harness the workflow's `engine:` field selects, per its
  per-harness adapter (`../per-harness/<harness>.md`).

- gh-aw does NOT isolate against the agent itself going off-task.
  Sandbox + capability_gating bound EFFECTS, not REASONING. Pair
  with weak-form A9 (skill-prose validation) inside the agent
  body when the OUTPUT shape itself requires bounding.

## Capabilities unique to gh-aw (beyond substrate)

- Layered trust model (substrate / configuration / plan trust). See
  the architecture page for the threat model and the failure
  semantics of each layer.
- The natural-language-to-YAML compilation step itself; the YAML
  is auditable in source control alongside the markdown source.

## When NOT to use gh-aw

- Single-user inner-loop work that never leaves the laptop.
  (No trigger surface needed. Use the inference harness directly.)
- Outer-loop work whose externalization target is not GitHub-
  reachable AND where the user is willing to accept ambient agent
  capability. (A6 EVENT-DRIVEN suffices; the strong-form
  guarantees of A10 are not needed.)
- Outer-loop work whose trigger source is non-GitHub. Pattern A10
  still names the right shape; the realization will require manual
  wiring of sandboxing / capability_gating / audit_surface in the
  chosen CI vendor.
