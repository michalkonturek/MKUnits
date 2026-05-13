---
name: add-unit-group
description: >-
  Use this skill when the user wants to add a new unit group (a new
  measurement domain) to MKUnits. Activate for requests mentioning new
  unit types, new measurement categories, or when the user names a
  physical quantity not already covered (e.g. speed, pressure, force,
  frequency). Also activate when the user says "scaffold", "create
  unit file", or mentions adding both source and test files for a new
  unit family. Do NOT activate for adding units to an existing group.
---

# add-unit-group

Scaffold a complete new unit group for MKUnits following all project
conventions.

## Procedure

### 1. Gather requirements

Ask for (if not provided):
- Group name (e.g. "Pressure", "Speed", "Force")
- Units to include (name, symbol, ratio relative to base)
- Which unit is the base unit (ratio = 1)

If the user provides a physical domain but no specific units, research
standard units for that domain and propose them before scaffolding.

### 2. Validate inputs

- Confirm no existing unit group covers this domain (check
  `Sources/MKUnits/` for existing files).
- Verify ratios are internally consistent (e.g. if kilo = 1000x base
  and milli = 0.001x base, then kilo = 1,000,000x milli).
- Flag any ratio that would require offset-based conversion (like
  temperature) — those need a custom `convertToBaseUnit`/
  `convertFromBaseUnit` override and cannot use the simple ratio model.

### 3. Scaffold the source file

Create `Sources/MKUnits/<Name>Unit.swift` using the template:

```swift
//
//  <Name>Unit.swift
//  MKUnits
//
//  Copyright (c) 2016 Michal Konturek <michal.konturek@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

public final class <Name>Unit: Unit, @unchecked Sendable {

  /// Returns <base_name> `[<base_symbol>]` <domain> unit.
  ///
  /// This is a base unit.
  public static let <base_name> = <Name>Unit(
    name: "<base_name>",
    symbol: "<base_symbol>",
    ratio: 1
  )

  /// Returns <unit_name> `[<unit_symbol>]` <domain> unit.
  public static let <unit_name> = <Name>Unit(
    name: "<unit_name>",
    symbol: "<unit_symbol>",
    ratio: <ratio>  // Use Decimal(string: "...")! for fractional values
  )
}

extension Int {
  /// Returns instance converted as <unit_name> quantity.
  public func <unit_name>() -> Quantity {
    Quantity(amount: Decimal(self), unit: <Name>Unit.<unit_name>)
  }
}

extension Double {
  /// Returns instance converted as <unit_name> quantity.
  public func <unit_name>() -> Quantity {
    Quantity(amount: Decimal(self), unit: <Name>Unit.<unit_name>)
  }
}
```

Rules for the template:
- Integer ratios use integer literals (e.g. `1_000`).
- Fractional ratios use `Decimal(string: "...")!`.
- One `Int` + one `Double` extension method per unit constant.
- Doc comments use `///` with the pattern: "Returns <name> `[<symbol>]` <domain> unit."

### 4. Scaffold the test file

Create `Tests/MKUnitsTests/<Name>UnitTests.swift` using the template:

```swift
//
//  <Name>UnitTests.swift
//  MKUnits
//
//  Copyright (c) 2016 Michal Konturek <michal.konturek@gmail.com>
//
//  [... MIT license header ...]
//

import Foundation
import MKUnits
import Testing

@Suite struct <Name>UnitTests {

  @Test func correctness() {
    // Verify conversions between units are equal
    // Pattern: 1.<larger>() == <factor>.<smaller>()
    #expect(1.<larger_unit>() == <factor>.<smaller_unit>())
  }

  @Test func fluentAPI() {
    self.assert(1.<unit_name>(), expectedAmount: 1, expectedUnit: <Name>Unit.<unit_name>)
    self.assert(1.5.<unit_name>(), expectedAmount: 1.5, expectedUnit: <Name>Unit.<unit_name>)
  }

  private func assert(_ item: Quantity, expectedAmount: Decimal, expectedUnit: MKUnits.Unit) {
    #expect(item.amount == expectedAmount)
    #expect(item.unit == expectedUnit)
  }
}
```

### 5. Validate

Run these commands in sequence; fix any failures before proceeding:

1. `xcrun swift-format format --recursive --in-place Sources/ Tests/ Package.swift`
2. `swift build`
3. `swift test`

If tests fail, check ratio calculations. A common mistake is inverting
the ratio direction (ratios express "how many base units equal one of
this unit", not the inverse).

### 6. Summary

Report what was created:
- Source file path
- Test file path
- Number of units added
- Base unit designation
