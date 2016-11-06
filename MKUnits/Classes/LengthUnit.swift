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

public final class LengthUnit: Unit {

    /**
     Returns kilometer `[km]` length unit.
     
     - author: Michal Konturek
     */
    public static var kilometer: LengthUnit {
        return LengthUnit(
            name: "kilometer",
            symbol: "km",
            ratio: NSDecimalNumber(mantissa: 1, exponent: 3, isNegative: false)
        )
    }

    /**
     Returns meter `[m]` length unit.
     
     - important: This is a base unit.
     
     - author: Michal Konturek
     */
    public static var meter: LengthUnit {
        return LengthUnit(
            name: "meter",
            symbol: "m",
            ratio: NSDecimalNumber.one
        )
    }

    /**
     Returns centimeter `[cm]` length unit.
     
     - author: Michal Konturek
     */
    public static var centimeter: LengthUnit {
        return LengthUnit(
            name: "centimeter",
            symbol: "cm",
            ratio: NSDecimalNumber(mantissa: 1, exponent: -2, isNegative: false)
        )
    }

    /**
     Returns millimeter `[mm]` length unit.
     
     - author: Michal Konturek
     */
    public static var millimeter: LengthUnit {
        return LengthUnit(
            name: "millimeter",
            symbol: "mm",
            ratio: NSDecimalNumber(mantissa: 1, exponent: -3, isNegative: false)
        )
    }
}

extension ExpressibleByIntegerLiteral {

    /**
     Returns instance converted as kilometer quantity.
     
     - author: Michal Konturek
     */
    public func kilometer() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: LengthUnit.kilometer)

    }

    /**
     Returns instance converted as meter quantity.
     
     - author: Michal Konturek
     */
    public func meter() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: LengthUnit.meter)

    }

    /**
     Returns instance converted as centimeter quantity.
     
     - author: Michal Konturek
     */
    public func centimeter() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: LengthUnit.centimeter)

    }

    /**
     Returns instance converted as millimeter quantity.
     
     - author: Michal Konturek
     */
    public func millimeter() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: LengthUnit.millimeter)

    }
}
