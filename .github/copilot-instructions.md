# Copilot Instructions for MKUnits

## Project Overview

MKUnits is a Swift library for precise unit conversion using `Decimal` arithmetic.
It is SPM-first (v6.0.0+) and also supports CocoaPods.

## Architecture

- **`Unit`** — open base class (`@unchecked Sendable`) with `name`, `symbol`, and `ratio` (`name` and `symbol` are `String`, `ratio` is `Decimal`). Conversion multiplies/divides by `ratio` relative to a designated base unit.
- **Unit groups** — `final class` subclasses of `Unit` (e.g. `MassUnit`, `LengthUnit`, `AreaUnit`, `TimeUnit`, `VolumeUnit`, `EnergyUnit`). Each must conform to `@unchecked Sendable`.
- **`Quantity`** — value type (`struct`, `Sendable`) holding an `amount` and a `Unit`. Supports arithmetic (`+`, `-`, `*`), comparison, conversion, and rounding.
- **Type safety** — units are only convertible within the same `Unit` subclass (checked via `type(of:)` comparison at runtime).

## Code Conventions

### Unit Definitions

- Use `public static let` (stored, lazy-initialized) for unit constants — not `static var` computed properties.
- Use integer literals for whole-number ratios, `Decimal(string: "...")!` for fractional ratios. Never use `Decimal` float literals (they lose precision through `Double`).

```swift
public static let kilogram = MassUnit(name: "kilogram", symbol: "kg", ratio: 1)
public static let gram = MassUnit(name: "gram", symbol: "g", ratio: Decimal(string: "0.001")!)
```

### Fluent API Extensions

Every unit group provides `Int` and `Double` extensions for a fluent API:

```swift
extension Int {
    public func kilogram() -> Quantity {
        Quantity(amount: Decimal(self), unit: MassUnit.kilogram)
    }
}
```

### Style

- Use `///` doc comments (not `/** */`).
- Prefer implicit `return` for single-expression bodies.
- Omit `self.` unless required for disambiguation (e.g. inside `init` or closures).
- Every source file includes the MIT license header.

## Adding a New Unit Group

1. Create `Sources/MKUnits/NewUnit.swift`:
   - `public final class NewUnit: Unit, @unchecked Sendable { ... }`
   - Define `static let` constants with ratios relative to the base unit (ratio = 1).
   - Add `Int` and `Double` extensions.
2. Create `Tests/MKUnitsTests/NewUnitTests.swift`:
   - `test_correctness()` — verify cross-unit conversions are equal.
   - `test_extension()` — verify Int/Double extension methods produce correct `Quantity`.

## Adding a Unit to an Existing Group

Add a `public static let` to the existing unit class and corresponding Int/Double extension methods. Add test coverage in the existing test file.

## Testing

- Framework: XCTest
- 52 tests across 13 files (correctness + extension tests per unit group, plus `UnitTests` and `QuantityTests`).
- `TestUnit` and `TestOtherUnit` are defined in `UnitTests.swift` and reused by `QuantityTests`.
- Run: `swift test`
- Build: `swift build`

## Cross-Platform Considerations

- **Linux metatype comparison**: Use `!=` (not `!==`) when comparing `type(of:)` results. Identity operators on metatypes don't compile on Linux.
- **Avoid `NSDecimalNumber` ObjC methods**: `multiplying(by:)` and similar methods return incorrect results on watchOS. Use Swift `Decimal` operators (`*`, `/`, `+`, `-`) which call C functions (`NSDecimalMultiply`, etc.) and are not affected.
- **`NSDecimalRound`**: The only `NSDecimal*` C function still used (in `Quantity.rounded()`). No pure-Swift alternative exists.

## CI

GitHub Actions (`.github/workflows/tests.yml`): runs `swift build` and `swift test` on macOS-15 and ubuntu-latest with Swift 6.0.

## Package Structure

```
Sources/MKUnits/     — library sources
Tests/MKUnitsTests/  — XCTest test files
Package.swift        — SPM manifest (iOS 16+, macOS 13+, tvOS 16+, watchOS 9+, visionOS 1+)
MKUnits.podspec      — CocoaPods spec (v6.0.0)
```
