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
    public static var ton: MassUnit {
        return MassUnit(
            name: "ton",
            symbol: "t",
            ratio: NSDecimalNumber(mantissa: 10160469088, exponent: -7, isNegative: false)
        )
    }

    /**
     Returns hundredweight `[cwt]` mass unit.
     
     - author: Michal Konturek
     */
    public static var hundredweight: MassUnit {
        return MassUnit(
            name: "hundredweight",
            symbol: "cwt",
            ratio: NSDecimalNumber(mantissa: 5080234544, exponent: -8, isNegative: false)
        )
    }

    /**
     Returns quarter `[qtr]` mass unit.
     
     - author: Michal Konturek
     */
    public static var quarter: MassUnit {
        return MassUnit(
            name: "quarter",
            symbol: "qtr",
            ratio: NSDecimalNumber(mantissa: 1270058636, exponent: -8, isNegative: false)
        )
    }

    /**
     Returns stone `[st]` mass unit.
     
     - author: Michal Konturek
     */
    public static var stone: MassUnit {
        return MassUnit(
            name: "stone",
            symbol: "st",
            ratio: NSDecimalNumber(mantissa: 635029, exponent: -5, isNegative: false)
        )
    }

    /**
     Returns pound `[lb]` mass unit.
     
     - author: Michal Konturek
     */
    public static var pound: MassUnit {
        return MassUnit(
            name: "pound",
            symbol: "lb",
            ratio: NSDecimalNumber(mantissa: 45359237, exponent: -8, isNegative: false)
        )
    }

    /**
     Returns ounce `[oz]` mass unit.
     
     - author: Michal Konturek
     */
    public static var ounce: MassUnit {
        return MassUnit(
            name: "ounce",
            symbol: "oz",
            ratio: NSDecimalNumber(mantissa: 28349523125, exponent: -12, isNegative: false)
        )
    }

    /**
     Returns drachm `[dr]` mass unit.
     
     - author: Michal Konturek
     */
    public static var drachm: MassUnit {
        return MassUnit(
            name: "drachm",
            symbol: "dr",
            ratio: NSDecimalNumber(mantissa: 17718451953125, exponent: -16, isNegative: false)
        )
    }

    /**
     Returns grain `[gr]` mass unit.
     
     - author: Michal Konturek
     */
    public static var grain: MassUnit {
        return MassUnit(
            name: "grain",
            symbol: "gr",
            ratio: NSDecimalNumber(mantissa: 6479891, exponent: -11, isNegative: false)
        )
    }
}

extension ExpressibleByIntegerLiteral {

    /**
     Returns instance converted as ton quantity.
     
     - author: Michal Konturek
     */
    public func ton() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: MassUnit.ton)
    }

    /**
     Returns instance converted as hundredweight quantity.
     
     - author: Michal Konturek
     */
    public func hundredweight() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: MassUnit.hundredweight)
    }

    /**
     Returns instance converted as quarter quantity.
     
     - author: Michal Konturek
     */
    public func quarter() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: MassUnit.quarter)
    }

    /**
     Returns instance converted as stone quantity.
     
     - author: Michal Konturek
     */
    public func stone() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: MassUnit.stone)
    }

    /**
     Returns instance converted as pound quantity.
     
     - author: Michal Konturek
     */
    public func pound() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: MassUnit.pound)
    }

    /**
     Returns instance converted as ounce quantity.
     
     - author: Michal Konturek
     */
    public func ounce() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: MassUnit.ounce)
    }

    /**
     Returns instance converted as drachm quantity.
     
     - author: Michal Konturek
     */
    public func drachm() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: MassUnit.drachm)
    }

    /**
     Returns instance converted as grain quantity.
     
     - author: Michal Konturek
     */
    public func grain() -> Quantity {
        return Quantity(amount: self as! NSNumber, unit: MassUnit.grain)
    }
}
