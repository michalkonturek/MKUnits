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
 
 - author: Michal Konturek
 */
open class Unit {
    open let name: String
    open let symbol: String
    open let ratio: NSDecimalNumber

    /**
     Instantiates an `Unit` object.
     
     - parameter name: `unit name`.
     - parameter symbol: `unit symbol`.
     - parameter ratio: conversion ratio to a `base unit`.
     
     - author: Michal Konturek
     */
    public init(name: String, symbol: String, ratio: NSNumber) {
        self.name = name
        self.symbol = symbol
        self.ratio = NSDecimalNumber(decimal: ratio.decimalValue)
    }

    /**
     Converts given `amount` from `base unit` to `this unit`.
     
     - parameter amount: `amount` in `base unit`.
     
     - returns: `amount` converted to `this unit`.
     
     - author: Michal Konturek
     */
    open func convertFromBaseUnit(_ amount: NSNumber) -> NSNumber {
        let converted = NSDecimalNumber(decimal: amount.decimalValue)
        return converted.dividing(by: self.ratio)
    }

    /**
     Converts given `amount` from `this unit` to `base unit`.
     
     - parameter amount: `amount` in `this unit`.
     
     - returns: `amount` converted to `base unit`.
     
     - author: Michal Konturek
     */
    open func convertToBaseUnit(_ amount: NSNumber) -> NSNumber {
        let converted = NSDecimalNumber(decimal: amount.decimalValue)
        return converted.multiplying(by: self.ratio)
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
    
    /**
     Converts `amount` from `this unit` to `destination unit`.
     
     - parameter amount: `amount` in `this unit`.
     - parameter to: `destination unit`.
     
     - returns: `amount` converted to `destination unit`.
     
     - author: Michal Konturek
     */
    func convert(_ amount: NSNumber, to: Unit) -> NSNumber
    
    /**
     Converts `amount` from `source unit` to `this unit`.
     
     - parameter amount: `amount` in `source unit`.
     - parameter from: `source unit`.
     
     - returns: `amount` converted from `source unit` to `this unit`.
     
     - author: Michal Konturek
     */
    func convert(_ amount: NSNumber, from: Unit) -> NSNumber
    
    /**
     Converts `amount` from `source unit` to `destination unit`.
     
     - parameter amount: `amount` in `source unit`.
     - parameter from: `source unit`.
     - parameter to: `destination unit`.
     
     - returns: `amount` converted from `source unit` to `destination unit`.
     
     - author: Michal Konturek
     */
    func convert(_ amount: NSNumber, from: Unit, to: Unit) -> NSNumber
    
    /**
     Returns `true` if `this unit` is convertible with `other unit`.
     
     - parameter with: `other unit` to compare with.
     
     - author: Michal Konturek
     */
    func isConvertible(_ with: Unit) -> Bool
}

extension Unit: UnitConvertible {

    /**
     Converts `amount` from `this unit` to `destination unit`.
     
     - parameter amount: `amount` in `this unit`.
     - parameter to: `destination unit`.
     
     - returns: `amount` converted to `destination unit`.
     
     - author: Michal Konturek
     */
    public func convert(_ amount: NSNumber, to: Unit) -> NSNumber {
        return self.convert(amount, from: self, to: to)
    }

    /**
     Converts `amount` from `source unit` to `this unit`.
     
     - parameter amount: `amount` in `source unit`.
     - parameter from: `source unit`.
     
     - returns: `amount` converted from `source unit` to `this unit`.
     
     - author: Michal Konturek
     */
    public func convert(_ amount: NSNumber, from: Unit) -> NSNumber {
        return self.convert(amount, from: from, to: self)
    }

    /**
     Converts `amount` from `source unit` to `destination unit`.
     
     - parameter amount: `amount` in `source unit`.
     - parameter from: `source unit`.
     - parameter to: `destination unit`.
     
     - returns: `amount` converted from `source unit` to `destination unit`.
     
     - author: Michal Konturek
     */
    public func convert(_ amount: NSNumber, from: Unit, to: Unit) -> NSNumber {
        let baseAmount = from.convertToBaseUnit(amount)
        let converted = to.convertFromBaseUnit(baseAmount)
        return converted
    }

    /**
     Returns `true` if `this unit` is convertible with `other unit`.
     
     - parameter with: `other unit` to compare with.
     
     - author: Michal Konturek
     */
    public func isConvertible(_ with: Unit) -> Bool {
        return type(of: with) == type(of: self)
    }
}

// MARK: - Equatable

extension Unit: Equatable {
    
    /**
     Returns `true` if `this unit` is the same as `other unit`.
     
     - important: Comparison is done on `type` and `unit symbol`.
     
     - parameter other: `other unit` to compare with.
     
     - author: Michal Konturek
     */
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
