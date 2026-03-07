# Change Log

## [4.2.0](https://github.com/michalkonturek/MKUnits/tree/4.2.0) (2026-03-07)
[Full Changelog](https://github.com/michalkonturek/MKUnits/compare/4.1.0...4.2.0)

- Added `ByteUnit` for digital storage conversions (byte, KB, MB, GB, TB, PB)
- Added `TemperatureUnit` with offset-based conversion (Kelvin, Celsius, Fahrenheit, Rankine)
- Added `demo` executable target (`swift run demo`) showcasing all unit groups
- Added CLAUDE.md for Claude Code guidance
- Added OpenSpec configuration and AI assistant skills

## [4.1.0](https://github.com/michalkonturek/MKUnits/tree/4.1.0) (2026-02-24)
[Full Changelog](https://github.com/michalkonturek/MKUnits/compare/4.0.0...4.1.0)

- Upgraded from Swift 3.0 to Swift 6.0
- Restructured as SPM-first project (standard `Sources/` and `Tests/` layout)
- Replaced `NSDecimalNumber`/`NSNumber` with Swift's native `Decimal` type throughout
- Replaced `ExpressibleByIntegerLiteral` extensions with `Int` and `Double` extensions
- Added multi-platform support: iOS 16+, macOS 13+, tvOS 16+, watchOS 9+, visionOS 1+
- Added `Sendable` conformance to `Unit` and `Quantity`
- Added GitHub Actions CI (macOS + Ubuntu, swift-format lint, build, test)
- Migrated unit tests from XCTest to Swift Testing
- Added swift-format with 2-space indentation
- Removed Xcode project, CocoaPods workspace, and Travis CI configuration

## [4.0.0](https://github.com/michalkonturek/MKUnits/tree/4.0.0) (2016-11-06)
[Full Changelog](https://github.com/michalkonturek/MKUnits/compare/3.1.0...4.0.0)

**Merged pull requests:**

- Transition to Swift 3.0 [\#13](https://github.com/michalkonturek/MKUnits/pull/13) ([michalkonturek](https://github.com/michalkonturek))

## [3.1.0](https://github.com/michalkonturek/MKUnits/tree/3.1.0) (2016-08-14)
[Full Changelog](https://github.com/michalkonturek/MKUnits/compare/3.0.0...3.1.0)

## [3.0.0](https://github.com/michalkonturek/MKUnits/tree/3.0.0) (2016-08-04)
[Full Changelog](https://github.com/michalkonturek/MKUnits/compare/2.2.1...3.0.0)

**Merged pull requests:**

- Swift implementation [\#11](https://github.com/michalkonturek/MKUnits/pull/11) ([michalkonturek](https://github.com/michalkonturek))

## [2.2.1](https://github.com/michalkonturek/MKUnits/tree/2.2.1) (2015-05-25)
[Full Changelog](https://github.com/michalkonturek/MKUnits/compare/2.2.0...2.2.1)

**Closed issues:**

- Swift code example [\#8](https://github.com/michalkonturek/MKUnits/issues/8)
- Using MKUnits for OS X with CocoaPods [\#7](https://github.com/michalkonturek/MKUnits/issues/7)
- Update dependency on MKFoundationKit to 1.3.x [\#6](https://github.com/michalkonturek/MKUnits/issues/6)

## [2.2.0](https://github.com/michalkonturek/MKUnits/tree/2.2.0) (2015-01-28)
[Full Changelog](https://github.com/michalkonturek/MKUnits/compare/2.1.0...2.2.0)

**Merged pull requests:**

- Added Energy unit \(+tests, example\). [\#5](https://github.com/michalkonturek/MKUnits/pull/5) ([natalia-osa](https://github.com/natalia-osa))

## [2.1.0](https://github.com/michalkonturek/MKUnits/tree/2.1.0) (2014-06-05)
[Full Changelog](https://github.com/michalkonturek/MKUnits/compare/2.0.0...2.1.0)

**Merged pull requests:**

- Added Volume Unit [\#4](https://github.com/michalkonturek/MKUnits/pull/4) ([rozmichelle](https://github.com/rozmichelle))

## [2.0.0](https://github.com/michalkonturek/MKUnits/tree/2.0.0) (2014-05-25)
[Full Changelog](https://github.com/michalkonturek/MKUnits/compare/1.2.1...2.0.0)

**Closed issues:**

- REQUEST: Serialization and string conversion \(examples\) [\#3](https://github.com/michalkonturek/MKUnits/issues/3)

## [1.2.1](https://github.com/michalkonturek/MKUnits/tree/1.2.1) (2014-04-05)
[Full Changelog](https://github.com/michalkonturek/MKUnits/compare/1.2.0...1.2.1)

**Closed issues:**

- Proposal: Add NSNumber category. [\#2](https://github.com/michalkonturek/MKUnits/issues/2)

## [1.2.0](https://github.com/michalkonturek/MKUnits/tree/1.2.0) (2014-02-08)
[Full Changelog](https://github.com/michalkonturek/MKUnits/compare/1.1.2...1.2.0)

**Closed issues:**

- Is it possible to decrease minimum iOS version from 6.1 to 6.0? [\#1](https://github.com/michalkonturek/MKUnits/issues/1)

## [1.1.2](https://github.com/michalkonturek/MKUnits/tree/1.1.2) (2013-10-31)
[Full Changelog](https://github.com/michalkonturek/MKUnits/compare/1.1.1...1.1.2)

## [1.1.1](https://github.com/michalkonturek/MKUnits/tree/1.1.1) (2013-10-19)
[Full Changelog](https://github.com/michalkonturek/MKUnits/compare/1.1.0...1.1.1)

## [1.1.0](https://github.com/michalkonturek/MKUnits/tree/1.1.0) (2013-07-02)
[Full Changelog](https://github.com/michalkonturek/MKUnits/compare/1.0.2...1.1.0)

## [1.0.2](https://github.com/michalkonturek/MKUnits/tree/1.0.2) (2013-07-01)
[Full Changelog](https://github.com/michalkonturek/MKUnits/compare/1.0.1...1.0.2)

## [1.0.1](https://github.com/michalkonturek/MKUnits/tree/1.0.1) (2013-07-01)
[Full Changelog](https://github.com/michalkonturek/MKUnits/compare/1.0.0...1.0.1)

## [1.0.0](https://github.com/michalkonturek/MKUnits/tree/1.0.0) (2013-06-30)
[Full Changelog](https://github.com/michalkonturek/MKUnits/compare/0.9.0...1.0.0)

## [0.9.0](https://github.com/michalkonturek/MKUnits/tree/0.9.0) (2013-06-30)


\* *This Change Log was automatically generated by [github_changelog_generator](https://github.com/skywinder/Github-Changelog-Generator)*