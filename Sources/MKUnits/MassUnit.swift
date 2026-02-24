//
//  MassUnit.swift
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

public final class MassUnit: Unit, @unchecked Sendable {

    /// Returns megagram `[Mg]` mass unit.
    public static let megagram = MassUnit(
        name: "megagram",
        symbol: "Mg",
        ratio: 1_000
    )

    /// Returns kilogram `[kg]` mass unit.
    ///
    /// This is a base unit.
    public static let kilogram = MassUnit(
        name: "kilogram",
        symbol: "kg",
        ratio: 1
    )

    /// Returns decagram `[dag]` mass unit.
    public static let decagram = MassUnit(
        name: "decagram",
        symbol: "dag",
        ratio: Decimal(string: "0.01")!
    )

    /// Returns gram `[g]` mass unit.
    public static let gram = MassUnit(
        name: "gram",
        symbol: "g",
        ratio: Decimal(string: "0.001")!
    )

    /// Returns milligram `[mg]` mass unit.
    public static let milligram = MassUnit(
        name: "milligram",
        symbol: "mg",
        ratio: Decimal(string: "0.000001")!
    )
}

extension Int {
    /// Returns instance converted as megagram quantity.
    public func megagram() -> Quantity {
        Quantity(amount: Decimal(self), unit: MassUnit.megagram)
    }
    /// Returns instance converted as kilogram quantity.
    public func kilogram() -> Quantity {
        Quantity(amount: Decimal(self), unit: MassUnit.kilogram)
    }
    /// Returns instance converted as decagram quantity.
    public func decagram() -> Quantity {
        Quantity(amount: Decimal(self), unit: MassUnit.decagram)
    }
    /// Returns instance converted as gram quantity.
    public func gram() -> Quantity {
        Quantity(amount: Decimal(self), unit: MassUnit.gram)
    }
    /// Returns instance converted as milligram quantity.
    public func milligram() -> Quantity {
        Quantity(amount: Decimal(self), unit: MassUnit.milligram)
    }
}

extension Double {
    /// Returns instance converted as megagram quantity.
    public func megagram() -> Quantity {
        Quantity(amount: Decimal(self), unit: MassUnit.megagram)
    }
    /// Returns instance converted as kilogram quantity.
    public func kilogram() -> Quantity {
        Quantity(amount: Decimal(self), unit: MassUnit.kilogram)
    }
    /// Returns instance converted as decagram quantity.
    public func decagram() -> Quantity {
        Quantity(amount: Decimal(self), unit: MassUnit.decagram)
    }
    /// Returns instance converted as gram quantity.
    public func gram() -> Quantity {
        Quantity(amount: Decimal(self), unit: MassUnit.gram)
    }
    /// Returns instance converted as milligram quantity.
    public func milligram() -> Quantity {
        Quantity(amount: Decimal(self), unit: MassUnit.milligram)
    }
}
