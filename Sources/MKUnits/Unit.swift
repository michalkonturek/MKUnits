//
//  Unit.swift
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

/**
 Represents a unit of measurement.

 - author: Michal Konturek
 */
open class Unit: @unchecked Sendable {
    public let name: String
    public let symbol: String
    public let ratio: Decimal

    /**
     Instantiates a `Unit` object.

     - parameter name: unit name.
     - parameter symbol: unit symbol.
     - parameter ratio: conversion ratio to a base unit.

     - author: Michal Konturek
     */
    public init(name: String, symbol: String, ratio: Decimal) {
        self.name = name
        self.symbol = symbol
        self.ratio = ratio
    }

    /**
     Converts given `amount` from base unit to this unit.

     - parameter amount: amount in base unit.
     - returns: amount converted to this unit.

     - author: Michal Konturek
     */
    open func convertFromBaseUnit(_ amount: Decimal) -> Decimal {
        return amount / self.ratio
    }

    /**
     Converts given `amount` from this unit to base unit.

     - parameter amount: amount in this unit.
     - returns: amount converted to base unit.

     - author: Michal Konturek
     */
    open func convertToBaseUnit(_ amount: Decimal) -> Decimal {
        return amount * self.ratio
    }
}

// MARK: - CustomStringConvertible

extension Unit: CustomStringConvertible {
    public var description: String {
        return self.symbol
    }
}

// MARK: - UnitConvertible

/**
 A type with ability to convert between units.

 - author: Michal Konturek
 */
public protocol UnitConvertible {

    /// Converts `amount` from this unit to destination unit.
    func convert(_ amount: Decimal, to: Unit) -> Decimal

    /// Converts `amount` from source unit to this unit.
    func convert(_ amount: Decimal, from: Unit) -> Decimal

    /// Converts `amount` from source unit to destination unit.
    func convert(_ amount: Decimal, from: Unit, to: Unit) -> Decimal

    /// Returns `true` if this unit is convertible with the other unit.
    func isConvertible(_ with: Unit) -> Bool
}

extension Unit: UnitConvertible {

    public func convert(_ amount: Decimal, to: Unit) -> Decimal {
        return self.convert(amount, from: self, to: to)
    }

    public func convert(_ amount: Decimal, from: Unit) -> Decimal {
        return self.convert(amount, from: from, to: self)
    }

    public func convert(_ amount: Decimal, from: Unit, to: Unit) -> Decimal {
        let baseAmount = from.convertToBaseUnit(amount)
        let converted = to.convertFromBaseUnit(baseAmount)
        return converted
    }

    public func isConvertible(_ with: Unit) -> Bool {
        return type(of: with) == type(of: self)
    }
}

// MARK: - Equatable

extension Unit: Equatable {

    public func equals(_ other: Unit) -> Bool {
        if type(of: other) !== type(of: self) {
            return false
        }
        return self.symbol == other.symbol
    }
}
public func == <T>(lhs: T, rhs: T) -> Bool where T: Unit {
    return lhs.equals(rhs)
}
