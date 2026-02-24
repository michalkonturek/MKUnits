//
//  LengthUnit.swift
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

public final class LengthUnit: Unit, @unchecked Sendable {

    /// Returns kilometer `[km]` length unit.
    public static let kilometer = LengthUnit(
        name: "kilometer",
        symbol: "km",
        ratio: 1_000
    )

    /// Returns meter `[m]` length unit.
    ///
    /// This is a base unit.
    public static let meter = LengthUnit(
        name: "meter",
        symbol: "m",
        ratio: 1
    )

    /// Returns centimeter `[cm]` length unit.
    public static let centimeter = LengthUnit(
        name: "centimeter",
        symbol: "cm",
        ratio: Decimal(string: "0.01")!
    )

    /// Returns millimeter `[mm]` length unit.
    public static let millimeter = LengthUnit(
        name: "millimeter",
        symbol: "mm",
        ratio: Decimal(string: "0.001")!
    )
}

extension Int {
    /// Returns instance converted as kilometer quantity.
    public func kilometer() -> Quantity {
        Quantity(amount: Decimal(self), unit: LengthUnit.kilometer)
    }
    /// Returns instance converted as meter quantity.
    public func meter() -> Quantity {
        Quantity(amount: Decimal(self), unit: LengthUnit.meter)
    }
    /// Returns instance converted as centimeter quantity.
    public func centimeter() -> Quantity {
        Quantity(amount: Decimal(self), unit: LengthUnit.centimeter)
    }
    /// Returns instance converted as millimeter quantity.
    public func millimeter() -> Quantity {
        Quantity(amount: Decimal(self), unit: LengthUnit.millimeter)
    }
}

extension Double {
    /// Returns instance converted as kilometer quantity.
    public func kilometer() -> Quantity {
        Quantity(amount: Decimal(self), unit: LengthUnit.kilometer)
    }
    /// Returns instance converted as meter quantity.
    public func meter() -> Quantity {
        Quantity(amount: Decimal(self), unit: LengthUnit.meter)
    }
    /// Returns instance converted as centimeter quantity.
    public func centimeter() -> Quantity {
        Quantity(amount: Decimal(self), unit: LengthUnit.centimeter)
    }
    /// Returns instance converted as millimeter quantity.
    public func millimeter() -> Quantity {
        Quantity(amount: Decimal(self), unit: LengthUnit.millimeter)
    }
}
