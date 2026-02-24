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
            ratio: Decimal(sign: .plus, exponent: -9, significand: 238480942392)
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
            ratio: Decimal(sign: .plus, exponent: -9, significand: 119240471196)
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
            ratio: Decimal(sign: .plus, exponent: -9, significand: 3785411784)
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
            ratio: Decimal(sign: .plus, exponent: -9, significand: 946352946)
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
            ratio: Decimal(sign: .plus, exponent: -9, significand: 473176473)
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
            ratio: Decimal(sign: .plus, exponent: -10, significand: 2365882365)
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
            ratio: Decimal(sign: .plus, exponent: -11, significand: 11829411825)
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
            ratio: Decimal(sign: .plus, exponent: -13, significand: 295735295625)
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
            ratio: Decimal(sign: .plus, exponent: -14, significand: 1478676478125)
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
            ratio: Decimal(sign: .plus, exponent: -14, significand: 492892159375)
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
            ratio: Decimal(sign: .plus, exponent: -16, significand: 36966911953125)
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
            ratio: Decimal(sign: .plus, exponent: -18, significand: 61611519921875)
        )
    }
}

extension Int {
    /**
     Returns instance converted as US hogshead quantity.
     
     - author: Michal Konturek
     */
    public func us_hogshead() -> Quantity {
        return Quantity(amount: Decimal(self), unit: VolumeUnit.us_hogshead)
    }
    /**
     Returns instance converted as US barrel quantity.
     
     - author: Michal Konturek
     */
    public func us_barrel() -> Quantity {
        return Quantity(amount: Decimal(self), unit: VolumeUnit.us_barrel)
    }
    /**
     Returns instance converted as US gallon quantity.
     
     - author: Michal Konturek
     */
    public func us_gallon() -> Quantity {
        return Quantity(amount: Decimal(self), unit: VolumeUnit.us_gallon)
    }
    /**
     Returns instance converted as US quart quantity.
     
     - author: Michal Konturek
     */
    public func us_quart() -> Quantity {
        return Quantity(amount: Decimal(self), unit: VolumeUnit.us_quart)
    }
    /**
     Returns instance converted as US pint quantity.
     
     - author: Michal Konturek
     */
    public func us_pint() -> Quantity {
        return Quantity(amount: Decimal(self), unit: VolumeUnit.us_pint)
    }
    /**
     Returns instance converted as US cup quantity.
     
     - author: Michal Konturek
     */
    public func us_cup() -> Quantity {
        return Quantity(amount: Decimal(self), unit: VolumeUnit.us_cup)
    }
    /**
     Returns instance converted as US gill quantity.
     
     - author: Michal Konturek
     */
    public func us_gill() -> Quantity {
        return Quantity(amount: Decimal(self), unit: VolumeUnit.us_gill)
    }
    /**
     Returns instance converted as US fluidounce quantity.
     
     - author: Michal Konturek
     */
    public func us_fluidounce() -> Quantity {
        return Quantity(amount: Decimal(self), unit: VolumeUnit.us_fluidounce)
    }
    /**
     Returns instance converted as US tablespoon quantity.
     
     - author: Michal Konturek
     */
    public func us_tablespoon() -> Quantity {
        return Quantity(amount: Decimal(self), unit: VolumeUnit.us_tablespoon)
    }
    /**
     Returns instance converted as US teaspoon quantity.
     
     - author: Michal Konturek
     */
    public func us_teaspoon() -> Quantity {
        return Quantity(amount: Decimal(self), unit: VolumeUnit.us_teaspoon)
    }
    /**
     Returns instance converted as US fluidram quantity.
     
     - author: Michal Konturek
     */
    public func us_fluidram() -> Quantity {
        return Quantity(amount: Decimal(self), unit: VolumeUnit.us_fluidram)
    }
    /**
     Returns instance converted as US minim quantity.
     
     - author: Michal Konturek
     */
    public func us_minim() -> Quantity {
        return Quantity(amount: Decimal(self), unit: VolumeUnit.us_minim)
    }
}

extension Double {
    /**
     Returns instance converted as US hogshead quantity.
     
     - author: Michal Konturek
     */
    public func us_hogshead() -> Quantity {
        return Quantity(amount: Decimal(self), unit: VolumeUnit.us_hogshead)
    }
    /**
     Returns instance converted as US barrel quantity.
     
     - author: Michal Konturek
     */
    public func us_barrel() -> Quantity {
        return Quantity(amount: Decimal(self), unit: VolumeUnit.us_barrel)
    }
    /**
     Returns instance converted as US gallon quantity.
     
     - author: Michal Konturek
     */
    public func us_gallon() -> Quantity {
        return Quantity(amount: Decimal(self), unit: VolumeUnit.us_gallon)
    }
    /**
     Returns instance converted as US quart quantity.
     
     - author: Michal Konturek
     */
    public func us_quart() -> Quantity {
        return Quantity(amount: Decimal(self), unit: VolumeUnit.us_quart)
    }
    /**
     Returns instance converted as US pint quantity.
     
     - author: Michal Konturek
     */
    public func us_pint() -> Quantity {
        return Quantity(amount: Decimal(self), unit: VolumeUnit.us_pint)
    }
    /**
     Returns instance converted as US cup quantity.
     
     - author: Michal Konturek
     */
    public func us_cup() -> Quantity {
        return Quantity(amount: Decimal(self), unit: VolumeUnit.us_cup)
    }
    /**
     Returns instance converted as US gill quantity.
     
     - author: Michal Konturek
     */
    public func us_gill() -> Quantity {
        return Quantity(amount: Decimal(self), unit: VolumeUnit.us_gill)
    }
    /**
     Returns instance converted as US fluidounce quantity.
     
     - author: Michal Konturek
     */
    public func us_fluidounce() -> Quantity {
        return Quantity(amount: Decimal(self), unit: VolumeUnit.us_fluidounce)
    }
    /**
     Returns instance converted as US tablespoon quantity.
     
     - author: Michal Konturek
     */
    public func us_tablespoon() -> Quantity {
        return Quantity(amount: Decimal(self), unit: VolumeUnit.us_tablespoon)
    }
    /**
     Returns instance converted as US teaspoon quantity.
     
     - author: Michal Konturek
     */
    public func us_teaspoon() -> Quantity {
        return Quantity(amount: Decimal(self), unit: VolumeUnit.us_teaspoon)
    }
    /**
     Returns instance converted as US fluidram quantity.
     
     - author: Michal Konturek
     */
    public func us_fluidram() -> Quantity {
        return Quantity(amount: Decimal(self), unit: VolumeUnit.us_fluidram)
    }
    /**
     Returns instance converted as US minim quantity.
     
     - author: Michal Konturek
     */
    public func us_minim() -> Quantity {
        return Quantity(amount: Decimal(self), unit: VolumeUnit.us_minim)
    }
}
