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

    /**
     Returns ton `[t]` mass unit.
     
     - author: Michal Konturek
     */
    static var ton: MassUnit {
        return MassUnit(
            name: "ton",
            symbol: "t",
            ratio: Decimal(sign: .plus, exponent: -7, significand: 10160469088)
        )
    }

    /**
     Returns hundredweight `[cwt]` mass unit.
     
     - author: Michal Konturek
     */
    static var hundredweight: MassUnit {
        return MassUnit(
            name: "hundredweight",
            symbol: "cwt",
            ratio: Decimal(sign: .plus, exponent: -8, significand: 5080234544)
        )
    }

    /**
     Returns quarter `[qtr]` mass unit.
     
     - author: Michal Konturek
     */
    static var quarter: MassUnit {
        return MassUnit(
            name: "quarter",
            symbol: "qtr",
            ratio: Decimal(sign: .plus, exponent: -8, significand: 1270058636)
        )
    }

    /**
     Returns stone `[st]` mass unit.
     
     - author: Michal Konturek
     */
    static var stone: MassUnit {
        return MassUnit(
            name: "stone",
            symbol: "st",
            ratio: Decimal(sign: .plus, exponent: -5, significand: 635029)
        )
    }

    /**
     Returns pound `[lb]` mass unit.
     
     - author: Michal Konturek
     */
    static var pound: MassUnit {
        return MassUnit(
            name: "pound",
            symbol: "lb",
            ratio: Decimal(sign: .plus, exponent: -8, significand: 45359237)
        )
    }

    /**
     Returns ounce `[oz]` mass unit.
     
     - author: Michal Konturek
     */
    static var ounce: MassUnit {
        return MassUnit(
            name: "ounce",
            symbol: "oz",
            ratio: Decimal(sign: .plus, exponent: -12, significand: 28349523125)
        )
    }

    /**
     Returns drachm `[dr]` mass unit.
     
     - author: Michal Konturek
     */
    static var drachm: MassUnit {
        return MassUnit(
            name: "drachm",
            symbol: "dr",
            ratio: Decimal(sign: .plus, exponent: -16, significand: 17718451953125)
        )
    }

    /**
     Returns grain `[gr]` mass unit.
     
     - author: Michal Konturek
     */
    static var grain: MassUnit {
        return MassUnit(
            name: "grain",
            symbol: "gr",
            ratio: Decimal(sign: .plus, exponent: -11, significand: 6479891)
        )
    }
}

extension Int {
    /**
     Returns instance converted as ton quantity.
     
     - author: Michal Konturek
     */
    public func ton() -> Quantity {
        return Quantity(amount: Decimal(self), unit: MassUnit.ton)
    }
    /**
     Returns instance converted as hundredweight quantity.
     
     - author: Michal Konturek
     */
    public func hundredweight() -> Quantity {
        return Quantity(amount: Decimal(self), unit: MassUnit.hundredweight)
    }
    /**
     Returns instance converted as quarter quantity.
     
     - author: Michal Konturek
     */
    public func quarter() -> Quantity {
        return Quantity(amount: Decimal(self), unit: MassUnit.quarter)
    }
    /**
     Returns instance converted as stone quantity.
     
     - author: Michal Konturek
     */
    public func stone() -> Quantity {
        return Quantity(amount: Decimal(self), unit: MassUnit.stone)
    }
    /**
     Returns instance converted as pound quantity.
     
     - author: Michal Konturek
     */
    public func pound() -> Quantity {
        return Quantity(amount: Decimal(self), unit: MassUnit.pound)
    }
    /**
     Returns instance converted as ounce quantity.
     
     - author: Michal Konturek
     */
    public func ounce() -> Quantity {
        return Quantity(amount: Decimal(self), unit: MassUnit.ounce)
    }
    /**
     Returns instance converted as drachm quantity.
     
     - author: Michal Konturek
     */
    public func drachm() -> Quantity {
        return Quantity(amount: Decimal(self), unit: MassUnit.drachm)
    }
    /**
     Returns instance converted as grain quantity.
     
     - author: Michal Konturek
     */
    public func grain() -> Quantity {
        return Quantity(amount: Decimal(self), unit: MassUnit.grain)
    }
}

extension Double {
    /**
     Returns instance converted as ton quantity.
     
     - author: Michal Konturek
     */
    public func ton() -> Quantity {
        return Quantity(amount: Decimal(self), unit: MassUnit.ton)
    }
    /**
     Returns instance converted as hundredweight quantity.
     
     - author: Michal Konturek
     */
    public func hundredweight() -> Quantity {
        return Quantity(amount: Decimal(self), unit: MassUnit.hundredweight)
    }
    /**
     Returns instance converted as quarter quantity.
     
     - author: Michal Konturek
     */
    public func quarter() -> Quantity {
        return Quantity(amount: Decimal(self), unit: MassUnit.quarter)
    }
    /**
     Returns instance converted as stone quantity.
     
     - author: Michal Konturek
     */
    public func stone() -> Quantity {
        return Quantity(amount: Decimal(self), unit: MassUnit.stone)
    }
    /**
     Returns instance converted as pound quantity.
     
     - author: Michal Konturek
     */
    public func pound() -> Quantity {
        return Quantity(amount: Decimal(self), unit: MassUnit.pound)
    }
    /**
     Returns instance converted as ounce quantity.
     
     - author: Michal Konturek
     */
    public func ounce() -> Quantity {
        return Quantity(amount: Decimal(self), unit: MassUnit.ounce)
    }
    /**
     Returns instance converted as drachm quantity.
     
     - author: Michal Konturek
     */
    public func drachm() -> Quantity {
        return Quantity(amount: Decimal(self), unit: MassUnit.drachm)
    }
    /**
     Returns instance converted as grain quantity.
     
     - author: Michal Konturek
     */
    public func grain() -> Quantity {
        return Quantity(amount: Decimal(self), unit: MassUnit.grain)
    }
}
