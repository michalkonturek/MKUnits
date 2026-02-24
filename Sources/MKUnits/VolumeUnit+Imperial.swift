//
//  VolumeUnit+Imperial.swift
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

extension VolumeUnit {

  /// Returns gallon `[gal]` volume unit.
  public static let gallon = VolumeUnit(
    name: "gallon",
    symbol: "gal",
    ratio: Decimal(string: "4.54609")!
  )

  /// Returns quart `[qt]` volume unit.
  public static let quart = VolumeUnit(
    name: "quart",
    symbol: "qt",
    ratio: Decimal(string: "1.1365225")!
  )

  /// Returns pint `[pt]` volume unit.
  public static let pint = VolumeUnit(
    name: "pint",
    symbol: "pt",
    ratio: Decimal(string: "0.56826125")!
  )

  /// Returns cup `[cp]` volume unit.
  public static let cup = VolumeUnit(
    name: "cup",
    symbol: "cp",
    ratio: Decimal(string: "0.28413")!
  )

  /// Returns fluidounce `[fl oz]` volume unit.
  public static let fluidounce = VolumeUnit(
    name: "fluid ounce",
    symbol: "fl oz",
    ratio: Decimal(string: "0.0284130625")!
  )

  /// Returns tablespoon `[tbsp]` volume unit.
  public static let tablespoon = VolumeUnit(
    name: "tablespoon",
    symbol: "tbsp",
    ratio: Decimal(string: "0.0177581714")!
  )

  /// Returns teaspoon `[tsp]` volume unit.
  public static let teaspoon = VolumeUnit(
    name: "teaspoon",
    symbol: "tsp",
    ratio: Decimal(string: "0.00591939")!
  )

  /// Returns fluidram `[fl dr]` volume unit.
  public static let fluidram = VolumeUnit(
    name: "fluidram",
    symbol: "fl dr",
    ratio: Decimal(string: "0.0035516328125")!
  )
}

extension Int {
  /// Returns instance converted as gallon quantity.
  public func gallon() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.gallon)
  }
  /// Returns instance converted as quart quantity.
  public func quart() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.quart)
  }
  /// Returns instance converted as pint quantity.
  public func pint() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.pint)
  }
  /// Returns instance converted as cup quantity.
  public func cup() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.cup)
  }
  /// Returns instance converted as fluidounce quantity.
  public func fluidounce() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.fluidounce)
  }
  /// Returns instance converted as tablespoon quantity.
  public func tablespoon() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.tablespoon)
  }
  /// Returns instance converted as teaspoon quantity.
  public func teaspoon() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.teaspoon)
  }
  /// Returns instance converted as fluidram quantity.
  public func fluidram() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.fluidram)
  }
}

extension Double {
  /// Returns instance converted as gallon quantity.
  public func gallon() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.gallon)
  }
  /// Returns instance converted as quart quantity.
  public func quart() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.quart)
  }
  /// Returns instance converted as pint quantity.
  public func pint() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.pint)
  }
  /// Returns instance converted as cup quantity.
  public func cup() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.cup)
  }
  /// Returns instance converted as fluidounce quantity.
  public func fluidounce() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.fluidounce)
  }
  /// Returns instance converted as tablespoon quantity.
  public func tablespoon() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.tablespoon)
  }
  /// Returns instance converted as teaspoon quantity.
  public func teaspoon() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.teaspoon)
  }
  /// Returns instance converted as fluidram quantity.
  public func fluidram() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.fluidram)
  }
}
