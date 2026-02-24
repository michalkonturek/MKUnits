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

    /// Returns gigajoule `[GJ]` energy unit.
    public static let gigajoule = EnergyUnit(
        name: "gigajoule",
        symbol: "GJ",
        ratio: 238_845_900
    )

    /// Returns megajoule `[MJ]` energy unit.
    public static let megajoule = EnergyUnit(
        name: "megajoule",
        symbol: "MJ",
        ratio: Decimal(string: "238845.9")!
    )

    /// Returns kilojoule `[kJ]` energy unit.
    public static let kilojoule = EnergyUnit(
        name: "kilojoule",
        symbol: "kJ",
        ratio: Decimal(string: "238.8459")!
    )

    /// Returns joule `[J]` energy unit.
    public static let joule = EnergyUnit(
        name: "joule",
        symbol: "J",
        ratio: Decimal(string: "0.2388459")!
    )

    /// Returns kilocalorie `[kcal]` energy unit.
    public static let kilocalorie = EnergyUnit(
        name: "kilocalorie",
        symbol: "kcal",
        ratio: 1_000
    )

    /// Returns calorie `[cal]` energy unit.
    public static let calorie = EnergyUnit(
        name: "calorie",
        symbol: "cal",
        ratio: 1
    )
}

extension Int {
    /// Returns instance converted as gigajoule quantity.
    public func gigajoule() -> Quantity {
        Quantity(amount: Decimal(self), unit: EnergyUnit.gigajoule)
    }
    /// Returns instance converted as megajoule quantity.
    public func megajoule() -> Quantity {
        Quantity(amount: Decimal(self), unit: EnergyUnit.megajoule)
    }
    /// Returns instance converted as kilojoule quantity.
    public func kilojoule() -> Quantity {
        Quantity(amount: Decimal(self), unit: EnergyUnit.kilojoule)
    }
    /// Returns instance converted as joule quantity.
    public func joule() -> Quantity {
        Quantity(amount: Decimal(self), unit: EnergyUnit.joule)
    }
    /// Returns instance converted as kilocalorie quantity.
    public func kilocalorie() -> Quantity {
        Quantity(amount: Decimal(self), unit: EnergyUnit.kilocalorie)
    }
    /// Returns instance converted as calorie quantity.
    public func calorie() -> Quantity {
        Quantity(amount: Decimal(self), unit: EnergyUnit.calorie)
    }
}

extension Double {
    /// Returns instance converted as gigajoule quantity.
    public func gigajoule() -> Quantity {
        Quantity(amount: Decimal(self), unit: EnergyUnit.gigajoule)
    }
    /// Returns instance converted as megajoule quantity.
    public func megajoule() -> Quantity {
        Quantity(amount: Decimal(self), unit: EnergyUnit.megajoule)
    }
    /// Returns instance converted as kilojoule quantity.
    public func kilojoule() -> Quantity {
        Quantity(amount: Decimal(self), unit: EnergyUnit.kilojoule)
    }
    /// Returns instance converted as joule quantity.
    public func joule() -> Quantity {
        Quantity(amount: Decimal(self), unit: EnergyUnit.joule)
    }
    /// Returns instance converted as kilocalorie quantity.
    public func kilocalorie() -> Quantity {
        Quantity(amount: Decimal(self), unit: EnergyUnit.kilocalorie)
    }
    /// Returns instance converted as calorie quantity.
    public func calorie() -> Quantity {
        Quantity(amount: Decimal(self), unit: EnergyUnit.calorie)
    }
}
