## Why

Temperature is one of the most commonly needed unit conversions, but unlike other unit groups in MKUnits, it requires offset-based conversion (not just ratio multiplication). The `Unit` base class already supports this via overridable `convertFromBaseUnit`/`convertToBaseUnit` methods, making it the right time to add this capability.

## What Changes

- Add `TemperatureUnit` as a new `Unit` subclass with offset-based conversion support
- Define standard temperature units: Kelvin (base), Celsius, Fahrenheit, Rankine
- Add fluent API extensions on `Int` and `Double` for all temperature units
- Add comprehensive tests for conversions and fluent API

## Capabilities

### New Capabilities
- `temperature-unit`: Temperature unit group with Kelvin, Celsius, Fahrenheit, and Rankine, supporting offset-based conversions that override the standard ratio-only approach

### Modified Capabilities

_(none)_

## Impact

- New source files: `TemperatureUnit.swift`, `TemperatureUnit+Extensions.swift`
- New test file: `TemperatureUnitTests.swift`
- No changes to existing code — `Unit.convertFromBaseUnit`/`convertToBaseUnit` are already `open` methods
- No breaking changes
