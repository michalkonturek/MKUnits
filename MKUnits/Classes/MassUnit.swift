//
//  MassUnit.swift
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

public final class MassUnit: Unit {

    public static var megagram: MassUnit {
        return MassUnit(
            name: "megagram",
            symbol: "Mg",
            ratio: NSDecimalNumber(mantissa: 1, exponent: 3, isNegative: false)
        )
    }

    public static var kilogram: MassUnit {
        return MassUnit(
            name: "kilogram",
            symbol: "kg",
            ratio: NSDecimalNumber.one()
        )
    }

    public static var decagram: MassUnit {
        return MassUnit(
            name: "decagram",
            symbol: "dag",
            ratio: NSDecimalNumber(mantissa: 1, exponent: -2, isNegative: false)
        )
    }

    public static var gram: MassUnit {
        return MassUnit(
            name: "gram",
            symbol: "g",
            ratio: NSDecimalNumber(mantissa: 1, exponent: -3, isNegative: false)
        )
    }

    public static var milligram: MassUnit {
        return MassUnit(
            name: "milligram",
            symbol: "mg",
            ratio: NSDecimalNumber(mantissa: 1, exponent: -6, isNegative: false)
        )
    }
}

extension NSNumber {

    public func megagram() -> Quantity {
        return Quantity(amount: self, unit: MassUnit.megagram)
    }

    public func kilogram() -> Quantity {
        return Quantity(amount: self, unit: MassUnit.kilogram)
    }

    public func decagram() -> Quantity {
        return Quantity(amount: self, unit: MassUnit.decagram)
    }

    public func gram() -> Quantity {
        return Quantity(amount: self, unit: MassUnit.gram)
    }

    public func milligram() -> Quantity {
        return Quantity(amount: self, unit: MassUnit.milligram)
    }
}
