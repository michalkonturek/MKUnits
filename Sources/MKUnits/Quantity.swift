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

/// A value type representing an amount of a `Unit`.
public struct Quantity: Sendable {
  public let amount: Decimal
  public let unit: Unit

  /// Instantiates a `Quantity` object.
  ///
  /// - Parameters:
  ///   - amount: amount of unit.
  ///   - unit: unit of measurement.
  public init(amount: Decimal, unit: Unit) {
    self.amount = amount
    self.unit = unit
  }

  /// Returns new `Quantity` with amount converted to given unit.
  ///
  /// - Parameter to: destination unit.
  public func converted(_ to: Unit) -> Quantity {
    assert(self.unit.isConvertible(to))
    let amount = self.unit.convert(self.amount, to: to)
    return Quantity(amount: amount, unit: to)
  }

  /// Returns new `Quantity` with reversed amount sign.
  public func negative() -> Quantity {
    self * -1
  }

  /// Returns new `Quantity` with amount rounded to given precision.
  ///
  /// - Parameter precision: number of decimal places.
  public func rounded(_ precision: Int) -> Quantity {
    assert(precision >= 0)
    var original = self.amount
    var rounded = Decimal()
    NSDecimalRound(&rounded, &original, precision, .plain)
    return Quantity(amount: rounded, unit: self.unit)
  }
}

// MARK: - Arithmetic Operators

public func + (lhs: Quantity, rhs: Quantity) -> Quantity {
  assert(lhs.unit.isConvertible(rhs.unit))
  let converted = rhs.converted(lhs.unit).amount
  return Quantity(amount: lhs.amount + converted, unit: lhs.unit)
}

public func - (lhs: Quantity, rhs: Quantity) -> Quantity {
  assert(lhs.unit.isConvertible(rhs.unit))
  let converted = rhs.converted(lhs.unit).amount
  return Quantity(amount: lhs.amount - converted, unit: lhs.unit)
}

public func * (lhs: Quantity, rhs: Int) -> Quantity {
  Quantity(amount: lhs.amount * Decimal(rhs), unit: lhs.unit)
}

public func * (lhs: Quantity, rhs: Double) -> Quantity {
  Quantity(amount: lhs.amount * Decimal(rhs), unit: lhs.unit)
}

public func * (lhs: Quantity, rhs: Decimal) -> Quantity {
  Quantity(amount: lhs.amount * rhs, unit: lhs.unit)
}

public func * (lhs: Int, rhs: Quantity) -> Quantity {
  Quantity(amount: rhs.amount * Decimal(lhs), unit: rhs.unit)
}

public func * (lhs: Double, rhs: Quantity) -> Quantity {
  Quantity(amount: rhs.amount * Decimal(lhs), unit: rhs.unit)
}

public func * (lhs: Decimal, rhs: Quantity) -> Quantity {
  Quantity(amount: rhs.amount * lhs, unit: rhs.unit)
}

// MARK: - CustomStringConvertible

extension Quantity: CustomStringConvertible {
  public var description: String {
    "\(amount) \(unit)"
  }
}

// MARK: - Equatable

extension Quantity: Equatable {

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
  lhs.equals(rhs)
}

// MARK: - Comparable

extension Quantity: Comparable {}

public func < (lhs: Quantity, rhs: Quantity) -> Bool {
  assert(lhs.unit.isConvertible(rhs.unit))
  let converted = lhs.converted(rhs.unit)
  return converted.amount < rhs.amount
}

public func <= (lhs: Quantity, rhs: Quantity) -> Bool {
  assert(lhs.unit.isConvertible(rhs.unit))
  let converted = lhs.converted(rhs.unit)
  return converted.amount <= rhs.amount
}

public func > (lhs: Quantity, rhs: Quantity) -> Bool {
  assert(lhs.unit.isConvertible(rhs.unit))
  let converted = lhs.converted(rhs.unit)
  return converted.amount > rhs.amount
}

public func >= (lhs: Quantity, rhs: Quantity) -> Bool {
  assert(lhs.unit.isConvertible(rhs.unit))
  let converted = lhs.converted(rhs.unit)
  return converted.amount >= rhs.amount
}
