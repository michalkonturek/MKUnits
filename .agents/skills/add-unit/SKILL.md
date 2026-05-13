---
name: add-unit
description: >-
  Use this skill when the user wants to add a new unit constant to an
  existing unit group in MKUnits. Activate for requests mentioning adding
  a specific measurement unit (e.g. "add ounce", "add nautical mile",
  "add hectopascal"), extending a unit class, or when the user provides a
  conversion ratio or factor for a unit not yet in the library. Also
  activate when the user says "add imperial variant" or "add US unit".
  Do NOT activate for creating entirely new unit groups.
---

# add-unit

Add one or more unit constants to an existing MKUnits unit group,
including all required extension methods and test coverage.

## Procedure

### 1. Identify target group

Determine which existing unit group the new unit belongs to. Check
`Sources/MKUnits/` for the matching file:
- Main group: `<Name>Unit.swift`
- Imperial variants: `<Name>Unit+Imperial.swift`
- US variants: `<Name>Unit+US.swift`

If the unit belongs to a variant file (imperial/US) that does not yet
exist, create it following the `+Imperial.swift` / `+US.swift` naming
convention with the same MIT license header.

### 2. Gather requirements

For each unit to add, confirm:
- **Name**: lowercase, no spaces (e.g. `nauticalMile`)
- **Symbol**: standard abbreviation (e.g. `"nmi"`)
- **Ratio**: conversion factor relative to the group's base unit

The ratio means: 1 of this unit = `ratio` of the base unit.
Example: 1 kilometer = 1000 meters, so `ratio: 1_000` (if meter is base).

If the user provides a conversion in the opposite direction (e.g.
"1 mile = 1.609 km"), invert or adjust to express relative to base.

### 3. Add the unit constant

Insert into the appropriate source file, maintaining alphabetical or
logical order consistent with existing units in that file:

```swift
/// Returns <unit_name> `[<symbol>]` <domain> unit.
public static let <name> = <Group>Unit(
  name: "<name>",
  symbol: "<symbol>",
  ratio: <ratio>
)
```

Rules:
- Integer ratios: use integer literals (e.g. `5_280`).
- Fractional ratios: use `Decimal(string: "...")!`. NEVER float literals.
- Doc comment format: `/// Returns <name> \`[<symbol>]\` <domain> unit.`

### 4. Add Int extension method

In the same file's `extension Int` block:

```swift
/// Returns instance converted as <name> quantity.
public func <name>() -> Quantity {
  Quantity(amount: Decimal(self), unit: <Group>Unit.<name>)
}
```

### 5. Add Double extension method

In the same file's `extension Double` block:

```swift
/// Returns instance converted as <name> quantity.
public func <name>() -> Quantity {
  Quantity(amount: Decimal(self), unit: <Group>Unit.<name>)
}
```

### 6. Add test coverage

In the corresponding test file (`Tests/MKUnitsTests/<Group>UnitTests.swift`
or the variant test file):

- Add a conversion assertion in `correctness()`:
  ```swift
  #expect(1.<larger_unit>() == <factor>.<smaller_unit>())
  ```

- Add fluent API assertions in `fluentAPI()`:
  ```swift
  self.assert(1.<name>(), expectedAmount: 1, expectedUnit: <Group>Unit.<name>)
  ```

### 7. Validate

Run in sequence:

1. `xcrun swift-format format --recursive --in-place Sources/ Tests/ Package.swift`
2. `swift build`
3. `swift test`

Common failure modes:
- **Test equality failure**: ratio is inverted. Remember: ratio expresses
  "1 of this unit equals `ratio` base units."
- **Precision mismatch**: used a float literal instead of `Decimal(string:)`.
- **Build error on Linux**: used `!==` instead of `!=` for metatype comparison.

### 8. Summary

Report:
- Which file(s) were modified
- Units added (name, symbol, ratio)
- Test assertions added
- Build + test status
