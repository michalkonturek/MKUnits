## ADDED Requirements

### Requirement: ByteUnit defines digital storage units

The system SHALL provide a `ByteUnit` class (final subclass of `Unit`, `@unchecked Sendable`) with `public static let` constants for: byte, kilobyte, megabyte, gigabyte, terabyte, and petabyte. The byte SHALL be the base unit (ratio 1). Each successive unit SHALL have a ratio of 1024 times the previous unit.

#### Scenario: Unit ratios are correct

- **WHEN** a `ByteUnit` constant is accessed
- **THEN** its ratio SHALL be: byte=1, kilobyte=1024, megabyte=1048576, gigabyte=1073741824, terabyte=1099511627776, petabyte=1125899906842624

#### Scenario: Units have correct symbols

- **WHEN** a `ByteUnit` constant is accessed
- **THEN** its symbol SHALL be: byte="B", kilobyte="KB", megabyte="MB", gigabyte="GB", terabyte="TB", petabyte="PB"

### Requirement: ByteUnit supports cross-unit conversion

Quantities using `ByteUnit` SHALL be convertible to any other `ByteUnit` using the standard `Quantity.converted()` method.

#### Scenario: Convert megabytes to kilobytes

- **WHEN** 1 megabyte is converted to kilobytes
- **THEN** the result SHALL be 1024 kilobytes

#### Scenario: Convert gigabytes to bytes

- **WHEN** 1 gigabyte is converted to bytes
- **THEN** the result SHALL be 1073741824 bytes

#### Scenario: Convert kilobytes to megabytes

- **WHEN** 2048 kilobytes is converted to megabytes
- **THEN** the result SHALL be 2 megabytes

### Requirement: ByteUnit provides Int fluent API

The system SHALL extend `Int` with methods for each byte unit that return a `Quantity` with the corresponding `ByteUnit`.

#### Scenario: Int fluent API creates correct quantities

- **WHEN** `5.megabyte()` is called on an `Int`
- **THEN** the result SHALL be a `Quantity` with amount `5` and unit `ByteUnit.megabyte`

### Requirement: ByteUnit provides Double fluent API

The system SHALL extend `Double` with methods for each byte unit that return a `Quantity` with the corresponding `ByteUnit`.

#### Scenario: Double fluent API creates correct quantities

- **WHEN** `1.5.gigabyte()` is called on a `Double`
- **THEN** the result SHALL be a `Quantity` with amount `1.5` and unit `ByteUnit.gigabyte`
