//
//  EnergyUnit.swift
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
