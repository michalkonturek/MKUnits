//
//  MassUnit.swift
//  MKUnits
//
//  Created by Michal Konturek on 29/07/2016.
//
//

import Foundation

public final class MassUnit: Unit {

    public static var megagram: MassUnit {
        return MassUnit(
            name: "megagram",
            symbol: "Mg",
            ratio: NSDecimalNumber(mantissa: 1, exponent: 3, isNegative: false)
        )
    }

    public static var kilogram: MassUnit {
        return MassUnit(
            name: "kilogram",
            symbol: "kg",
            ratio: NSDecimalNumber.one()
        )
    }

    public static var decagram: MassUnit {
        return MassUnit(
            name: "decagram",
            symbol: "dag",
            ratio: NSDecimalNumber(mantissa: 1, exponent: -2, isNegative: false)
        )
    }

    public static var gram: MassUnit {
        return MassUnit(
            name: "gram",
            symbol: "g",
            ratio: NSDecimalNumber(mantissa: 1, exponent: -3, isNegative: false)
        )
    }

    public static var milligram: MassUnit {
        return MassUnit(
            name: "milligram",
            symbol: "mg",
            ratio: NSDecimalNumber(mantissa: 1, exponent: -6, isNegative: false)
        )
    }
}

extension NSNumber {

    public func megagram() -> Quantity {
        return Quantity(amount: self, unit: MassUnit.megagram)
    }

    public func kilogram() -> Quantity {
        return Quantity(amount: self, unit: MassUnit.kilogram)
    }

    public func decagram() -> Quantity {
        return Quantity(amount: self, unit: MassUnit.decagram)
    }

    public func gram() -> Quantity {
        return Quantity(amount: self, unit: MassUnit.gram)
    }

    public func milligram() -> Quantity {
        return Quantity(amount: self, unit: MassUnit.milligram)
    }
}
