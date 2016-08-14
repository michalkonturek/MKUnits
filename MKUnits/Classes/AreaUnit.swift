//
//  AreaUnit.swift
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

public final class AreaUnit: Unit {

    /**
     Returns square kilomoter `[km²]` area unit.
     
     - author: Michal Konturek
     */
    public static var squareKilometer: AreaUnit {
        return AreaUnit(
            name: "square",
            symbol: "km²",
            ratio: NSDecimalNumber(mantissa: 1, exponent: 6, isNegative: false)
        )
    }

    /**
     Returns hectare `[ha]` area unit.
     
     - author: Michal Konturek
     */
    public static var hectare: AreaUnit {
        return AreaUnit(
            name: "hectare",
            symbol: "ha",
            ratio: NSDecimalNumber(mantissa: 1, exponent: 4, isNegative: false)
        )
    }

    /**
     Returns are `[a]` area unit.
     
     - author: Michal Konturek
     */
    public static var are: AreaUnit {
        return AreaUnit(
            name: "are",
            symbol: "a",
            ratio: NSDecimalNumber(mantissa: 1, exponent: 2, isNegative: false)
        )
    }

    /**
     Returns square meter `[m²]` area unit.
     
     - author: Michal Konturek
     */
    public static var squareMeter: AreaUnit {
        return AreaUnit(
            name: "square meter",
            symbol: "m²",
            ratio: NSDecimalNumber.one()
        )
    }

    /**
     Returns square decimeter `[dm²]` area unit.
     
     - author: Michal Konturek
     */
    public static var squareDecimeter: AreaUnit {
        return AreaUnit(
            name: "square decimeter",
            symbol: "dm²",
            ratio: NSDecimalNumber(mantissa: 1, exponent: -2, isNegative: false)
        )
    }

    /**
     Returns square centimeter `[cm²]` area unit.
     
     - author: Michal Konturek
     */
    public static var squareCentimeter: AreaUnit {
        return AreaUnit(
            name: "square centimeter",
            symbol: "cm²",
            ratio: NSDecimalNumber(mantissa: 1, exponent: -4, isNegative: false)
        )
    }

    /**
     Returns square millimeter `[mm²]` area unit.
     
     - author: Michal Konturek
     */
    public static var squareMillimeter: AreaUnit {
        return AreaUnit(
            name: "square millimeter",
            symbol: "mm²",
            ratio: NSDecimalNumber(mantissa: 1, exponent: -6, isNegative: false)
        )
    }
}

extension NSNumber {

    /**
     Converts instance into square kilometer quantity.
    
     - author: Michal Konturek
     */
    public func squareKilometer() -> Quantity {
        return Quantity(amount: self, unit: AreaUnit.squareKilometer)
    }

    /**
     Converts instance into hectare quantity.
     
     - author: Michal Konturek
     */
    public func hectare() -> Quantity {
        return Quantity(amount: self, unit: AreaUnit.hectare)
    }

    /**
     Converts instance into are quantity.
     
     - author: Michal Konturek
     */
    public func are() -> Quantity {
        return Quantity(amount: self, unit: AreaUnit.are)
    }

    /**
     Converts instance into square meter quantity.
     
     - author: Michal Konturek
     */
    public func squareMeter() -> Quantity {
        return Quantity(amount: self, unit: AreaUnit.squareMeter)
    }

    /**
     Converts instance into square decimeter quantity.
     
     - author: Michal Konturek
     */
    public func squareDecimeter() -> Quantity {
        return Quantity(amount: self, unit: AreaUnit.squareDecimeter)
    }

    /**
     Converts instance into square centimeter quantity.
     
     - author: Michal Konturek
     */
    public func squareCentimeter() -> Quantity {
        return Quantity(amount: self, unit: AreaUnit.squareCentimeter)
    }

    /**
     Converts instance into square millimeter quantity.
     
     - author: Michal Konturek
     */
    public func squareMillimeter() -> Quantity {
        return Quantity(amount: self, unit: AreaUnit.squareMillimeter)
    }
}
