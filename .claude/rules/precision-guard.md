# Precision & Cross-Platform Guard

When writing or reviewing Swift code in this repository, flag the
following issues. Do NOT silently fix them — explain the problem so
the developer understands the constraint.

## Decimal Precision

- **NEVER** use `Decimal` float literals (e.g. `Decimal(0.001)`).
  They route through `Double`, losing precision silently.
  Correct: `Decimal(string: "0.001")!`
  Exception: integer literals are safe (`Decimal(1000)` or just `1_000`).

- **NEVER** use `NSDecimalNumber` ObjC methods (`multiplying(by:)`,
  `dividing(by:)`, `adding(...)`, `subtracting(...)`).
  They return incorrect results on watchOS.
  Correct: use Swift `Decimal` operators (`*`, `/`, `+`, `-`).

## Cross-Platform Safety

- **NEVER** use identity operators (`===` / `!==`) on metatypes
  (e.g. `type(of: a) !== type(of: b)`).
  They do not compile on Linux.
  Correct: use equality operators (`==` / `!=`).

- **ALWAYS** add `@unchecked Sendable` conformance to `Unit` subclasses
  (they are `final class` with only `let` stored properties, making
  them safe to share across concurrency domains).

## Unit Definition Patterns

- Unit constants MUST be `public static let` (not `static var`).
- Fractional ratios MUST use `Decimal(string: "...")!`.
- Integer ratios use integer literals directly (e.g. `ratio: 1_000`).
- Every unit constant needs matching `Int` and `Double` extension methods.
