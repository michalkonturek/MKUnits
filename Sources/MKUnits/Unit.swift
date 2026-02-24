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

/// Represents a unit of measurement.
open class Unit: @unchecked Sendable {
  public let name: String
  public let symbol: String
  public let ratio: Decimal

  /// Instantiates a `Unit` object.
  ///
  /// - Parameters:
  ///   - name: unit name.
  ///   - symbol: unit symbol.
  ///   - ratio: conversion ratio to a base unit.
  public init(name: String, symbol: String, ratio: Decimal) {
    self.name = name
    self.symbol = symbol
    self.ratio = ratio
  }

  /// Converts given `amount` from base unit to this unit.
  ///
  /// - Parameter amount: amount in base unit.
  /// - Returns: amount converted to this unit.
  open func convertFromBaseUnit(_ amount: Decimal) -> Decimal {
    amount / ratio
  }

  /// Converts given `amount` from this unit to base unit.
  ///
  /// - Parameter amount: amount in this unit.
  /// - Returns: amount converted to base unit.
  open func convertToBaseUnit(_ amount: Decimal) -> Decimal {
    amount * ratio
  }
}

// MARK: - CustomStringConvertible

extension Unit: CustomStringConvertible {
  public var description: String {
    symbol
  }
}

// MARK: - UnitConvertible

/// A type with ability to convert between units.
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
    convert(amount, from: self, to: to)
  }

  public func convert(_ amount: Decimal, from: Unit) -> Decimal {
    convert(amount, from: from, to: self)
  }

  public func convert(_ amount: Decimal, from: Unit, to: Unit) -> Decimal {
    to.convertFromBaseUnit(from.convertToBaseUnit(amount))
  }

  public func isConvertible(_ with: Unit) -> Bool {
    type(of: with) == type(of: self)
  }
}

// MARK: - Equatable

extension Unit: Equatable {

  public func equals(_ other: Unit) -> Bool {
    if type(of: other) != type(of: self) {
      return false
    }
    return symbol == other.symbol
  }
}
public func == <T>(lhs: T, rhs: T) -> Bool where T: Unit {
  lhs.equals(rhs)
}
