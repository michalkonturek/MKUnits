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

    /// Returns square mile `[mi²]` area unit.
    public static let squareMile = AreaUnit(
        name: "square",
        symbol: "mi²",
        ratio: Decimal(string: "2589988.11")!
    )

    /// Returns acre `[ac]` area unit.
    public static let acre = AreaUnit(
        name: "acre",
        symbol: "ac",
        ratio: Decimal(string: "4046.8564224")!
    )

    /// Returns square yard `[yd²]` area unit.
    public static let squareYard = AreaUnit(
        name: "square yard",
        symbol: "yd²",
        ratio: Decimal(string: "0.83612736")!
    )

    /// Returns square foot `[ft²]` area unit.
    public static let squareFoot = AreaUnit(
        name: "square foot",
        symbol: "ft²",
        ratio: Decimal(string: "0.09290304")!
    )

    /// Returns square inch `[in²]` area unit.
    public static let squareInch = AreaUnit(
        name: "square inch",
        symbol: "in²",
        ratio: Decimal(string: "0.00064516")!
    )
}

extension Int {
    /// Returns instance converted as square mile quantity.
    public func squareMile() -> Quantity {
        Quantity(amount: Decimal(self), unit: AreaUnit.squareMile)
    }
    /// Returns instance converted as acre quantity.
    public func acre() -> Quantity {
        Quantity(amount: Decimal(self), unit: AreaUnit.acre)
    }
    /// Returns instance converted as square yard quantity.
    public func squareYard() -> Quantity {
        Quantity(amount: Decimal(self), unit: AreaUnit.squareYard)
    }
    /// Returns instance converted as square foot quantity.
    public func squareFoot() -> Quantity {
        Quantity(amount: Decimal(self), unit: AreaUnit.squareFoot)
    }
    /// Returns instance converted as square inch quantity.
    public func squareInch() -> Quantity {
        Quantity(amount: Decimal(self), unit: AreaUnit.squareInch)
    }
}

extension Double {
    /// Returns instance converted as square mile quantity.
    public func squareMile() -> Quantity {
        Quantity(amount: Decimal(self), unit: AreaUnit.squareMile)
    }
    /// Returns instance converted as acre quantity.
    public func acre() -> Quantity {
        Quantity(amount: Decimal(self), unit: AreaUnit.acre)
    }
    /// Returns instance converted as square yard quantity.
    public func squareYard() -> Quantity {
        Quantity(amount: Decimal(self), unit: AreaUnit.squareYard)
    }
    /// Returns instance converted as square foot quantity.
    public func squareFoot() -> Quantity {
        Quantity(amount: Decimal(self), unit: AreaUnit.squareFoot)
    }
    /// Returns instance converted as square inch quantity.
    public func squareInch() -> Quantity {
        Quantity(amount: Decimal(self), unit: AreaUnit.squareInch)
    }
}
