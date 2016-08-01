//
//  VolumeUnit+US.swift
//  MKUnits
//
//  Created by Michal Konturek on 01/08/2016.
//
//

import Foundation

extension VolumeUnit {
    
    public static var us_hogshead: VolumeUnit {
        return VolumeUnit(
            name: "hogshead",
            symbol: "hogshead",
            ratio: NSDecimalNumber(mantissa: 238480942392, exponent: -9, isNegative: false)
        )
    }
    
    public static var us_barrel: VolumeUnit {
        return VolumeUnit(
            name: "barrel",
            symbol: "bbl",
            ratio: NSDecimalNumber(mantissa: 119240471196, exponent: -9, isNegative: false)
        )
    }
    
    public static var us_gallon: VolumeUnit {
        return VolumeUnit(
            name: "US gallon",
            symbol: "US gal",
            ratio: NSDecimalNumber(mantissa: 3785411784, exponent: -9, isNegative: false)
        )
    }
    
    public static var us_quart: VolumeUnit {
        return VolumeUnit(
            name: "US quart",
            symbol: "US qt",
            ratio: NSDecimalNumber(mantissa: 946352946, exponent: -9, isNegative: false)
        )
    }
    
    public static var us_pint: VolumeUnit {
        return VolumeUnit(
            name: "US pint",
            symbol: "US pt",
            ratio: NSDecimalNumber(mantissa: 473176473, exponent: -9, isNegative: false)
        )
    }

    public static var us_cup: VolumeUnit {
        return VolumeUnit(
            name: "US cup",
            symbol: "US cp",
            ratio: NSDecimalNumber(mantissa: 2365882365, exponent: -10, isNegative: false)
        )
    }
    
    public static var us_gill: VolumeUnit {
        return VolumeUnit(
            name: "US gill",
            symbol: "US gi",
            ratio: NSDecimalNumber(mantissa: 11829411825, exponent: -11, isNegative: false)
        )
    }
    
    public static var us_fluidounce: VolumeUnit {
        return VolumeUnit(
            name: "US fluid ounce",
            symbol: "US fl oz",
            ratio: NSDecimalNumber(mantissa: 295735295625, exponent: -13, isNegative: false)
        )
    }
    
    public static var us_tablespoon: VolumeUnit {
        return VolumeUnit(
            name: "US tablespoon",
            symbol: "US tbsp",
            ratio: NSDecimalNumber(mantissa: 1478676478125, exponent: -14, isNegative: false)
        )
    }
    
    public static var us_teaspoon: VolumeUnit {
        return VolumeUnit(
            name: "US teaspoon",
            symbol: "tsp",
            ratio: NSDecimalNumber(mantissa: 492892159375, exponent: -14, isNegative: false)
        )
    }
    
    public static var us_fluidram: VolumeUnit {
        return VolumeUnit(
            name: "US fluidram",
            symbol: "US fl dr",
            ratio: NSDecimalNumber(mantissa: 36966911953125, exponent: -16, isNegative: false)
        )
    }
    
    public static var us_minim: VolumeUnit {
        return VolumeUnit(
            name: "minim",
            symbol: "min",
            ratio: NSDecimalNumber(mantissa: 61611519921875, exponent: -18, isNegative: false)
        )
    }
}

extension NSNumber {
    
    public func us_hogshead() -> Quantity {
        return Quantity(amount: self, unit: VolumeUnit.us_hogshead)
    }

    public func us_barrel() -> Quantity {
        return Quantity(amount: self, unit: VolumeUnit.us_barrel)
    }
    
    public func us_gallon() -> Quantity {
        return Quantity(amount: self, unit: VolumeUnit.us_gallon)
    }
    
    public func us_quart() -> Quantity {
        return Quantity(amount: self, unit: VolumeUnit.us_quart)
    }

    public func us_pint() -> Quantity {
        return Quantity(amount: self, unit: VolumeUnit.us_pint)
    }
    
    public func us_cup() -> Quantity {
        return Quantity(amount: self, unit: VolumeUnit.us_cup)
    }
    
    public func us_gill() -> Quantity {
        return Quantity(amount: self, unit: VolumeUnit.us_gill)
    }
    
    public func us_fluidounce() -> Quantity {
        return Quantity(amount: self, unit: VolumeUnit.us_fluidounce)
    }
    
    public func us_tablespoon() -> Quantity {
        return Quantity(amount: self, unit: VolumeUnit.us_tablespoon)
    }
    
    public func us_teaspoon() -> Quantity {
        return Quantity(amount: self, unit: VolumeUnit.us_teaspoon)
    }
    
    public func us_fluidram() -> Quantity {
        return Quantity(amount: self, unit: VolumeUnit.us_fluidram)
    }
    
    public func us_minim() -> Quantity {
        return Quantity(amount: self, unit: VolumeUnit.us_minim)
    }
}
