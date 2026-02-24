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
            ratio: Decimal(sign: .plus, exponent: -2, significand: 258998811)
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
            ratio: Decimal(sign: .plus, exponent: -7, significand: 40468564224)
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
            ratio: Decimal(sign: .plus, exponent: -8, significand: 83612736)
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
            ratio: Decimal(sign: .plus, exponent: -8, significand: 9290304)
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
            ratio: Decimal(sign: .plus, exponent: -8, significand: 64516)
        )
    }
}

extension Int {
    /**
     Returns instance converted as square mile quantity.
     
     - author: Michal Konturek
     */
    public func squareMile() -> Quantity {
        return Quantity(amount: Decimal(self), unit: AreaUnit.squareMile)
    }
    /**
     Returns instance converted as acre quantity.
     
     - author: Michal Konturek
     */
    public func acre() -> Quantity {
        return Quantity(amount: Decimal(self), unit: AreaUnit.acre)
    }
    /**
     Returns instance converted as square yard quantity.
     
     - author: Michal Konturek
     */
    public func squareYard() -> Quantity {
        return Quantity(amount: Decimal(self), unit: AreaUnit.squareYard)
    }
    /**
     Returns instance converted as square foot quantity.
     
     - author: Michal Konturek
     */
    public func squareFoot() -> Quantity {
        return Quantity(amount: Decimal(self), unit: AreaUnit.squareFoot)
    }
    /**
     Returns instance converted as square inch quantity.
     
     - author: Michal Konturek
     */
    public func squareInch() -> Quantity {
        return Quantity(amount: Decimal(self), unit: AreaUnit.squareInch)
    }
}

extension Double {
    /**
     Returns instance converted as square mile quantity.
     
     - author: Michal Konturek
     */
    public func squareMile() -> Quantity {
        return Quantity(amount: Decimal(self), unit: AreaUnit.squareMile)
    }
    /**
     Returns instance converted as acre quantity.
     
     - author: Michal Konturek
     */
    public func acre() -> Quantity {
        return Quantity(amount: Decimal(self), unit: AreaUnit.acre)
    }
    /**
     Returns instance converted as square yard quantity.
     
     - author: Michal Konturek
     */
    public func squareYard() -> Quantity {
        return Quantity(amount: Decimal(self), unit: AreaUnit.squareYard)
    }
    /**
     Returns instance converted as square foot quantity.
     
     - author: Michal Konturek
     */
    public func squareFoot() -> Quantity {
        return Quantity(amount: Decimal(self), unit: AreaUnit.squareFoot)
    }
    /**
     Returns instance converted as square inch quantity.
     
     - author: Michal Konturek
     */
    public func squareInch() -> Quantity {
        return Quantity(amount: Decimal(self), unit: AreaUnit.squareInch)
    }
}
