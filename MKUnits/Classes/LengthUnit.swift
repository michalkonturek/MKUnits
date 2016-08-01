//
//  LengthUnit.swift
//  MKUnits
//
//  Created by Michal Konturek on 01/08/2016.
//
//

import Foundation

public final class LengthUnit: Unit {
    
    public static var kilometer: LengthUnit {
        return LengthUnit(
            name: "kilometer",
            symbol: "km",
            ratio: NSDecimalNumber(mantissa: 1, exponent: 3, isNegative: false)
        )
    }
    
    public static var meter: LengthUnit {
        return LengthUnit(
            name: "meter",
            symbol: "m",
            ratio: NSDecimalNumber.one()
        )
    }
    
    public static var centimeter: LengthUnit {
        return LengthUnit(
            name: "centimeter",
            symbol: "cm",
            ratio: NSDecimalNumber(mantissa: 1, exponent: -2, isNegative: false)
        )
    }
    
    public static var millimeter: LengthUnit {
        return LengthUnit(
            name: "millimeter",
            symbol: "mm",
            ratio: NSDecimalNumber(mantissa: 1, exponent: -3, isNegative: false)
        )
    }
}

extension NSNumber {
    
    public func kilometer() -> Quantity {
        return Quantity(amount: self, unit: LengthUnit.kilometer)
        
    }
    
    public func meter() -> Quantity {
        return Quantity(amount: self, unit: LengthUnit.meter)
        
    }
    
    public func centimeter() -> Quantity {
        return Quantity(amount: self, unit: LengthUnit.centimeter)
        
    }
    
    public func millimeter() -> Quantity {
        return Quantity(amount: self, unit: LengthUnit.millimeter)
        
    }
}
