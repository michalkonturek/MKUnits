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
 Represents an `unit of measurement`.
 */
public class Unit {
    public let name: String
    public let symbol: String
    public let ratio: NSDecimalNumber

    /**
     Instantiates an `unit` object.
     
     - parameter name: unit name.
     - parameter symbol: unit symbol.
     - parameter ratio: conversion ratio to a base unit.
     */
    public init(name: String, symbol: String, ratio: NSNumber) {
        self.name = name
        self.symbol = symbol
        self.ratio = NSDecimalNumber(decimal: ratio.decimalValue)
    }

    /**
     Converts given amount from a `base unit` to the `current unit`.
     
     - parameter amount: `amount` in a `base unit`.
     
     - returns: `amount` converted to the `current unit`.
     */
    public func convertFromBaseUnit(amount: NSNumber) -> NSNumber {
        let converted = NSDecimalNumber(decimal: amount.decimalValue)
        return converted.decimalNumberByDividingBy(self.ratio)
    }

    /**
     Converts given amount from the current unit to a base unit.
     
     - parameter amount: `amount` in the `current unit`.
     
     - returns: `amount` converted to a `base unit`.
     */
    public func convertToBaseUnit(amount: NSNumber) -> NSNumber {
        let converted = NSDecimalNumber(decimal: amount.decimalValue)
        return converted.decimalNumberByMultiplyingBy(self.ratio)
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
 Ability to convert between units.
 */
public protocol UnitConvertible {
    
    /**
     Converts `amount` from a `current unit` to a `destination unit`.
     
     - parameter amount: the given `amount` in the `current unit`.
     - parameter to: given `destination unit`.
     
     - returns: `amount` converted to `destination unit`.
     */
    func convert(amount: NSNumber, to: Unit) -> NSNumber
    
    /**
     Converts `amount` from a `source unit` to the `current unit`.
     
     - parameter amount: the given `amount` int the `source unit`.
     - parameter from: given `source unit`.
     
     - returns: `amount` converted from a `source unit` to the `current unit`.
     */
    func convert(amount: NSNumber, from: Unit) -> NSNumber
    
    /**
     Converts `amount` from a `source unit` to a `destination unit`.
     
     - parameter amount: `amount` to be converted.
     - parameter from: `source unit`.
     - parameter to: `destination unit`.
     
     - returns: `amount` converted from a `source unit` to a `destination unit`.
     */
    func convert(amount: NSNumber, from: Unit, to: Unit) -> NSNumber
    
    /**
     Indicates if a `current unit` is convertible with an `other unit`.
     */
    func isConvertible(with: Unit) -> Bool
}

extension Unit: UnitConvertible {

    /***/
    public func convert(amount: NSNumber, to: Unit) -> NSNumber {
        return self.convert(amount, from: self, to: to)
    }

    /***/
    public func convert(amount: NSNumber, from: Unit) -> NSNumber {
        return self.convert(amount, from: from, to: self)
    }

    /***/
    public func convert(amount: NSNumber, from: Unit, to: Unit) -> NSNumber {
        let baseAmount = from.convertToBaseUnit(amount)
        let converted = to.convertFromBaseUnit(baseAmount)
        return converted
    }

    /***/
    public func isConvertible(with: Unit) -> Bool {
        return with.dynamicType == self.dynamicType
    }
}

// MARK: - Equatable

extension Unit: Equatable {
    
    /**
     Compares instance to a conforming type.
     
     - parameter other: given `unit` to compare
     - returns:
     */
    public func equals(other: Unit) -> Bool {
        if other.dynamicType !== self.dynamicType {
            return false
        }
        return self.symbol == other.symbol
    }
}
public func == <T where T: Unit>(lhs: T, rhs: T) -> Bool {
    return lhs.equals(rhs)
}
