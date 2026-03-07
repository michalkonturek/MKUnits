## ADDED Requirements

### Requirement: TemperatureUnit class with offset-based conversion
The system SHALL provide a `TemperatureUnit` class that is a `final class` subclass of `Unit` with an additional `offset` parameter. Conversion to base unit SHALL use the formula `amount * ratio + offset`. Conversion from base unit SHALL use `(amount - offset) / ratio`. The class SHALL conform to `@unchecked Sendable`.

#### Scenario: Convert Celsius to Kelvin
- **WHEN** converting 100 Celsius to Kelvin
- **THEN** the result SHALL be 373.15

#### Scenario: Convert Kelvin to Celsius
- **WHEN** converting 273.15 Kelvin to Celsius
- **THEN** the result SHALL be 0

#### Scenario: Convert Fahrenheit to Celsius
- **WHEN** converting 212 Fahrenheit to Celsius
- **THEN** the result SHALL be 100

#### Scenario: Convert Celsius to Fahrenheit
- **WHEN** converting 0 Celsius to Fahrenheit
- **THEN** the result SHALL be 32

#### Scenario: Convert Rankine to Kelvin
- **WHEN** converting 491.67 Rankine to Kelvin
- **THEN** the result SHALL be 273.15

#### Scenario: Convert absolute zero across scales
- **WHEN** converting 0 Kelvin to Celsius
- **THEN** the result SHALL be -273.15
- **WHEN** converting 0 Kelvin to Fahrenheit
- **THEN** the result SHALL be -459.67
- **WHEN** converting 0 Kelvin to Rankine
- **THEN** the result SHALL be 0

### Requirement: Standard temperature unit constants
The system SHALL provide the following `public static let` unit constants on `TemperatureUnit`:

- `kelvin` — symbol "K", base unit (ratio: 1, offset: 0)
- `celsius` — symbol "°C" (ratio: 1, offset: 273.15)
- `fahrenheit` — symbol "°F" (ratio: 5/9, offset: 459.67 * 5/9)
- `rankine` — symbol "°R" (ratio: 5/9, offset: 0)

#### Scenario: Unit properties are correct
- **WHEN** inspecting `TemperatureUnit.kelvin`
- **THEN** name SHALL be "kelvin", symbol SHALL be "K"
- **WHEN** inspecting `TemperatureUnit.celsius`
- **THEN** name SHALL be "celsius", symbol SHALL be "°C"
- **WHEN** inspecting `TemperatureUnit.fahrenheit`
- **THEN** name SHALL be "fahrenheit", symbol SHALL be "°F"
- **WHEN** inspecting `TemperatureUnit.rankine`
- **THEN** name SHALL be "rankine", symbol SHALL be "°R"

### Requirement: Temperature units are mutually convertible
Temperature units SHALL be convertible with other temperature units via `Quantity.converted(to:)`. Temperature units SHALL NOT be convertible with units from other groups (e.g., MassUnit).

#### Scenario: Convert quantity between temperature units
- **WHEN** creating `100.celsius()` and converting to Fahrenheit
- **THEN** the result SHALL be a Quantity with amount 212 and unit `TemperatureUnit.fahrenheit`

#### Scenario: Incompatible unit conversion
- **WHEN** attempting to convert a temperature quantity to a mass unit
- **THEN** the system SHALL trigger an assertion failure (consistent with existing behavior)

### Requirement: Fluent API extensions on Int and Double
The system SHALL provide fluent API methods on `Int` and `Double` for each temperature unit: `kelvin()`, `celsius()`, `fahrenheit()`, `rankine()`. Each SHALL return a `Quantity` with the corresponding `TemperatureUnit`.

#### Scenario: Int fluent API
- **WHEN** calling `100.celsius()`
- **THEN** the result SHALL be `Quantity(amount: 100, unit: TemperatureUnit.celsius)`

#### Scenario: Double fluent API
- **WHEN** calling `98.6.fahrenheit()`
- **THEN** the result SHALL be `Quantity(amount: Decimal(98.6), unit: TemperatureUnit.fahrenheit)`
