//
//  VolumeUnit+US.swift
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

extension VolumeUnit {

    /**
     Returns US hogshead `[US hhd]` volume unit.
     
     - author: Michal Konturek
     */
    public static var us_hogshead: VolumeUnit {
        return VolumeUnit(
            name: "US hogshead",
            symbol: "US hhd",
            ratio: NSDecimalNumber(mantissa: 238480942392, exponent: -9, isNegative: false)
        )
    }

    /**
     Returns US barrel `[US bbl]` volume unit.
     
     - author: Michal Konturek
     */
    public static var us_barrel: VolumeUnit {
        return VolumeUnit(
            name: "US barrel",
            symbol: "US bbl",
            ratio: NSDecimalNumber(mantissa: 119240471196, exponent: -9, isNegative: false)
        )
    }

    /**
     Returns US gallon `[US gal]` volume unit.
     
     - author: Michal Konturek
     */
    public static var us_gallon: VolumeUnit {
        return VolumeUnit(
            name: "US gallon",
            symbol: "US gal",
            ratio: NSDecimalNumber(mantissa: 3785411784, exponent: -9, isNegative: false)
        )
    }

    /**
     Returns US quart `[US qt]` volume unit.
     
     - author: Michal Konturek
     */
    public static var us_quart: VolumeUnit {
        return VolumeUnit(
            name: "US quart",
            symbol: "US qt",
            ratio: NSDecimalNumber(mantissa: 946352946, exponent: -9, isNegative: false)
        )
    }

    /**
     Returns US pint `[US pt]` volume unit.
     
     - author: Michal Konturek
     */
    public static var us_pint: VolumeUnit {
        return VolumeUnit(
            name: "US pint",
            symbol: "US pt",
            ratio: NSDecimalNumber(mantissa: 473176473, exponent: -9, isNegative: false)
        )
    }

    /**
     Returns US cup `[US cp]` volume unit.
     
     - author: Michal Konturek
     */
    public static var us_cup: VolumeUnit {
        return VolumeUnit(
            name: "US cup",
            symbol: "US cp",
            ratio: NSDecimalNumber(mantissa: 2365882365, exponent: -10, isNegative: false)
        )
    }

    /**
     Returns US gill `[US gi]` volume unit.
     
     - author: Michal Konturek
     */
    public static var us_gill: VolumeUnit {
        return VolumeUnit(
            name: "US gill",
            symbol: "US gi",
            ratio: NSDecimalNumber(mantissa: 11829411825, exponent: -11, isNegative: false)
        )
    }

    /**
     Returns US fluid ounce `[US fl oz]` volume unit.
     
     - author: Michal Konturek
     */
    public static var us_fluidounce: VolumeUnit {
        return VolumeUnit(
            name: "US fluid ounce",
            symbol: "US fl oz",
            ratio: NSDecimalNumber(mantissa: 295735295625, exponent: -13, isNegative: false)
        )
    }

    /**
     Returns US tablespoon `[US tbsp]` volume unit.
     
     - author: Michal Konturek
     */
    public static var us_tablespoon: VolumeUnit {
        return VolumeUnit(
            name: "US tablespoon",
            symbol: "US tbsp",
            ratio: NSDecimalNumber(mantissa: 1478676478125, exponent: -14, isNegative: false)
        )
    }

    /**
     Returns US teaspoon `[US tsp]` volume unit.
     
     - author: Michal Konturek
     */
    public static var us_teaspoon: VolumeUnit {
        return VolumeUnit(
            name: "US teaspoon",
            symbol: "US tsp",
            ratio: NSDecimalNumber(mantissa: 492892159375, exponent: -14, isNegative: false)
        )
    }

    /**
     Returns US fluidram `[US fl dr]` volume unit.
     
     - author: Michal Konturek
     */
    public static var us_fluidram: VolumeUnit {
        return VolumeUnit(
            name: "US fluidram",
            symbol: "US fl dr",
            ratio: NSDecimalNumber(mantissa: 36966911953125, exponent: -16, isNegative: false)
        )
    }

    /**
     Returns US minim `[US min]` volume unit.
     
     - author: Michal Konturek
     */
    public static var us_minim: VolumeUnit {
        return VolumeUnit(
            name: "US minim",
            symbol: "US min",
            ratio: NSDecimalNumber(mantissa: 61611519921875, exponent: -18, isNegative: false)
        )
    }
}

extension ExpressibleByIntegerLiteral {

    /**
     Returns instance converted as US hogshead quantity.
     
     - author: Michal Konturek
     */
    public func us_hogshead() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: VolumeUnit.us_hogshead)
    }

    /**
     Returns instance converted as US barrel quantity.
     
     - author: Michal Konturek
     */
    public func us_barrel() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: VolumeUnit.us_barrel)
    }

    /**
     Returns instance converted as US gallon quantity.
     
     - author: Michal Konturek
     */
    public func us_gallon() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: VolumeUnit.us_gallon)
    }

    /**
     Returns instance converted as US quart quantity.
     
     - author: Michal Konturek
     */
    public func us_quart() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: VolumeUnit.us_quart)
    }

    /**
     Returns instance converted as US pint quantity.
     
     - author: Michal Konturek
     */
    public func us_pint() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: VolumeUnit.us_pint)
    }

    /**
     Returns instance converted as US cup quantity.
     
     - author: Michal Konturek
     */
    public func us_cup() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: VolumeUnit.us_cup)
    }

    /**
     Returns instance converted as US gill quantity.
     
     - author: Michal Konturek
     */
    public func us_gill() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: VolumeUnit.us_gill)
    }

    /**
     Returns instance converted as US fluidounce quantity.
     
     - author: Michal Konturek
     */
    public func us_fluidounce() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: VolumeUnit.us_fluidounce)
    }

    /**
     Returns instance converted as US tablespoon quantity.
     
     - author: Michal Konturek
     */
    public func us_tablespoon() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: VolumeUnit.us_tablespoon)
    }

    /**
     Returns instance converted as US teaspoon quantity.
     
     - author: Michal Konturek
     */
    public func us_teaspoon() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: VolumeUnit.us_teaspoon)
    }

    /**
     Returns instance converted as US fluidram quantity.
     
     - author: Michal Konturek
     */
    public func us_fluidram() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: VolumeUnit.us_fluidram)
    }

    /**
     Returns instance converted as US minim quantity.
     
     - author: Michal Konturek
     */
    public func us_minim() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: VolumeUnit.us_minim)
    }
}
