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

    /**
     Returns nautical mile `[nmi]` length unit.
     
     - author: Michal Konturek
     */
    public static var nauticalMile: LengthUnit {
        return LengthUnit(
            name: "nautical mile",
            symbol: "nmi",
            ratio: Decimal(sign: .plus, exponent: -3, significand: 1853184)
        )
    }

    /**
     Returns mile `[mi]` length unit.
     
     - author: Michal Konturek
     */
    public static var mile: LengthUnit {
        return LengthUnit(
            name: "mile",
            symbol: "mi",
            ratio: Decimal(sign: .plus, exponent: -3, significand: 1609344)
        )
    }

    /**
     Returns furlong `[fur]` length unit.
     
     - author: Michal Konturek
     */
    public static var furlong: LengthUnit {
        return LengthUnit(
            name: "furlong",
            symbol: "fur",
            ratio: Decimal(sign: .plus, exponent: -3, significand: 201168)
        )
    }

    /**
     Returns chain `[ch]` length unit.
     
     - author: Michal Konturek
     */
    public static var chain: LengthUnit {
        return LengthUnit(
            name: "chain",
            symbol: "ch",
            ratio: Decimal(sign: .plus, exponent: -4, significand: 201168)
        )
    }

    /**
     Returns yard `[yd]` length unit.
     
     - author: Michal Konturek
     */
    public static var yard: LengthUnit {
        return LengthUnit(
            name: "yard",
            symbol: "yd",
            ratio: Decimal(sign: .plus, exponent: -4, significand: 9144)
        )
    }

    /**
     Returns foot `[ft]` length unit.
     
     - author: Michal Konturek
     */
    public static var foot: LengthUnit {
        return LengthUnit(
            name: "foot",
            symbol: "ft",
            ratio: Decimal(sign: .plus, exponent: -4, significand: 3048)
        )
    }

    /**
     Returns inch `[in]` length unit.
     
     - author: Michal Konturek
     */
    public static var inch: LengthUnit {
        return LengthUnit(
            name: "inch",
            symbol: "in",
            ratio: Decimal(sign: .plus, exponent: -4, significand: 254)
        )
    }
}

extension Int {
    /**
     Returns instance converted as nautical mile quantity.
     
     - author: Michal Konturek
     */
    public func nauticalMile() -> Quantity {
        return Quantity(amount: Decimal(self), unit: LengthUnit.nauticalMile)
    }
    /**
     Returns instance converted as mile quantity.
     
     - author: Michal Konturek
     */
    public func mile() -> Quantity {
        return Quantity(amount: Decimal(self), unit: LengthUnit.mile)
    }
    /**
     Returns instance converted as furlong quantity.
     
     - author: Michal Konturek
     */
    public func furlong() -> Quantity {
        return Quantity(amount: Decimal(self), unit: LengthUnit.furlong)
    }
    /**
     Returns instance converted as chain quantity.
     
     - author: Michal Konturek
     */
    public func chain() -> Quantity {
        return Quantity(amount: Decimal(self), unit: LengthUnit.chain)
    }
    /**
     Returns instance converted as yard quantity.
     
     - author: Michal Konturek
     */
    public func yard() -> Quantity {
        return Quantity(amount: Decimal(self), unit: LengthUnit.yard)
    }
    /**
     Returns instance converted as foot quantity.
     
     - author: Michal Konturek
     */
    public func foot() -> Quantity {
        return Quantity(amount: Decimal(self), unit: LengthUnit.foot)
    }
    /**
     Returns instance converted as inch quantity.
     
     - author: Michal Konturek
     */
    public func inch() -> Quantity {
        return Quantity(amount: Decimal(self), unit: LengthUnit.inch)
    }
}

extension Double {
    /**
     Returns instance converted as nautical mile quantity.
     
     - author: Michal Konturek
     */
    public func nauticalMile() -> Quantity {
        return Quantity(amount: Decimal(self), unit: LengthUnit.nauticalMile)
    }
    /**
     Returns instance converted as mile quantity.
     
     - author: Michal Konturek
     */
    public func mile() -> Quantity {
        return Quantity(amount: Decimal(self), unit: LengthUnit.mile)
    }
    /**
     Returns instance converted as furlong quantity.
     
     - author: Michal Konturek
     */
    public func furlong() -> Quantity {
        return Quantity(amount: Decimal(self), unit: LengthUnit.furlong)
    }
    /**
     Returns instance converted as chain quantity.
     
     - author: Michal Konturek
     */
    public func chain() -> Quantity {
        return Quantity(amount: Decimal(self), unit: LengthUnit.chain)
    }
    /**
     Returns instance converted as yard quantity.
     
     - author: Michal Konturek
     */
    public func yard() -> Quantity {
        return Quantity(amount: Decimal(self), unit: LengthUnit.yard)
    }
    /**
     Returns instance converted as foot quantity.
     
     - author: Michal Konturek
     */
    public func foot() -> Quantity {
        return Quantity(amount: Decimal(self), unit: LengthUnit.foot)
    }
    /**
     Returns instance converted as inch quantity.
     
     - author: Michal Konturek
     */
    public func inch() -> Quantity {
        return Quantity(amount: Decimal(self), unit: LengthUnit.inch)
    }
}
