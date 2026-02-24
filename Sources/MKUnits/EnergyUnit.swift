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

public final class EnergyUnit: Unit, @unchecked Sendable {

    /**
     Returns gigajoule `[GJ]` energy unit.
     
     - author: Michal Konturek
     */
    public static var gigajoule: EnergyUnit {
        return EnergyUnit(
            name: "gigajoule",
            symbol: "GJ",
            ratio: Decimal(sign: .plus, exponent: 2, significand: 2388459)
        )
    }

    /**
     Returns megajoule `[MJ]` energy unit.
     
     - author: Michal Konturek
     */
    public static var megajoule: EnergyUnit {
        return EnergyUnit(
            name: "megajoule",
            symbol: "MJ",
            ratio: Decimal(sign: .plus, exponent: -1, significand: 2388459)
        )
    }

    /**
     Returns kilojoule `[kJ]` energy unit.
     
     - author: Michal Konturek
     */
    public static var kilojoule: EnergyUnit {
        return EnergyUnit(
            name: "kilojoule",
            symbol: "kJ",
            ratio: Decimal(sign: .plus, exponent: -4, significand: 2388459)
        )
    }

    /**
     Returns joule `[J]` energy unit.
     
     - author: Michal Konturek
     */
    public static var joule: EnergyUnit {
        return EnergyUnit(
            name: "joule",
            symbol: "J",
            ratio: Decimal(sign: .plus, exponent: -7, significand: 2388459)
        )
    }

    /**
     Returns kilocalorie `[kcal]` energy unit.
     
     - author: Michal Konturek
     */
    public static var kilocalorie: EnergyUnit {
        return EnergyUnit(
            name: "kilocalorie",
            symbol: "kcal",
            ratio: Decimal(sign: .plus, exponent: 3, significand: 1)
        )
    }

    /**
     Returns calorie `[cal]` energy unit.
     
     - author: Michal Konturek
     */
    public static var calorie: EnergyUnit {
        return EnergyUnit(
            name: "calorie",
            symbol: "cal",
            ratio: Decimal(1)
        )
    }
}

extension Int {
    /**
     Returns instance converted as gigajoule quantity.
     
     - author: Michal Konturek
     */
    public func gigajoule() -> Quantity {
        return Quantity(amount: Decimal(self), unit: EnergyUnit.gigajoule)
    }
    /**
     Returns instance converted as megajoule quantity.
     
     - author: Michal Konturek
     */
    public func megajoule() -> Quantity {
        return Quantity(amount: Decimal(self), unit: EnergyUnit.megajoule)
    }
    /**
     Returns instance converted as kilojoule quantity.
     
     - author: Michal Konturek
     */
    public func kilojoule() -> Quantity {
        return Quantity(amount: Decimal(self), unit: EnergyUnit.kilojoule)
    }
    /**
     Returns instance converted as joule quantity.
     
     - author: Michal Konturek
     */
    public func joule() -> Quantity {
        return Quantity(amount: Decimal(self), unit: EnergyUnit.joule)
    }
    /**
     Returns instance converted as kilocalorie quantity.
     
     - author: Michal Konturek
     */
    public func kilocalorie() -> Quantity {
        return Quantity(amount: Decimal(self), unit: EnergyUnit.kilocalorie)
    }
    /**
     Returns instance converted as calorie quantity.
     
     - author: Michal Konturek
     */
    public func calorie() -> Quantity {
        return Quantity(amount: Decimal(self), unit: EnergyUnit.calorie)
    }
}

extension Double {
    /**
     Returns instance converted as gigajoule quantity.
     
     - author: Michal Konturek
     */
    public func gigajoule() -> Quantity {
        return Quantity(amount: Decimal(self), unit: EnergyUnit.gigajoule)
    }
    /**
     Returns instance converted as megajoule quantity.
     
     - author: Michal Konturek
     */
    public func megajoule() -> Quantity {
        return Quantity(amount: Decimal(self), unit: EnergyUnit.megajoule)
    }
    /**
     Returns instance converted as kilojoule quantity.
     
     - author: Michal Konturek
     */
    public func kilojoule() -> Quantity {
        return Quantity(amount: Decimal(self), unit: EnergyUnit.kilojoule)
    }
    /**
     Returns instance converted as joule quantity.
     
     - author: Michal Konturek
     */
    public func joule() -> Quantity {
        return Quantity(amount: Decimal(self), unit: EnergyUnit.joule)
    }
    /**
     Returns instance converted as kilocalorie quantity.
     
     - author: Michal Konturek
     */
    public func kilocalorie() -> Quantity {
        return Quantity(amount: Decimal(self), unit: EnergyUnit.kilocalorie)
    }
    /**
     Returns instance converted as calorie quantity.
     
     - author: Michal Konturek
     */
    public func calorie() -> Quantity {
        return Quantity(amount: Decimal(self), unit: EnergyUnit.calorie)
    }
}
