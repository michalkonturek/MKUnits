//
//  AreaUnit+Imperial.swift
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

extension AreaUnit {

    /**
     Returns square mile `[mi²]` area unit.
     
     - author: Michal Konturek
     */
    public static var squareMile: AreaUnit {
        return AreaUnit(
            name: "square",
            symbol: "mi²",
            ratio: NSDecimalNumber(mantissa: 258998811, exponent: -2, isNegative: false)
        )
    }

    /**
     Returns acre `[ac]` area unit.
     
     - author: Michal Konturek
     */
    public static var acre: AreaUnit {
        return AreaUnit(
            name: "acre",
            symbol: "ac",
            ratio: NSDecimalNumber(mantissa: 40468564224, exponent: -7, isNegative: false)
        )
    }

    /**
     Returns square yard `[yd²]` area unit.
     
     - author: Michal Konturek
     */
    public static var squareYard: AreaUnit {
        return AreaUnit(
            name: "square yard",
            symbol: "yd²",
            ratio: NSDecimalNumber(mantissa: 83612736, exponent: -8, isNegative: false)
        )
    }

    /**
     Returns square foot `[ft²]` area unit.
     
     - author: Michal Konturek
     */
    public static var squareFoot: AreaUnit {
        return AreaUnit(
            name: "square foot",
            symbol: "ft²",
            ratio: NSDecimalNumber(mantissa: 9290304, exponent: -8, isNegative: false)
        )
    }

    /**
     Returns square inch `[in²]` area unit.
     
     - author: Michal Konturek
     */
    public static var squareInch: AreaUnit {
        return AreaUnit(
            name: "square inch",
            symbol: "in²",
            ratio: NSDecimalNumber(mantissa: 64516, exponent: -8, isNegative: false)
        )
    }
}

extension ExpressibleByIntegerLiteral {

    /**
     Returns instance converted as square mile quantity.
     
     - author: Michal Konturek
     */
    public func squareMile() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: AreaUnit.squareMile)
    }

    /**
     Returns instance converted as acre quantity.
     
     - author: Michal Konturek
     */
    public func acre() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: AreaUnit.acre)
    }

    /**
     Returns instance converted as square yard quantity.
     
     - author: Michal Konturek
     */
    public func squareYard() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: AreaUnit.squareYard)
    }

    /**
     Returns instance converted as square foot quantity.
     
     - author: Michal Konturek
     */
    public func squareFoot() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: AreaUnit.squareFoot)
    }

    /**
     Returns instance converted as square inch quantity.
     
     - author: Michal Konturek
     */
    public func squareInch() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: AreaUnit.squareInch)
    }
}
