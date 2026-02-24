//
//  AreaUnit.swift
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

public final class AreaUnit: Unit, @unchecked Sendable {

  /// Returns square kilomoter `[km²]` area unit.
  public static let squareKilometer = AreaUnit(
    name: "square",
    symbol: "km²",
    ratio: 1_000_000
  )

  /// Returns hectare `[ha]` area unit.
  public static let hectare = AreaUnit(
    name: "hectare",
    symbol: "ha",
    ratio: 10_000
  )

  /// Returns are `[a]` area unit.
  public static let are = AreaUnit(
    name: "are",
    symbol: "a",
    ratio: 100
  )

  /// Returns square meter `[m²]` area unit.
  ///
  /// This is a base unit.
  public static let squareMeter = AreaUnit(
    name: "square meter",
    symbol: "m²",
    ratio: 1
  )

  /// Returns square decimeter `[dm²]` area unit.
  public static let squareDecimeter = AreaUnit(
    name: "square decimeter",
    symbol: "dm²",
    ratio: Decimal(string: "0.01")!
  )

  /// Returns square centimeter `[cm²]` area unit.
  public static let squareCentimeter = AreaUnit(
    name: "square centimeter",
    symbol: "cm²",
    ratio: Decimal(string: "0.0001")!
  )

  /// Returns square millimeter `[mm²]` area unit.
  public static let squareMillimeter = AreaUnit(
    name: "square millimeter",
    symbol: "mm²",
    ratio: Decimal(string: "0.000001")!
  )
}

extension Int {
  /// Returns instance converted as square kilometer quantity.
  public func squareKilometer() -> Quantity {
    Quantity(amount: Decimal(self), unit: AreaUnit.squareKilometer)
  }
  /// Returns instance converted as hectare quantity.
  public func hectare() -> Quantity {
    Quantity(amount: Decimal(self), unit: AreaUnit.hectare)
  }
  /// Returns instance converted as are quantity.
  public func are() -> Quantity {
    Quantity(amount: Decimal(self), unit: AreaUnit.are)
  }
  /// Returns instance converted as square meter quantity.
  public func squareMeter() -> Quantity {
    Quantity(amount: Decimal(self), unit: AreaUnit.squareMeter)
  }
  /// Returns instance converted as square decimeter quantity.
  public func squareDecimeter() -> Quantity {
    Quantity(amount: Decimal(self), unit: AreaUnit.squareDecimeter)
  }
  /// Returns instance converted as square centimeter quantity.
  public func squareCentimeter() -> Quantity {
    Quantity(amount: Decimal(self), unit: AreaUnit.squareCentimeter)
  }
  /// Returns instance converted as square millimeter quantity.
  public func squareMillimeter() -> Quantity {
    Quantity(amount: Decimal(self), unit: AreaUnit.squareMillimeter)
  }
}

extension Double {
  /// Returns instance converted as square kilometer quantity.
  public func squareKilometer() -> Quantity {
    Quantity(amount: Decimal(self), unit: AreaUnit.squareKilometer)
  }
  /// Returns instance converted as hectare quantity.
  public func hectare() -> Quantity {
    Quantity(amount: Decimal(self), unit: AreaUnit.hectare)
  }
  /// Returns instance converted as are quantity.
  public func are() -> Quantity {
    Quantity(amount: Decimal(self), unit: AreaUnit.are)
  }
  /// Returns instance converted as square meter quantity.
  public func squareMeter() -> Quantity {
    Quantity(amount: Decimal(self), unit: AreaUnit.squareMeter)
  }
  /// Returns instance converted as square decimeter quantity.
  public func squareDecimeter() -> Quantity {
    Quantity(amount: Decimal(self), unit: AreaUnit.squareDecimeter)
  }
  /// Returns instance converted as square centimeter quantity.
  public func squareCentimeter() -> Quantity {
    Quantity(amount: Decimal(self), unit: AreaUnit.squareCentimeter)
  }
  /// Returns instance converted as square millimeter quantity.
  public func squareMillimeter() -> Quantity {
    Quantity(amount: Decimal(self), unit: AreaUnit.squareMillimeter)
  }
}
