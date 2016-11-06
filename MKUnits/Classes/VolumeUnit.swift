//
//  VolumeUnit.swift
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

public final class VolumeUnit: Unit {

    /**
     Returns hectolitre `[hl]` volume unit.
     
     - author: Michal Konturek
     */
    public static var hectolitre: VolumeUnit {
        return VolumeUnit(
            name: "hectolitre",
            symbol: "hl",
            ratio: NSDecimalNumber(mantissa: 1, exponent: 2, isNegative: false)
        )
    }

    /**
     Returns litre `[l]` volume unit.
     
     - important: This is a base unit.
     
     - author: Michal Konturek
     */
    public static var litre: VolumeUnit {
        return VolumeUnit(
            name: "litre",
            symbol: "l",
            ratio: NSDecimalNumber.one
        )
    }

    /**
     Returns decilitre `[dl]` volume unit.
     
     - author: Michal Konturek
     */
    public static var decilitre: VolumeUnit {
        return VolumeUnit(
            name: "decilitre",
            symbol: "dl",
            ratio: NSDecimalNumber(mantissa: 1, exponent: -1, isNegative: false)
        )
    }

    /**
     Returns centilitre `[cl]` volume unit.
     
     - author: Michal Konturek
     */
    public static var centilitre: VolumeUnit {
        return VolumeUnit(
            name: "centilitre",
            symbol: "cl",
            ratio: NSDecimalNumber(mantissa: 1, exponent: -2, isNegative: false)
        )
    }

    /**
     Returns millilitre `[ml]` volume unit.
     
     - author: Michal Konturek
     */
    public static var millilitre: VolumeUnit {
        return VolumeUnit(
            name: "millilitre",
            symbol: "ml",
            ratio: NSDecimalNumber(mantissa: 1, exponent: -3, isNegative: false)
        )
    }

    /**
     Returns microlitre `[µl]` volume unit.
     
     - author: Michal Konturek
     */
    public static var microlitre: VolumeUnit {
        return VolumeUnit(
            name: "microlitre",
            symbol: "µl",
            ratio: NSDecimalNumber(mantissa: 1, exponent: -6, isNegative: false)
        )
    }
}

extension ExpressibleByIntegerLiteral {

    /**
     Returns instance converted as hectolitre quantity.
     
     - author: Michal Konturek
     */
    public func hectolitre() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: VolumeUnit.hectolitre)
    }

    /**
     Returns instance converted as litre quantity.
     
     - author: Michal Konturek
     */
    public func litre() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: VolumeUnit.litre)
    }

    /**
     Returns instance converted as decilitre quantity.
     
     - author: Michal Konturek
     */
    public func decilitre() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: VolumeUnit.decilitre)
    }

    /**
     Returns instance converted as centilitre quantity.
     
     - author: Michal Konturek
     */
    public func centilitre() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: VolumeUnit.centilitre)
    }

    /**
     Returns instance converted as millilitre quantity.
     
     - author: Michal Konturek
     */
    public func millilitre() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: VolumeUnit.millilitre)
    }

    /**
     Returns instance converted as microlitre quantity.
     
     - author: Michal Konturek
     */
    public func microlitre() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: VolumeUnit.microlitre)
    }
}
