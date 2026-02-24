//
//  TimeUnit.swift
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

public final class TimeUnit: Unit, @unchecked Sendable {

    /// Returns century `[c]` time unit.
    public static let century = TimeUnit(
        name: "century",
        symbol: "c",
        ratio: 3_155_760_000
    )

    /// Returns decade `[dec]` time unit.
    public static let decade = TimeUnit(
        name: "decade",
        symbol: "dec",
        ratio: 315_576_000
    )

    /// Returns year `[y]` time unit.
    public static let year = TimeUnit(
        name: "year",
        symbol: "y",
        ratio: 31_557_600
    )

    /// Returns month `[mo]` time unit.
    public static let month = TimeUnit(
        name: "month",
        symbol: "mo",
        ratio: 2_592_000
    )

    /// Returns week `[wk]` time unit.
    public static let week = TimeUnit(
        name: "week",
        symbol: "wk",
        ratio: 604_800
    )

    /// Returns day `[d]` time unit.
    public static let day = TimeUnit(
        name: "day",
        symbol: "d",
        ratio: 86_400
    )

    /// Returns hour `[h]` time unit.
    public static let hour = TimeUnit(
        name: "hour",
        symbol: "h",
        ratio: 3_600
    )

    /// Returns minute `[m]` time unit.
    public static let minute = TimeUnit(
        name: "minute",
        symbol: "m",
        ratio: 60
    )

    /// Returns second `[s]` time unit.
    public static let second = TimeUnit(
        name: "second",
        symbol: "s",
        ratio: 1
    )

    /// Returns millisecond `[ms]` time unit.
    public static let millisecond = TimeUnit(
        name: "millisecond",
        symbol: "ms",
        ratio: Decimal(string: "0.001")!
    )

    /// Returns microsecond `[μs]` time unit.
    public static let microsecond = TimeUnit(
        name: "microsecond",
        symbol: "μs",
        ratio: Decimal(string: "0.000001")!
    )

    /// Returns nanosecond `[ns]` time unit.
    public static let nanosecond = TimeUnit(
        name: "nanosecond",
        symbol: "ns",
        ratio: Decimal(string: "0.000000001")!
    )
}

extension Int {
    /// Returns instance converted as century quantity.
    public func century() -> Quantity {
        Quantity(amount: Decimal(self), unit: TimeUnit.century)
    }
    /// Returns instance converted as decade quantity.
    public func decade() -> Quantity {
        Quantity(amount: Decimal(self), unit: TimeUnit.decade)
    }
    /// Returns instance converted as year quantity.
    public func year() -> Quantity {
        Quantity(amount: Decimal(self), unit: TimeUnit.year)
    }
    /// Returns instance converted as month quantity.
    public func month() -> Quantity {
        Quantity(amount: Decimal(self), unit: TimeUnit.month)
    }
    /// Returns instance converted as week quantity.
    public func week() -> Quantity {
        Quantity(amount: Decimal(self), unit: TimeUnit.week)
    }
    /// Returns instance converted as day quantity.
    public func day() -> Quantity {
        Quantity(amount: Decimal(self), unit: TimeUnit.day)
    }
    /// Returns instance converted as hour quantity.
    public func hour() -> Quantity {
        Quantity(amount: Decimal(self), unit: TimeUnit.hour)
    }
    /// Returns instance converted as minute quantity.
    public func minute() -> Quantity {
        Quantity(amount: Decimal(self), unit: TimeUnit.minute)
    }
    /// Returns instance converted as second quantity.
    public func second() -> Quantity {
        Quantity(amount: Decimal(self), unit: TimeUnit.second)
    }
    /// Returns instance converted as millisecond quantity.
    public func millisecond() -> Quantity {
        Quantity(amount: Decimal(self), unit: TimeUnit.millisecond)
    }
    /// Returns instance converted as microsecond quantity.
    public func microsecond() -> Quantity {
        Quantity(amount: Decimal(self), unit: TimeUnit.microsecond)
    }
    /// Returns instance converted as nanosecond quantity.
    public func nanosecond() -> Quantity {
        Quantity(amount: Decimal(self), unit: TimeUnit.nanosecond)
    }
}

extension Double {
    /// Returns instance converted as century quantity.
    public func century() -> Quantity {
        Quantity(amount: Decimal(self), unit: TimeUnit.century)
    }
    /// Returns instance converted as decade quantity.
    public func decade() -> Quantity {
        Quantity(amount: Decimal(self), unit: TimeUnit.decade)
    }
    /// Returns instance converted as year quantity.
    public func year() -> Quantity {
        Quantity(amount: Decimal(self), unit: TimeUnit.year)
    }
    /// Returns instance converted as month quantity.
    public func month() -> Quantity {
        Quantity(amount: Decimal(self), unit: TimeUnit.month)
    }
    /// Returns instance converted as week quantity.
    public func week() -> Quantity {
        Quantity(amount: Decimal(self), unit: TimeUnit.week)
    }
    /// Returns instance converted as day quantity.
    public func day() -> Quantity {
        Quantity(amount: Decimal(self), unit: TimeUnit.day)
    }
    /// Returns instance converted as hour quantity.
    public func hour() -> Quantity {
        Quantity(amount: Decimal(self), unit: TimeUnit.hour)
    }
    /// Returns instance converted as minute quantity.
    public func minute() -> Quantity {
        Quantity(amount: Decimal(self), unit: TimeUnit.minute)
    }
    /// Returns instance converted as second quantity.
    public func second() -> Quantity {
        Quantity(amount: Decimal(self), unit: TimeUnit.second)
    }
    /// Returns instance converted as millisecond quantity.
    public func millisecond() -> Quantity {
        Quantity(amount: Decimal(self), unit: TimeUnit.millisecond)
    }
    /// Returns instance converted as microsecond quantity.
    public func microsecond() -> Quantity {
        Quantity(amount: Decimal(self), unit: TimeUnit.microsecond)
    }
    /// Returns instance converted as nanosecond quantity.
    public func nanosecond() -> Quantity {
        Quantity(amount: Decimal(self), unit: TimeUnit.nanosecond)
    }
}
