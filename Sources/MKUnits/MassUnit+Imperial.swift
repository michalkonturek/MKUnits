//
//  MassUnit+Imperial.swift
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

public extension MassUnit {

    /// Returns ton `[t]` mass unit.
    static let ton = MassUnit(
        name: "ton",
        symbol: "t",
        ratio: Decimal(string: "1016.0469088")!
    )

    /// Returns hundredweight `[cwt]` mass unit.
    static let hundredweight = MassUnit(
        name: "hundredweight",
        symbol: "cwt",
        ratio: Decimal(string: "50.80234544")!
    )

    /// Returns quarter `[qtr]` mass unit.
    static let quarter = MassUnit(
        name: "quarter",
        symbol: "qtr",
        ratio: Decimal(string: "12.70058636")!
    )

    /// Returns stone `[st]` mass unit.
    static let stone = MassUnit(
        name: "stone",
        symbol: "st",
        ratio: Decimal(string: "6.35029")!
    )

    /// Returns pound `[lb]` mass unit.
    static let pound = MassUnit(
        name: "pound",
        symbol: "lb",
        ratio: Decimal(string: "0.45359237")!
    )

    /// Returns ounce `[oz]` mass unit.
    static let ounce = MassUnit(
        name: "ounce",
        symbol: "oz",
        ratio: Decimal(string: "0.028349523125")!
    )

    /// Returns drachm `[dr]` mass unit.
    static let drachm = MassUnit(
        name: "drachm",
        symbol: "dr",
        ratio: Decimal(string: "0.0017718451953125")!
    )

    /// Returns grain `[gr]` mass unit.
    static let grain = MassUnit(
        name: "grain",
        symbol: "gr",
        ratio: Decimal(string: "0.00006479891")!
    )
}

extension Int {
    /// Returns instance converted as ton quantity.
    public func ton() -> Quantity {
        Quantity(amount: Decimal(self), unit: MassUnit.ton)
    }
    /// Returns instance converted as hundredweight quantity.
    public func hundredweight() -> Quantity {
        Quantity(amount: Decimal(self), unit: MassUnit.hundredweight)
    }
    /// Returns instance converted as quarter quantity.
    public func quarter() -> Quantity {
        Quantity(amount: Decimal(self), unit: MassUnit.quarter)
    }
    /// Returns instance converted as stone quantity.
    public func stone() -> Quantity {
        Quantity(amount: Decimal(self), unit: MassUnit.stone)
    }
    /// Returns instance converted as pound quantity.
    public func pound() -> Quantity {
        Quantity(amount: Decimal(self), unit: MassUnit.pound)
    }
    /// Returns instance converted as ounce quantity.
    public func ounce() -> Quantity {
        Quantity(amount: Decimal(self), unit: MassUnit.ounce)
    }
    /// Returns instance converted as drachm quantity.
    public func drachm() -> Quantity {
        Quantity(amount: Decimal(self), unit: MassUnit.drachm)
    }
    /// Returns instance converted as grain quantity.
    public func grain() -> Quantity {
        Quantity(amount: Decimal(self), unit: MassUnit.grain)
    }
}

extension Double {
    /// Returns instance converted as ton quantity.
    public func ton() -> Quantity {
        Quantity(amount: Decimal(self), unit: MassUnit.ton)
    }
    /// Returns instance converted as hundredweight quantity.
    public func hundredweight() -> Quantity {
        Quantity(amount: Decimal(self), unit: MassUnit.hundredweight)
    }
    /// Returns instance converted as quarter quantity.
    public func quarter() -> Quantity {
        Quantity(amount: Decimal(self), unit: MassUnit.quarter)
    }
    /// Returns instance converted as stone quantity.
    public func stone() -> Quantity {
        Quantity(amount: Decimal(self), unit: MassUnit.stone)
    }
    /// Returns instance converted as pound quantity.
    public func pound() -> Quantity {
        Quantity(amount: Decimal(self), unit: MassUnit.pound)
    }
    /// Returns instance converted as ounce quantity.
    public func ounce() -> Quantity {
        Quantity(amount: Decimal(self), unit: MassUnit.ounce)
    }
    /// Returns instance converted as drachm quantity.
    public func drachm() -> Quantity {
        Quantity(amount: Decimal(self), unit: MassUnit.drachm)
    }
    /// Returns instance converted as grain quantity.
    public func grain() -> Quantity {
        Quantity(amount: Decimal(self), unit: MassUnit.grain)
    }
}
