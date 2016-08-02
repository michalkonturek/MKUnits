//
//  EnergyUnit.swift
//  MKUnits
//
//  Created by Michal Konturek on 31/07/2016.
//
//

import Foundation

public final class EnergyUnit: Unit {

    public static var gigajoule: EnergyUnit {
        return EnergyUnit(
            name: "gigajoule",
            symbol: "GJ",
            ratio: NSDecimalNumber(mantissa: 2388459, exponent: 2, isNegative: false)
        )
    }

    public static var megajoule: EnergyUnit {
        return EnergyUnit(
            name: "megajoule",
            symbol: "MJ",
            ratio: NSDecimalNumber(mantissa: 2388459, exponent: -1, isNegative: false)
        )
    }

    public static var kilojoule: EnergyUnit {
        return EnergyUnit(
            name: "kilojoule",
            symbol: "kJ",
            ratio: NSDecimalNumber(mantissa: 2388459, exponent: -4, isNegative: false)
        )
    }

    public static var joule: EnergyUnit {
        return EnergyUnit(
            name: "joule",
            symbol: "J",
            ratio: NSDecimalNumber(mantissa: 2388459, exponent: -7, isNegative: false)
        )
    }

    public static var kilocalorie: EnergyUnit {
        return EnergyUnit(
            name: "kilocalorie",
            symbol: "kcal",
            ratio: NSDecimalNumber(mantissa: 1, exponent: 3, isNegative: false)
        )
    }

    public static var calorie: EnergyUnit {
        return EnergyUnit(
            name: "calorie",
            symbol: "cal",
            ratio: NSDecimalNumber.one()
        )
    }
}

extension NSNumber {

    public func gigajoule() -> Quantity {
        return Quantity(amount: self, unit: EnergyUnit.gigajoule)
    }

    public func megajoule() -> Quantity {
        return Quantity(amount: self, unit: EnergyUnit.megajoule)
    }

    public func kilojoule() -> Quantity {
        return Quantity(amount: self, unit: EnergyUnit.kilojoule)
    }

    public func joule() -> Quantity {
        return Quantity(amount: self, unit: EnergyUnit.joule)
    }

    public func kilocalorie() -> Quantity {
        return Quantity(amount: self, unit: EnergyUnit.kilocalorie)
    }

    public func calorie() -> Quantity {
        return Quantity(amount: self, unit: EnergyUnit.calorie)
    }
}
