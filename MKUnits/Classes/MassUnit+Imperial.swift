//
//  MassUnit+Imperial.swift
//  MKUnits
//
//  Created by Michal Konturek on 01/08/2016.
//
//

import Foundation

public extension MassUnit {

    public static var ton: MassUnit {
        return MassUnit(
            name: "ton",
            symbol: "t",
            ratio: NSDecimalNumber(mantissa: 10160469088, exponent: -7, isNegative: false)
        )
    }

    public static var hundredweight: MassUnit {
        return MassUnit(
            name: "hundredweight",
            symbol: "cwt",
            ratio: NSDecimalNumber(mantissa: 5080234544, exponent: -8, isNegative: false)
        )
    }

    public static var quarter: MassUnit {
        return MassUnit(
            name: "quarter",
            symbol: "qtr",
            ratio: NSDecimalNumber(mantissa: 1270058636, exponent: -8, isNegative: false)
        )
    }

    public static var stone: MassUnit {
        return MassUnit(
            name: "stone",
            symbol: "st",
            ratio: NSDecimalNumber(mantissa: 635029, exponent: -5, isNegative: false)
        )
    }

    public static var pound: MassUnit {
        return MassUnit(
            name: "pound",
            symbol: "lb",
            ratio: NSDecimalNumber(mantissa: 45359237, exponent: -8, isNegative: false)
        )
    }

    public static var ounce: MassUnit {
        return MassUnit(
            name: "ounce",
            symbol: "oz",
            ratio: NSDecimalNumber(mantissa: 28349523125, exponent: -12, isNegative: false)
        )
    }

    public static var drachm: MassUnit {
        return MassUnit(
            name: "drachm",
            symbol: "dr",
            ratio: NSDecimalNumber(mantissa: 17718451953125, exponent: -16, isNegative: false)
        )
    }

    public static var grain: MassUnit {
        return MassUnit(
            name: "grain",
            symbol: "gr",
            ratio: NSDecimalNumber(mantissa: 6479891, exponent: -11, isNegative: false)
        )
    }
}

extension NSNumber {

    public func ton() -> Quantity {
        return Quantity(amount: self, unit: MassUnit.ton)
    }

    public func hundredweight() -> Quantity {
        return Quantity(amount: self, unit: MassUnit.hundredweight)
    }

    public func quarter() -> Quantity {
        return Quantity(amount: self, unit: MassUnit.quarter)
    }

    public func stone() -> Quantity {
        return Quantity(amount: self, unit: MassUnit.stone)
    }

    public func pound() -> Quantity {
        return Quantity(amount: self, unit: MassUnit.pound)
    }

    public func ounce() -> Quantity {
        return Quantity(amount: self, unit: MassUnit.ounce)
    }

    public func drachm() -> Quantity {
        return Quantity(amount: self, unit: MassUnit.drachm)
    }

    public func grain() -> Quantity {
        return Quantity(amount: self, unit: MassUnit.grain)
    }
}
