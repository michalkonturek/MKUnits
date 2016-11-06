//
//  Quantity.swift
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
 A `value type` representing an amount of an `Unit`.
 
 - author: Michal Konturek
 */
public struct Quantity {
    public let amount: NSDecimalNumber
    public let unit: Unit

    /**
     Instantiates an `Quantity` object.
     
     - important: convertes `amount` type to `NSDecimalNumber`.
     
     - parameter amount: `amount` of `unit`.
     - parameter unit: `unit` of measurement.
     
     - author: Michal Konturek
     */
    public init(amount: NSNumber, unit: Unit) {
        self.amount = NSDecimalNumber(decimal: amount.decimalValue)
        self.unit = unit
    }

    /**
     Returns new `Quantity` instance with `amount` converted to given `unit`.
     
     - parameter to: `destination unit`.
     
     - author: Michal Konturek
     */
    public func converted(_ to: Unit) -> Quantity {
        assert(self.unit.isConvertible(to))
        let amount = self.unit.convert(self.amount, to: to)
        return Quantity(amount: amount, unit: to)
    }

    /**
     Returns new `Quantity` instance with reversed `amount` sign.
     
     - author: Michal Konturek
     */
    public func negative() -> Quantity {
        return self * -1
    }

    /**
     Returns new `Quantity` instance with `amount` rounded with `precision`.
     
     - parameter precision: `precision` used for rounding.
     
     - author: Michal Konturek
     */
    public func rounded(_ precision: Int16) -> Quantity {
        assert(precision >= 0)
        let rounded = self.amount.rounding(
            accordingToBehavior: NSDecimalNumberHandler(
                roundingMode: .plain,
                scale: precision,
                raiseOnExactness: false,
                raiseOnOverflow: false,
                raiseOnUnderflow: false,
                raiseOnDivideByZero: false
            )
        )
        return Quantity(amount: rounded, unit: self.unit)
    }
}

// MARK: - Arithmetic Operators

public func + (lhs: Quantity, rhs: Quantity) -> Quantity {
    assert(lhs.unit.isConvertible(rhs.unit))
    let converted = rhs.converted(lhs.unit).amount
    let amount = lhs.amount.adding(converted)
    return Quantity(amount: amount, unit: lhs.unit)
}

public func - (lhs: Quantity, rhs: Quantity) -> Quantity {
    assert(lhs.unit.isConvertible(rhs.unit))
    let converted = rhs.converted(lhs.unit).amount
    let amount = lhs.amount.subtracting(converted)
    return Quantity(amount: amount, unit: lhs.unit)
}

public func * (lhs: Quantity, rhs: Int) -> Quantity {
    let amount = lhs.amount.multiplying(by: NSDecimalNumber(value: rhs as Int))
    return Quantity(amount: amount, unit: lhs.unit)
}

public func * (lhs: Quantity, rhs: Double) -> Quantity {
    let amount = lhs.amount.multiplying(by: NSDecimalNumber(value: rhs as Double))
    return Quantity(amount: amount, unit: lhs.unit)
}

public func * (lhs: Quantity, rhs: Float) -> Quantity {
    let amount = lhs.amount.multiplying(by: NSDecimalNumber(value: rhs as Float))
    return Quantity(amount: amount, unit: lhs.unit)
}

public func * (lhs: Quantity, rhs: NSNumber) -> Quantity {
    let amount = lhs.amount.multiplying(by: NSDecimalNumber(decimal: rhs.decimalValue))
    return Quantity(amount: amount, unit: lhs.unit)
}

public func * (lhs: Int, rhs: Quantity) -> Quantity {
    let amount = rhs.amount.multiplying(by: NSDecimalNumber(value: lhs as Int))
    return Quantity(amount: amount, unit: rhs.unit)
}

public func * (lhs: Double, rhs: Quantity) -> Quantity {
    let amount = rhs.amount.multiplying(by: NSDecimalNumber(value: lhs as Double))
    return Quantity(amount: amount, unit: rhs.unit)
}

public func * (lhs: Float, rhs: Quantity) -> Quantity {
    let amount = rhs.amount.multiplying(by: NSDecimalNumber(value: lhs as Float))
    return Quantity(amount: amount, unit: rhs.unit)
}

public func * (lhs: NSNumber, rhs: Quantity) -> Quantity {
    let amount = rhs.amount.multiplying(by: NSDecimalNumber(decimal: lhs.decimalValue))
    return Quantity(amount: amount, unit: rhs.unit)
}

// MARK: - CustomStringConvertible

extension Quantity: CustomStringConvertible {
    public var description: String {
        return "\(self.amount) \(self.unit)"
    }
}

// MARK: - Equatable

extension Quantity: Equatable {
    
    /**
     Returns `true` if `this quantity` has exact `amount` as `other quantity`.
     
     - important: Comparison with a non-convertible `quantity` returns `false`
     
     - parameter other: `other quantity` to compare with.
     
     - author: Michal Konturek
     */
    public func equals(_ other: Quantity) -> Bool {
        if self.unit.isConvertible(other.unit) {
            let converted = other.converted(self.unit)
            return self.amount == converted.amount
        } else {
            return false
        }
    }
}
public func == (lhs: Quantity, rhs: Quantity) -> Bool {
    return lhs.equals(rhs)
}

// MARK: - Comparable

extension Quantity: Comparable {}

public func < (lhs: Quantity, rhs: Quantity) -> Bool {
    assert(lhs.unit.isConvertible(rhs.unit))
    let converted = lhs.converted(rhs.unit)
    return converted.amount.compare(rhs.amount) == .orderedAscending
}

public func <= (lhs: Quantity, rhs: Quantity) -> Bool {
    assert(lhs.unit.isConvertible(rhs.unit))
    let converted = lhs.converted(rhs.unit)
    return converted.amount.compare(rhs.amount) != .orderedDescending
}

public func > (lhs: Quantity, rhs: Quantity) -> Bool {
    assert(lhs.unit.isConvertible(rhs.unit))
    let converted = lhs.converted(rhs.unit)
    return converted.amount.compare(rhs.amount) == .orderedDescending
}

public func >= (lhs: Quantity, rhs: Quantity) -> Bool {
    assert(lhs.unit.isConvertible(rhs.unit))
    let converted = lhs.converted(rhs.unit)
    return converted.amount.compare(rhs.amount) != .orderedAscending
}
