---
globs: "**/*.swift"
---

# MKUnits Project Instructions

## Project Overview

MKUnits is a Swift library for precise unit conversion using `Decimal` arithmetic.
It is SPM-first (v6.0.0+) and also supports CocoaPods.

## Architecture

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

### Formatting

- **Formatter**: Apple's `swift-format` (bundled with Xcode toolchain).
- **Configuration**: `.swift-format` at the repo root.
- Format all files: `xcrun swift-format format --recursive --in-place Sources/ Tests/ Package.swift`
- Lint check: `xcrun swift-format lint --strict --recursive Sources/ Tests/ Package.swift`

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

## Adding a New Unit Group

1. Create `Sources/MKUnits/NewUnit.swift`:
   - `public final class NewUnit: Unit, @unchecked Sendable { ... }`
   - Define `static let` constants with ratios relative to the base unit (ratio = 1).
   - Add `Int` and `Double` extensions.
2. Create `Tests/MKUnitsTests/NewUnitTests.swift`:
   - `@Suite struct NewUnitTests { ... }`
   - `@Test func correctness()` — verify cross-unit conversions are equal using `#expect()`.
   - `@Test func fluentAPI()` — verify Int/Double extension methods produce correct `Quantity`.
   - Add a `private func assert(...)` helper for common quantity assertions.

## Adding a Unit to an Existing Group

Add a `public static let` to the existing unit class and corresponding Int/Double extension methods. Add test coverage in the existing test file.

## Testing

- Framework: Swift Testing (`import Testing`)
- Test suites are `@Suite struct` types with `@Test func` methods.
- Assertions use `#expect()` macros (not `XCTAssert*`).
- `TestUnit` and `TestOtherUnit` are defined in `UnitTests.swift` and reused by `QuantityTests.swift`.
- Each unit group has two test functions: `correctness()` for cross-unit conversions and `fluentAPI()` for `Int`/`Double` extension methods.
- Run: `swift test`
- Build: `swift build`

## Cross-Platform Notes

- **Linux metatype comparison**: Use `!=` (not `!==`) when comparing `type(of:)` results — identity operators on metatypes don't compile on Linux.
- **Avoid `NSDecimalNumber` ObjC methods**: `multiplying(by:)` and similar methods return incorrect results on watchOS. Use Swift `Decimal` operators (`*`, `/`, `+`, `-`) which call C functions (`NSDecimalMultiply`, etc.) and are not affected.
- **`NSDecimalRound`**: The only `NSDecimal*` C function still used (in `Quantity.rounded()`). No pure-Swift alternative exists.

## CI

GitHub Actions (`.github/workflows/tests.yml`): runs `swift-format lint --strict` (macOS only), `swift build`, and `swift test` on macOS-15 and ubuntu-latest with Swift 6.0.

## Package Structure

```
Sources/MKUnits/     — library sources
Tests/MKUnitsTests/  — Swift Testing test files
Package.swift        — SPM manifest (iOS 16+, macOS 13+, tvOS 16+, watchOS 9+, visionOS 1+)
MKUnits.podspec      — CocoaPods spec (v6.0.0)
.swift-format        — swift-format configuration
```
