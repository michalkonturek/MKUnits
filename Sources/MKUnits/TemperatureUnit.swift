//
//  TemperatureUnit.swift
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

public final class TemperatureUnit: Unit, @unchecked Sendable {

  private let numerator: Decimal
  private let denominator: Decimal
  private let offset: Decimal

  /// Creates a temperature unit.
  ///
  /// Conversion to Kelvin: `K = (amount + offset) * numerator / denominator`
  /// Conversion from Kelvin: `amount = K * denominator / numerator - offset`
  public init(
    name: String, symbol: String,
    numerator: Decimal, denominator: Decimal,
    offset: Decimal
  ) {
    self.numerator = numerator
    self.denominator = denominator
    self.offset = offset
    super.init(name: name, symbol: symbol, ratio: numerator / denominator)
  }

  override public func convertToBaseUnit(_ amount: Decimal) -> Decimal {
    (amount + offset) * numerator / denominator
  }

  override public func convertFromBaseUnit(_ amount: Decimal) -> Decimal {
    amount * denominator / numerator - offset
  }

  /// Returns kelvin `[K]` temperature unit.
  ///
  /// This is a base unit.
  public static let kelvin = TemperatureUnit(
    name: "kelvin",
    symbol: "K",
    numerator: 1,
    denominator: 1,
    offset: 0
  )

  /// Returns celsius `[°C]` temperature unit.
  ///
  /// K = C + 273.15
  public static let celsius = TemperatureUnit(
    name: "celsius",
    symbol: "°C",
    numerator: 1,
    denominator: 1,
    offset: Decimal(string: "273.15")!
  )

  /// Returns fahrenheit `[°F]` temperature unit.
  ///
  /// K = (F + 459.67) × 5/9
  public static let fahrenheit = TemperatureUnit(
    name: "fahrenheit",
    symbol: "°F",
    numerator: 5,
    denominator: 9,
    offset: Decimal(string: "459.67")!
  )

  /// Returns rankine `[°R]` temperature unit.
  ///
  /// K = R × 5/9
  public static let rankine = TemperatureUnit(
    name: "rankine",
    symbol: "°R",
    numerator: 5,
    denominator: 9,
    offset: 0
  )
}
