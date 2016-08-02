//
//  VolumeUnit+Imperial.swift
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

    public static var gallon: VolumeUnit {
        return VolumeUnit(
            name: "gallon",
            symbol: "gal",
            ratio: NSDecimalNumber(mantissa: 454609, exponent: -5, isNegative: false)
        )
    }

    public static var quart: VolumeUnit {
        return VolumeUnit(
            name: "quart",
            symbol: "qt",
            ratio: NSDecimalNumber(mantissa: 11365225, exponent: -7, isNegative: false)
        )
    }

    public static var pint: VolumeUnit {
        return VolumeUnit(
            name: "pint",
            symbol: "pt",
            ratio: NSDecimalNumber(mantissa: 56826125, exponent: -8, isNegative: false)
        )
    }

    public static var cup: VolumeUnit {
        return VolumeUnit(
            name: "cup",
            symbol: "cp",
            ratio: NSDecimalNumber(mantissa: 28413, exponent: -5, isNegative: false)
        )
    }

    public static var fluidounce: VolumeUnit {
        return VolumeUnit(
            name: "fluid ounce",
            symbol: "fl oz",
            ratio: NSDecimalNumber(mantissa: 284130625, exponent: -10, isNegative: false)
        )
    }

    public static var tablespoon: VolumeUnit {
        return VolumeUnit(
            name: "tablespoon",
            symbol: "tbsp",
            ratio: NSDecimalNumber(mantissa: 177581714, exponent: -10, isNegative: false)
        )
    }

    public static var teaspoon: VolumeUnit {
        return VolumeUnit(
            name: "teaspoon",
            symbol: "tsp",
            ratio: NSDecimalNumber(mantissa: 591939, exponent: -8, isNegative: false)
        )
    }

    public static var fluidram: VolumeUnit {
        return VolumeUnit(
            name: "fluidram",
            symbol: "fl dr",
            ratio: NSDecimalNumber(mantissa: 35516328125, exponent: -13, isNegative: false)
        )
    }
}

extension NSNumber {

    public func gallon() -> Quantity {
        return Quantity(amount: self, unit: VolumeUnit.gallon)
    }

    public func quart() -> Quantity {
        return Quantity(amount: self, unit: VolumeUnit.quart)
    }

    public func pint() -> Quantity {
        return Quantity(amount: self, unit: VolumeUnit.pint)
    }

    public func cup() -> Quantity {
        return Quantity(amount: self, unit: VolumeUnit.cup)
    }

    public func fluidounce() -> Quantity {
        return Quantity(amount: self, unit: VolumeUnit.fluidounce)
    }

    public func tablespoon() -> Quantity {
        return Quantity(amount: self, unit: VolumeUnit.tablespoon)
    }

    public func teaspoon() -> Quantity {
        return Quantity(amount: self, unit: VolumeUnit.teaspoon)
    }

    public func fluidram() -> Quantity {
        return Quantity(amount: self, unit: VolumeUnit.fluidram)
    }
}
