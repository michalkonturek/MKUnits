//
//  VolumeUnit+US.swift
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

  /// Returns US hogshead `[US hhd]` volume unit.
  public static let us_hogshead = VolumeUnit(
    name: "US hogshead",
    symbol: "US hhd",
    ratio: Decimal(string: "238.480942392")!
  )

  /// Returns US barrel `[US bbl]` volume unit.
  public static let us_barrel = VolumeUnit(
    name: "US barrel",
    symbol: "US bbl",
    ratio: Decimal(string: "119.240471196")!
  )

  /// Returns US gallon `[US gal]` volume unit.
  public static let us_gallon = VolumeUnit(
    name: "US gallon",
    symbol: "US gal",
    ratio: Decimal(string: "3.785411784")!
  )

  /// Returns US quart `[US qt]` volume unit.
  public static let us_quart = VolumeUnit(
    name: "US quart",
    symbol: "US qt",
    ratio: Decimal(string: "0.946352946")!
  )

  /// Returns US pint `[US pt]` volume unit.
  public static let us_pint = VolumeUnit(
    name: "US pint",
    symbol: "US pt",
    ratio: Decimal(string: "0.473176473")!
  )

  /// Returns US cup `[US cp]` volume unit.
  public static let us_cup = VolumeUnit(
    name: "US cup",
    symbol: "US cp",
    ratio: Decimal(string: "0.2365882365")!
  )

  /// Returns US gill `[US gi]` volume unit.
  public static let us_gill = VolumeUnit(
    name: "US gill",
    symbol: "US gi",
    ratio: Decimal(string: "0.11829411825")!
  )

  /// Returns US fluid ounce `[US fl oz]` volume unit.
  public static let us_fluidounce = VolumeUnit(
    name: "US fluid ounce",
    symbol: "US fl oz",
    ratio: Decimal(string: "0.0295735295625")!
  )

  /// Returns US tablespoon `[US tbsp]` volume unit.
  public static let us_tablespoon = VolumeUnit(
    name: "US tablespoon",
    symbol: "US tbsp",
    ratio: Decimal(string: "0.01478676478125")!
  )

  /// Returns US teaspoon `[US tsp]` volume unit.
  public static let us_teaspoon = VolumeUnit(
    name: "US teaspoon",
    symbol: "US tsp",
    ratio: Decimal(string: "0.00492892159375")!
  )

  /// Returns US fluidram `[US fl dr]` volume unit.
  public static let us_fluidram = VolumeUnit(
    name: "US fluidram",
    symbol: "US fl dr",
    ratio: Decimal(string: "0.0036966911953125")!
  )

  /// Returns US minim `[US min]` volume unit.
  public static let us_minim = VolumeUnit(
    name: "US minim",
    symbol: "US min",
    ratio: Decimal(string: "0.000061611519921875")!
  )
}

extension Int {
  /// Returns instance converted as US hogshead quantity.
  public func us_hogshead() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.us_hogshead)
  }
  /// Returns instance converted as US barrel quantity.
  public func us_barrel() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.us_barrel)
  }
  /// Returns instance converted as US gallon quantity.
  public func us_gallon() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.us_gallon)
  }
  /// Returns instance converted as US quart quantity.
  public func us_quart() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.us_quart)
  }
  /// Returns instance converted as US pint quantity.
  public func us_pint() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.us_pint)
  }
  /// Returns instance converted as US cup quantity.
  public func us_cup() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.us_cup)
  }
  /// Returns instance converted as US gill quantity.
  public func us_gill() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.us_gill)
  }
  /// Returns instance converted as US fluidounce quantity.
  public func us_fluidounce() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.us_fluidounce)
  }
  /// Returns instance converted as US tablespoon quantity.
  public func us_tablespoon() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.us_tablespoon)
  }
  /// Returns instance converted as US teaspoon quantity.
  public func us_teaspoon() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.us_teaspoon)
  }
  /// Returns instance converted as US fluidram quantity.
  public func us_fluidram() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.us_fluidram)
  }
  /// Returns instance converted as US minim quantity.
  public func us_minim() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.us_minim)
  }
}

extension Double {
  /// Returns instance converted as US hogshead quantity.
  public func us_hogshead() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.us_hogshead)
  }
  /// Returns instance converted as US barrel quantity.
  public func us_barrel() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.us_barrel)
  }
  /// Returns instance converted as US gallon quantity.
  public func us_gallon() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.us_gallon)
  }
  /// Returns instance converted as US quart quantity.
  public func us_quart() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.us_quart)
  }
  /// Returns instance converted as US pint quantity.
  public func us_pint() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.us_pint)
  }
  /// Returns instance converted as US cup quantity.
  public func us_cup() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.us_cup)
  }
  /// Returns instance converted as US gill quantity.
  public func us_gill() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.us_gill)
  }
  /// Returns instance converted as US fluidounce quantity.
  public func us_fluidounce() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.us_fluidounce)
  }
  /// Returns instance converted as US tablespoon quantity.
  public func us_tablespoon() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.us_tablespoon)
  }
  /// Returns instance converted as US teaspoon quantity.
  public func us_teaspoon() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.us_teaspoon)
  }
  /// Returns instance converted as US fluidram quantity.
  public func us_fluidram() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.us_fluidram)
  }
  /// Returns instance converted as US minim quantity.
  public func us_minim() -> Quantity {
    Quantity(amount: Decimal(self), unit: VolumeUnit.us_minim)
  }
}
