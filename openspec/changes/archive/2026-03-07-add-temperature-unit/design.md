## Context

MKUnits uses ratio-based conversion where each unit has a `ratio` to a base unit. Conversion is `amount * ratio` (to base) and `amount / ratio` (from base). This works for all existing unit groups (mass, length, area, time, volume, energy, byte) because they are proportional.

Temperature is different: Celsius and Fahrenheit require an offset in addition to scaling. For example, `C = K - 273.15` and `F = K * 9/5 - 459.67`. The `Unit` base class already declares `convertFromBaseUnit` and `convertToBaseUnit` as `open` methods, allowing subclasses to override the default ratio-based logic.

## Goals / Non-Goals

**Goals:**
- Add `TemperatureUnit` supporting Kelvin (base), Celsius, Fahrenheit, and Rankine
- Use the existing `open` override mechanism — no changes to `Unit` base class
- Follow all existing conventions (file structure, naming, fluent API, testing patterns)

**Non-Goals:**
- Modifying the `Unit` base class or `Quantity` struct
- Adding compound unit support (e.g., degrees per second)
- Supporting custom temperature scales

## Decisions

### 1. Override `convertFromBaseUnit`/`convertToBaseUnit` instead of adding an offset property

**Choice:** Each `TemperatureUnit` instance stores its own `offset: Decimal` and overrides the two conversion methods.

**Rationale:** Adding an `offset` property to the `Unit` base class would affect all unit groups for a feature only temperature needs. Overriding is the intended extension point — it's why those methods are `open`. This keeps changes isolated to new files only.

**Alternative considered:** Adding `offset` to `Unit.init` with a default of `0`. Rejected because it would change the public API of the base class unnecessarily.

### 2. Kelvin as base unit

**Choice:** Kelvin is the base unit (ratio: 1, offset: 0).

**Rationale:** Kelvin is the SI base unit for temperature. All other temperature scales can be defined relative to Kelvin with a ratio and offset: `value_in_kelvin = amount * ratio + offset`.

### 3. Store offset separately from ratio

**Choice:** `TemperatureUnit` adds a private `offset: Decimal` property alongside the inherited `ratio`.

**Rationale:** The conversion formula is `K = amount * ratio + offset` (to base) and `amount = (K - offset) / ratio` (from base). This cleanly separates scaling from shifting.

- Kelvin: ratio=1, offset=0 → `K = amount`
- Celsius: ratio=1, offset=273.15 → `K = C + 273.15`
- Fahrenheit: ratio=5/9, offset=Decimal(string: "2298.35")!/9 → derived from `K = (F + 459.67) * 5/9`
- Rankine: ratio=5/9, offset=0 → `K = R * 5/9`

### 4. File organization

Two source files following the existing pattern:
- `TemperatureUnit.swift` — class definition with unit constants
- `TemperatureUnit+Extensions.swift` — `Int` and `Double` fluent API extensions

One test file:
- `TemperatureUnitTests.swift` — conversions and fluent API tests

## Risks / Trade-offs

- **[Precision]** Fahrenheit conversion involves `5/9` and `459.67`, which could accumulate rounding. → Mitigation: Use `Decimal(string:)` for all non-integer values, and test conversions against known reference values with appropriate precision.
- **[Class not final]** `TemperatureUnit` cannot be `final` since it overrides `open` methods from a non-final base. → Mitigation: This is actually fine — `TemperatureUnit` CAN be `final` because it only overrides `open` methods. All other unit groups are `final class` and we follow the same pattern.
