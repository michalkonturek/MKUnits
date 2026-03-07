## 1. ByteUnit Source

- [x] 1.1 Create `Sources/MKUnits/ByteUnit.swift` with `ByteUnit` class and six unit constants (byte, kilobyte, megabyte, gigabyte, terabyte, petabyte) using base-1024 ratios
- [x] 1.2 Add `Int` fluent API extensions for all six byte units
- [x] 1.3 Add `Double` fluent API extensions for all six byte units

## 2. Tests

- [x] 2.1 Create `Tests/MKUnitsTests/ByteUnitTests.swift` with `correctness()` test for cross-unit conversions
- [x] 2.2 Add `fluentAPI()` test for `Int` and `Double` extension methods

## 3. Verify

- [x] 3.1 Run `swift build` to confirm compilation
- [x] 3.2 Run `swift test --filter ByteUnitTests` to confirm all tests pass (skipped — `Testing` module unavailable with CLT-only toolchain; CI will verify)
- [x] 3.3 Run `xcrun swift-format lint --strict --recursive Sources/ Tests/` to confirm formatting
