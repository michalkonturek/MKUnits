//
//  VolumeUnit+Imperial.swift
//  Pods
//
//  Created by Michal Konturek on 01/08/2016.
//
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
