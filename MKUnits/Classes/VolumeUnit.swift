//
//  VolumeUnit.swift
//  MKUnits
//
//  Created by Michal Konturek on 01/08/2016.
//
//

import Foundation

public final class VolumeUnit: Unit {

    public static var hectolitre: VolumeUnit {
        return VolumeUnit(
            name: "hectolitre",
            symbol: "hl",
            ratio: NSDecimalNumber(mantissa: 1, exponent: 2, isNegative: false)
        )
    }

    public static var litre: VolumeUnit {
        return VolumeUnit(
            name: "litre",
            symbol: "l",
            ratio: NSDecimalNumber.one()
        )
    }

    public static var decilitre: VolumeUnit {
        return VolumeUnit(
            name: "decilitre",
            symbol: "dl",
            ratio: NSDecimalNumber(mantissa: 1, exponent: -1, isNegative: false)
        )
    }

    public static var centilitre: VolumeUnit {
        return VolumeUnit(
            name: "centilitre",
            symbol: "cl",
            ratio: NSDecimalNumber(mantissa: 1, exponent: -2, isNegative: false)
        )
    }

    public static var millilitre: VolumeUnit {
        return VolumeUnit(
            name: "millilitre",
            symbol: "ml",
            ratio: NSDecimalNumber(mantissa: 1, exponent: -3, isNegative: false)
        )
    }

    public static var microlitre: VolumeUnit {
        return VolumeUnit(
            name: "microlitre",
            symbol: "µl",
            ratio: NSDecimalNumber(mantissa: 1, exponent: -6, isNegative: false)
        )
    }
}

extension NSNumber {

    public func hectolitre() -> Quantity {
        return Quantity(amount: self, unit: VolumeUnit.hectolitre)
    }

    public func litre() -> Quantity {
        return Quantity(amount: self, unit: VolumeUnit.litre)
    }

    public func decilitre() -> Quantity {
        return Quantity(amount: self, unit: VolumeUnit.decilitre)
    }

    public func centilitre() -> Quantity {
        return Quantity(amount: self, unit: VolumeUnit.centilitre)
    }

    public func millilitre() -> Quantity {
        return Quantity(amount: self, unit: VolumeUnit.millilitre)
    }

    public func microlitre() -> Quantity {
        return Quantity(amount: self, unit: VolumeUnit.microlitre)
    }
}
