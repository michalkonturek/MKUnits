//
//  MassUnit.swift
//  Pods
//
//  Created by Michal Konturek on 29/07/2016.
//
//

import Foundation

public final class MassUnit: Unit {
    
    static var decagram: MassUnit {
        return MassUnit(
            name: "decagram",
            symbol: "dag",
            ratio: NSDecimalNumber(mantissa: 1, exponent: -2, isNegative: false)
        )
    }
    
    static var kilogram: MassUnit {
        return MassUnit(
            name: "kilogram",
            symbol: "kg",
            ratio: NSDecimalNumber.one()
        )
    }
}
