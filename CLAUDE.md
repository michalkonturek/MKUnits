# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
swift build
swift test
swift test --filter TestName   # run a single test

# Formatting (run before committing)
xcrun swift-format format --recursive --in-place Sources/ Tests/ Package.swift

# Lint check (enforced by CI)
xcrun swift-format lint --strict --recursive Sources/ Tests/ Package.swift
```

## Architecture

MKUnits is a Swift library for precise unit conversion using `Decimal` arithmetic.

- **`Unit`** (`Unit.swift`) — open base class (`@unchecked Sendable`) with `name`, `symbol`, and `ratio` (`Decimal`). Conversion works by multiplying/dividing by `ratio` relative to a designated base unit. Type safety is enforced at runtime via `type(of:)` comparison — units are only convertible within the same `Unit` subclass.
- **Unit groups** — `final class` subclasses of `Unit` (e.g. `MassUnit`, `LengthUnit`, `AreaUnit`, `TimeUnit`, `VolumeUnit`, `EnergyUnit`). Imperial and US variants live in separate files (e.g. `MassUnit+Imperial.swift`).
- **`Quantity`** (`Quantity.swift`) — `struct` (`Sendable`) holding an `amount: Decimal` and a `unit: Unit`. Supports `+`, `-`, `*`, comparison, `.converted()`, and `.rounded()`. Arithmetic converts the RHS to the LHS unit before operating. Incompatible unit operations trigger `assert` failures.

## Code Conventions

### Unit Definitions

Use `public static let` (not `var`) for unit constants. Use integer literals for whole-number ratios and `Decimal(string: "...")!` for fractional ratios — never `Decimal(floatLiteral:)` (loses precision through `Double`):

```swift
public static let kilogram = MassUnit(name: "kilogram", symbol: "kg", ratio: 1)
public static let gram = MassUnit(name: "gram", symbol: "g", ratio: Decimal(string: "0.001")!)
```

### Fluent API Extensions

Every unit group provides `Int` and `Double` extensions:

```swift
extension Int {
  public func kilogram() -> Quantity {
    Quantity(amount: Decimal(self), unit: MassUnit.kilogram)
  }
}
```

### Style

- 2-space indentation (enforced by `.swift-format`)
- `///` doc comments; implicit `return` for single-expression bodies; omit `self.` unless required
- Every source file includes the MIT license header
- No trailing whitespace; single trailing newline

## Testing

Uses Swift Testing (`import Testing`). Test suites are `@Suite struct` types with `@Test func` methods. Assertions use `#expect()`, not `XCTAssert*`.

`TestUnit` and `TestOtherUnit` are defined in `UnitTests.swift` and reused by `QuantityTests.swift`.

Each unit group has two test functions: `correctness()` for cross-unit conversions and `fluentAPI()` for `Int`/`Double` extension methods.

## Cross-Platform Notes

- Use `!=` (not `!==`) when comparing `type(of:)` results — identity operators on metatypes don't compile on Linux.
- Use Swift `Decimal` operators (`*`, `/`, `+`, `-`) directly — avoid `NSDecimalNumber` ObjC methods like `multiplying(by:)` which return incorrect results on watchOS.
- `NSDecimalRound` (used in `Quantity.rounded()`) is the only `NSDecimal*` C function still used; no pure-Swift alternative exists.

## CI

GitHub Actions runs on macOS-15 and ubuntu-latest with Swift 6.0: `swift-format lint --strict` (macOS only), `swift build`, and `swift test`.
