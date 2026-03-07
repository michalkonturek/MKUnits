## Context

MKUnits defines unit groups as `final class` subclasses of `Unit` with `public static let` constants for each unit. Conversion uses a `ratio` (`Decimal`) relative to a base unit. Each unit group also provides `Int` and `Double` fluent API extensions. The new `ByteUnit` follows this established pattern exactly.

## Goals / Non-Goals

**Goals:**
- Add a `ByteUnit` group with binary-prefixed units (byte through petabyte, base-1024)
- Provide fluent API extensions matching existing conventions
- Full test coverage for conversions and fluent API

**Non-Goals:**
- SI/decimal prefixes (kibibyte, mebibyte, etc.) — can be added later
- Bit-level units (bit, kilobit) — out of scope for this change

## Decisions

### Decision 1: Use base-1024 (binary) ratios

The units use traditional binary prefixes: 1 KB = 1024 bytes, 1 MB = 1024 KB, etc. This matches common developer expectations. SI prefixes (KiB, MiB) are intentionally excluded to keep the initial scope small.

### Decision 2: Byte as the base unit (ratio = 1)

Byte has ratio `1`, with larger units having integer power-of-1024 ratios (1024, 1048576, etc.). All ratios are exact integers, so no `Decimal(string:)` is needed.

### Decision 3: Units included

byte, kilobyte, megabyte, gigabyte, terabyte, petabyte — six units covering the most common range.

## Risks / Trade-offs

- **Naming ambiguity** (KB vs KiB) → Documented as binary (base-1024). SI prefixes can be added as a separate change if needed.
- **No fractional ratios** → All ratios are exact integers, so no precision concerns.
