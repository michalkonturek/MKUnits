## Why

MKUnits covers physical quantities (mass, length, area, time, volume, energy) but lacks support for digital storage units. Bytes, kilobytes, megabytes, etc. are among the most commonly converted units in software development contexts.

## What Changes

- Add a new `ByteUnit` unit group with binary-prefixed units (byte, kilobyte, megabyte, gigabyte, terabyte, petabyte) using base-1024 ratios
- Add `Int` and `Double` fluent API extensions for all byte units
- Add unit tests for correctness and fluent API

## Capabilities

### New Capabilities
- `byte-unit`: Digital storage unit group with base-1024 conversions and fluent API extensions

### Modified Capabilities
<!-- None — this is a purely additive change -->

## Impact

- New source file: `Sources/MKUnits/ByteUnit.swift`
- New test file: `Tests/MKUnitsTests/ByteUnitTests.swift`
- No changes to existing code or APIs
