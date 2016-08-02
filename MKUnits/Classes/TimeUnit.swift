//
//  TimeUnit.swift
//  MKUnits
//
//  Created by Michal Konturek on 31/07/2016.
//
//

import Foundation

public final class TimeUnit: Unit {

    public static var century: TimeUnit {
        return TimeUnit(
            name: "century",
            symbol: "c",
            ratio: NSDecimalNumber(mantissa: 31557600, exponent: 2, isNegative: false)
        )
    }

    public static var decade: TimeUnit {
        return TimeUnit(
            name: "decade",
            symbol: "dec",
            ratio: NSDecimalNumber(mantissa: 31557600, exponent: 1, isNegative: false)
        )
    }

    public static var year: TimeUnit {
        return TimeUnit(
            name: "year",
            symbol: "y",
            ratio: NSDecimalNumber(mantissa: 31557600, exponent: 0, isNegative: false)
        )
    }

    public static var month: TimeUnit {
        return TimeUnit(
            name: "month",
            symbol: "mo",
            ratio: NSDecimalNumber(mantissa: 2592000, exponent: 0, isNegative: false)
        )
    }

    public static var week: TimeUnit {
        return TimeUnit(
            name: "week",
            symbol: "wk",
            ratio: NSDecimalNumber(mantissa: 604800, exponent: 0, isNegative: false)
        )
    }

    public static var day: TimeUnit {
        return TimeUnit(
            name: "day",
            symbol: "d",
            ratio: NSDecimalNumber(mantissa: 86400, exponent: 0, isNegative: false)
        )
    }

    public static var hour: TimeUnit {
        return TimeUnit(
            name: "hour",
            symbol: "h",
            ratio: NSDecimalNumber(mantissa: 3600, exponent: 0, isNegative: false)
        )
    }

    public static var minute: TimeUnit {
        return TimeUnit(
            name: "minute",
            symbol: "m",
            ratio: NSDecimalNumber(mantissa: 60, exponent: 0, isNegative: false)
        )
    }

    public static var second: TimeUnit {
        return TimeUnit(
            name: "second",
            symbol: "s",
            ratio: NSDecimalNumber.one()
        )
    }

    public static var millisecond: TimeUnit {
        return TimeUnit(
            name: "millisecond",
            symbol: "ms",
            ratio: NSDecimalNumber(mantissa: 1, exponent: -3, isNegative: false)
        )
    }

    public static var microsecond: TimeUnit {
        return TimeUnit(
            name: "microsecond",
            symbol: "μs",
            ratio: NSDecimalNumber(mantissa: 1, exponent: -6, isNegative: false)
        )
    }

    public static var nanosecond: TimeUnit {
        return TimeUnit(
            name: "nanosecond",
            symbol: "ns",
            ratio: NSDecimalNumber(mantissa: 1, exponent: -9, isNegative: false)
        )
    }
}

extension NSNumber {

    public func century() -> Quantity {
        return Quantity(amount: self, unit: TimeUnit.century)
    }

    public func decade() -> Quantity {
        return Quantity(amount: self, unit: TimeUnit.decade)
    }

    public func year() -> Quantity {
        return Quantity(amount: self, unit: TimeUnit.year)
    }

    public func month() -> Quantity {
        return Quantity(amount: self, unit: TimeUnit.month)
    }

    public func week() -> Quantity {
        return Quantity(amount: self, unit: TimeUnit.week)
    }

    public func day() -> Quantity {
        return Quantity(amount: self, unit: TimeUnit.day)
    }

    public func hour() -> Quantity {
        return Quantity(amount: self, unit: TimeUnit.hour)
    }

    public func minute() -> Quantity {
        return Quantity(amount: self, unit: TimeUnit.minute)
    }

    public func second() -> Quantity {
        return Quantity(amount: self, unit: TimeUnit.second)
    }

    public func millisecond() -> Quantity {
        return Quantity(amount: self, unit: TimeUnit.millisecond)
    }

    public func microsecond() -> Quantity {
        return Quantity(amount: self, unit: TimeUnit.microsecond)
    }

    public func nanosecond() -> Quantity {
        return Quantity(amount: self, unit: TimeUnit.nanosecond)
    }
}
