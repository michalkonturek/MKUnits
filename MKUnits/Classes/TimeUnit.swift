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

public final class TimeUnit: Unit {

    /**
     Returns century `[c]` time unit.
     
     - author: Michal Konturek
     */
    public static var century: TimeUnit {
        return TimeUnit(
            name: "century",
            symbol: "c",
            ratio: NSDecimalNumber(mantissa: 31557600, exponent: 2, isNegative: false)
        )
    }

    /**
     Returns decade `[dec]` time unit.
     
     - author: Michal Konturek
     */
    public static var decade: TimeUnit {
        return TimeUnit(
            name: "decade",
            symbol: "dec",
            ratio: NSDecimalNumber(mantissa: 31557600, exponent: 1, isNegative: false)
        )
    }

    /**
     Returns year `[y]` time unit.
     
     - author: Michal Konturek
     */
    public static var year: TimeUnit {
        return TimeUnit(
            name: "year",
            symbol: "y",
            ratio: NSDecimalNumber(mantissa: 31557600, exponent: 0, isNegative: false)
        )
    }

    /**
     Returns month `[mo]` time unit.
     
     - author: Michal Konturek
     */
    public static var month: TimeUnit {
        return TimeUnit(
            name: "month",
            symbol: "mo",
            ratio: NSDecimalNumber(mantissa: 2592000, exponent: 0, isNegative: false)
        )
    }

    /**
     Returns week `[wk]` time unit.
     
     - author: Michal Konturek
     */
    public static var week: TimeUnit {
        return TimeUnit(
            name: "week",
            symbol: "wk",
            ratio: NSDecimalNumber(mantissa: 604800, exponent: 0, isNegative: false)
        )
    }

    /**
     Returns day `[d]` time unit.
     
     - author: Michal Konturek
     */
    public static var day: TimeUnit {
        return TimeUnit(
            name: "day",
            symbol: "d",
            ratio: NSDecimalNumber(mantissa: 86400, exponent: 0, isNegative: false)
        )
    }

    /**
     Returns hour `[h]` time unit.
     
     - author: Michal Konturek
     */
    public static var hour: TimeUnit {
        return TimeUnit(
            name: "hour",
            symbol: "h",
            ratio: NSDecimalNumber(mantissa: 3600, exponent: 0, isNegative: false)
        )
    }

    /**
     Returns minute `[m]` time unit.
     
     - author: Michal Konturek
     */
    public static var minute: TimeUnit {
        return TimeUnit(
            name: "minute",
            symbol: "m",
            ratio: NSDecimalNumber(mantissa: 60, exponent: 0, isNegative: false)
        )
    }

    /**
     Returns second `[s]` time unit.
     
     - author: Michal Konturek
     */
    public static var second: TimeUnit {
        return TimeUnit(
            name: "second",
            symbol: "s",
            ratio: NSDecimalNumber.one
        )
    }

    /**
     Returns millisecond `[ms]` time unit.
     
     - author: Michal Konturek
     */
    public static var millisecond: TimeUnit {
        return TimeUnit(
            name: "millisecond",
            symbol: "ms",
            ratio: NSDecimalNumber(mantissa: 1, exponent: -3, isNegative: false)
        )
    }

    /**
     Returns microsecond `[μs]` time unit.
     
     - author: Michal Konturek
     */
    public static var microsecond: TimeUnit {
        return TimeUnit(
            name: "microsecond",
            symbol: "μs",
            ratio: NSDecimalNumber(mantissa: 1, exponent: -6, isNegative: false)
        )
    }

    /**
     Returns nanosecond `[ns]` time unit.
     
     - author: Michal Konturek
     */
    public static var nanosecond: TimeUnit {
        return TimeUnit(
            name: "nanosecond",
            symbol: "ns",
            ratio: NSDecimalNumber(mantissa: 1, exponent: -9, isNegative: false)
        )
    }
}

extension ExpressibleByIntegerLiteral {

    /**
     Returns instance converted as century quantity.
     
     - author: Michal Konturek
     */
    public func century() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: TimeUnit.century)
    }

    /**
     Returns instance converted as decade quantity.
     
     - author: Michal Konturek
     */
    public func decade() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: TimeUnit.decade)
    }

    /**
     Returns instance converted as year quantity.
     
     - author: Michal Konturek
     */
    public func year() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: TimeUnit.year)
    }

    /**
     Returns instance converted as month quantity.
     
     - author: Michal Konturek
     */
    public func month() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: TimeUnit.month)
    }

    /**
     Returns instance converted as week quantity.
     
     - author: Michal Konturek
     */
    public func week() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: TimeUnit.week)
    }

    /**
     Returns instance converted as day quantity.
     
     - author: Michal Konturek
     */
    public func day() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: TimeUnit.day)
    }

    /**
     Returns instance converted as hour quantity.
     
     - author: Michal Konturek
     */
    public func hour() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: TimeUnit.hour)
    }

    /**
     Returns instance converted as minute quantity.
     
     - author: Michal Konturek
     */
    public func minute() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: TimeUnit.minute)
    }

    /**
     Returns instance converted as second quantity.
     
     - author: Michal Konturek
     */
    public func second() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: TimeUnit.second)
    }

    /**
     Returns instance converted as millisecond quantity.
     
     - author: Michal Konturek
     */
    public func millisecond() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: TimeUnit.millisecond)
    }

    /**
     Returns instance converted as microsecond quantity.
     
     - author: Michal Konturek
     */
    public func microsecond() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: TimeUnit.microsecond)
    }

    /**
     Returns instance converted as nanosecond quantity.
     
     - author: Michal Konturek
     */
    public func nanosecond() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: TimeUnit.nanosecond)
    }
}
