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

    /**
     Returns megagram `[Mg]` mass unit.
     
     - author: Michal Konturek
     */
    public static var megagram: MassUnit {
        return MassUnit(
            name: "megagram",
            symbol: "Mg",
            ratio: NSDecimalNumber(mantissa: 1, exponent: 3, isNegative: false)
        )
    }

    /**
     Returns kilogram `[kg]` mass unit.
     
     - important: This is a base unit.
     
     - author: Michal Konturek
     */
    public static var kilogram: MassUnit {
        return MassUnit(
            name: "kilogram",
            symbol: "kg",
            ratio: NSDecimalNumber.one
        )
    }

    /**
     Returns decagram `[dag]` mass unit.
     
     - author: Michal Konturek
     */
    public static var decagram: MassUnit {
        return MassUnit(
            name: "decagram",
            symbol: "dag",
            ratio: NSDecimalNumber(mantissa: 1, exponent: -2, isNegative: false)
        )
    }

    /**
     Returns gram `[g]` mass unit.
     
     - author: Michal Konturek
     */
    public static var gram: MassUnit {
        return MassUnit(
            name: "gram",
            symbol: "g",
            ratio: NSDecimalNumber(mantissa: 1, exponent: -3, isNegative: false)
        )
    }

    /**
     Returns milligram `[mg]` mass unit.
     
     - author: Michal Konturek
     */
    public static var milligram: MassUnit {
        return MassUnit(
            name: "milligram",
            symbol: "mg",
            ratio: NSDecimalNumber(mantissa: 1, exponent: -6, isNegative: false)
        )
    }
}

extension ExpressibleByIntegerLiteral {

    /**
     Returns instance converted as megagram quantity.
     
     - author: Michal Konturek
     */
    public func megagram() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: MassUnit.megagram)
    }

    /**
     Returns instance converted as kilogram quantity.
     
     - author: Michal Konturek
     */
    public func kilogram() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: MassUnit.kilogram)
    }

    /**
     Returns instance converted as decagram quantity.
     
     - author: Michal Konturek
     */
    public func decagram() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: MassUnit.decagram)
    }

    /**
     Returns instance converted as gram quantity.
     
     - author: Michal Konturek
     */
    public func gram() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: MassUnit.gram)
    }

    /**
     Returns instance converted as milligram quantity.
     
     - author: Michal Konturek
     */
    public func milligram() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: MassUnit.milligram)
    }
}
