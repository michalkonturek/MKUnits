//
//  LengthUnit+Imperial.swift
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

extension LengthUnit {

    public static var nauticalMile: LengthUnit {
        return LengthUnit(
            name: "nautical mile",
            symbol: "nmi",
            ratio: NSDecimalNumber(mantissa: 1853184, exponent: -3, isNegative: false)
        )
    }

    public static var mile: LengthUnit {
        return LengthUnit(
            name: "mile",
            symbol: "mi",
            ratio: NSDecimalNumber(mantissa: 1609344, exponent: -3, isNegative: false)
        )
    }

    public static var furlong: LengthUnit {
        return LengthUnit(
            name: "furlong",
            symbol: "fur",
            ratio: NSDecimalNumber(mantissa: 201168, exponent: -3, isNegative: false)
        )
    }

    public static var chain: LengthUnit {
        return LengthUnit(
            name: "chain",
            symbol: "ch",
            ratio: NSDecimalNumber(mantissa: 201168, exponent: -4, isNegative: false)
        )
    }

    public static var yard: LengthUnit {
        return LengthUnit(
            name: "yard",
            symbol: "yd",
            ratio: NSDecimalNumber(mantissa: 9144, exponent: -4, isNegative: false)
        )
    }

    public static var foot: LengthUnit {
        return LengthUnit(
            name: "foot",
            symbol: "ft",
            ratio: NSDecimalNumber(mantissa: 3048, exponent: -4, isNegative: false)
        )
    }

    public static var inch: LengthUnit {
        return LengthUnit(
            name: "inch",
            symbol: "in",
            ratio: NSDecimalNumber(mantissa: 254, exponent: -4, isNegative: false)
        )
    }
}

extension NSNumber {

    public func nauticalMile() -> Quantity {
        return Quantity(amount: self, unit: LengthUnit.nauticalMile)
    }

    public func mile() -> Quantity {
        return Quantity(amount: self, unit: LengthUnit.mile)
    }

    public func furlong() -> Quantity {
        return Quantity(amount: self, unit: LengthUnit.furlong)
    }

    public func chain() -> Quantity {
        return Quantity(amount: self, unit: LengthUnit.chain)
    }

    public func yard() -> Quantity {
        return Quantity(amount: self, unit: LengthUnit.yard)
    }

    public func foot() -> Quantity {
        return Quantity(amount: self, unit: LengthUnit.foot)
    }

    public func inch() -> Quantity {
        return Quantity(amount: self, unit: LengthUnit.inch)
    }
}
