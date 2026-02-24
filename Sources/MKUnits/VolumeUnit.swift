//
//  VolumeUnit.swift
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

public final class VolumeUnit: Unit, @unchecked Sendable {

  /// Returns hectolitre `[hl]` volume unit.
  public static let hectolitre = VolumeUnit(
    name: "hectolitre",
    symbol: "hl",
    ratio: 100
  )

  /// Returns litre `[l]` volume unit.
  ///
  /// This is a base unit.
  public static let litre = VolumeUnit(
    name: "litre",
    symbol: "l",
    ratio: 1
  )

  /// Returns decilitre `[dl]` volume unit.
  public static let decilitre = VolumeUnit(
    name: "decilitre",
    symbol: "dl",
    ratio: Decimal(string: "0.1")!
  )

  /// Returns centilitre `[cl]` volume unit.
  public static let centilitre = VolumeUnit(
    name: "centilitre",
    symbol: "cl",
    ratio: Decimal(string: "0.01")!
  )

  /// Returns millilitre `[ml]` volume unit.
  public static let millilitre = VolumeUnit(
    name: "millilitre",
    symbol: "ml",
    ratio: Decimal(string: "0.001")!
  )

  /// Returns microlitre `[µl]` volume unit.
  public static let microlitre = VolumeUnit(
    name: "microlitre",
    symbol: "µl",
    ratio: Decimal(string: "0.000001")!
  )
}

extension Int {
  /// Returns instance converted as hectolitre quantity.
  public func hectolitre() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.hectolitre)
  }
  /// Returns instance converted as litre quantity.
  public func litre() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.litre)
  }
  /// Returns instance converted as decilitre quantity.
  public func decilitre() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.decilitre)
  }
  /// Returns instance converted as centilitre quantity.
  public func centilitre() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.centilitre)
  }
  /// Returns instance converted as millilitre quantity.
  public func millilitre() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.millilitre)
  }
  /// Returns instance converted as microlitre quantity.
  public func microlitre() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.microlitre)
  }
}

extension Double {
  /// Returns instance converted as hectolitre quantity.
  public func hectolitre() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.hectolitre)
  }
  /// Returns instance converted as litre quantity.
  public func litre() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.litre)
  }
  /// Returns instance converted as decilitre quantity.
  public func decilitre() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.decilitre)
  }
  /// Returns instance converted as centilitre quantity.
  public func centilitre() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.centilitre)
  }
  /// Returns instance converted as millilitre quantity.
  public func millilitre() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.millilitre)
  }
  /// Returns instance converted as microlitre quantity.
  public func microlitre() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.microlitre)
  }
}
