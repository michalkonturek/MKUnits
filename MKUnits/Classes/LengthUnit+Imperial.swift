//
//  LengthUnit+Imperial.swift
//  MKUnits
//
//  Created by Michal Konturek on 01/08/2016.
//
//

import Foundation

extension LengthUnit {
    
    public static var nauticalMile: LengthUnit {
        return LengthUnit(
            name: "nautical mile",
            symbol: "nmi",
            ratio: NSDecimalNumber(mantissa: 1853184, exponent: -3, isNegative: false)
        )
    }
    
    public static var mile: LengthUnit {
        return LengthUnit(
            name: "mile",
            symbol: "mi",
            ratio: NSDecimalNumber(mantissa: 1609344, exponent: -3, isNegative: false)
        )
    }
    
    public static var furlong: LengthUnit {
        return LengthUnit(
            name: "furlong",
            symbol: "fur",
            ratio: NSDecimalNumber(mantissa: 201168, exponent: -3, isNegative: false)
        )
    }
    
    public static var chain: LengthUnit {
        return LengthUnit(
            name: "chain",
            symbol: "ch",
            ratio: NSDecimalNumber(mantissa: 201168, exponent: -4, isNegative: false)
        )
    }
    
    public static var yard: LengthUnit {
        return LengthUnit(
            name: "yard",
            symbol: "yd",
            ratio: NSDecimalNumber(mantissa: 9144, exponent: -4, isNegative: false)
        )
    }
    
    public static var foot: LengthUnit {
        return LengthUnit(
            name: "foot",
            symbol: "ft",
            ratio: NSDecimalNumber(mantissa: 3048, exponent: -4, isNegative: false)
        )
    }
    
    public static var inch: LengthUnit {
        return LengthUnit(
            name: "inch",
            symbol: "in",
            ratio: NSDecimalNumber(mantissa: 254, exponent: -4, isNegative: false)
        )
    }
}

extension NSNumber {
    
    public func nauticalMile() -> Quantity {
        return Quantity(amount: self, unit: LengthUnit.nauticalMile)
    }
    
    public func mile() -> Quantity {
        return Quantity(amount: self, unit: LengthUnit.mile)
    }
    
    public func furlong() -> Quantity {
        return Quantity(amount: self, unit: LengthUnit.furlong)
    }
    
    public func chain() -> Quantity {
        return Quantity(amount: self, unit: LengthUnit.chain)
    }
    
    public func yard() -> Quantity {
        return Quantity(amount: self, unit: LengthUnit.yard)
    }
    
    public func foot() -> Quantity {
        return Quantity(amount: self, unit: LengthUnit.foot)
    }
    
    public func inch() -> Quantity {
        return Quantity(amount: self, unit: LengthUnit.inch)
    }
}
