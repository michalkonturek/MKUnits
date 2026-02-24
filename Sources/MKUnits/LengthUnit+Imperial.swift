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

    /// Returns nautical mile `[nmi]` length unit.
    public static let nauticalMile = LengthUnit(
        name: "nautical mile",
        symbol: "nmi",
        ratio: Decimal(string: "1853.184")!
    )

    /// Returns mile `[mi]` length unit.
    public static let mile = LengthUnit(
        name: "mile",
        symbol: "mi",
        ratio: Decimal(string: "1609.344")!
    )

    /// Returns furlong `[fur]` length unit.
    public static let furlong = LengthUnit(
        name: "furlong",
        symbol: "fur",
        ratio: Decimal(string: "201.168")!
    )

    /// Returns chain `[ch]` length unit.
    public static let chain = LengthUnit(
        name: "chain",
        symbol: "ch",
        ratio: Decimal(string: "20.1168")!
    )

    /// Returns yard `[yd]` length unit.
    public static let yard = LengthUnit(
        name: "yard",
        symbol: "yd",
        ratio: Decimal(string: "0.9144")!
    )

    /// Returns foot `[ft]` length unit.
    public static let foot = LengthUnit(
        name: "foot",
        symbol: "ft",
        ratio: Decimal(string: "0.3048")!
    )

    /// Returns inch `[in]` length unit.
    public static let inch = LengthUnit(
        name: "inch",
        symbol: "in",
        ratio: Decimal(string: "0.0254")!
    )
}

extension Int {
    /// Returns instance converted as nautical mile quantity.
    public func nauticalMile() -> Quantity {
        Quantity(amount: Decimal(self), unit: LengthUnit.nauticalMile)
    }
    /// Returns instance converted as mile quantity.
    public func mile() -> Quantity {
        Quantity(amount: Decimal(self), unit: LengthUnit.mile)
    }
    /// Returns instance converted as furlong quantity.
    public func furlong() -> Quantity {
        Quantity(amount: Decimal(self), unit: LengthUnit.furlong)
    }
    /// Returns instance converted as chain quantity.
    public func chain() -> Quantity {
        Quantity(amount: Decimal(self), unit: LengthUnit.chain)
    }
    /// Returns instance converted as yard quantity.
    public func yard() -> Quantity {
        Quantity(amount: Decimal(self), unit: LengthUnit.yard)
    }
    /// Returns instance converted as foot quantity.
    public func foot() -> Quantity {
        Quantity(amount: Decimal(self), unit: LengthUnit.foot)
    }
    /// Returns instance converted as inch quantity.
    public func inch() -> Quantity {
        Quantity(amount: Decimal(self), unit: LengthUnit.inch)
    }
}

extension Double {
    /// Returns instance converted as nautical mile quantity.
    public func nauticalMile() -> Quantity {
        Quantity(amount: Decimal(self), unit: LengthUnit.nauticalMile)
    }
    /// Returns instance converted as mile quantity.
    public func mile() -> Quantity {
        Quantity(amount: Decimal(self), unit: LengthUnit.mile)
    }
    /// Returns instance converted as furlong quantity.
    public func furlong() -> Quantity {
        Quantity(amount: Decimal(self), unit: LengthUnit.furlong)
    }
    /// Returns instance converted as chain quantity.
    public func chain() -> Quantity {
        Quantity(amount: Decimal(self), unit: LengthUnit.chain)
    }
    /// Returns instance converted as yard quantity.
    public func yard() -> Quantity {
        Quantity(amount: Decimal(self), unit: LengthUnit.yard)
    }
    /// Returns instance converted as foot quantity.
    public func foot() -> Quantity {
        Quantity(amount: Decimal(self), unit: LengthUnit.foot)
    }
    /// Returns instance converted as inch quantity.
    public func inch() -> Quantity {
        Quantity(amount: Decimal(self), unit: LengthUnit.inch)
    }
}
