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

  private let offset: Decimal

  public init(name: String, symbol: String, ratio: Decimal, offset: Decimal) {
    self.offset = offset
    super.init(name: name, symbol: symbol, ratio: ratio)
  }

  override public func convertToBaseUnit(_ amount: Decimal) -> Decimal {
    amount * ratio + offset
  }

  override public func convertFromBaseUnit(_ amount: Decimal) -> Decimal {
    (amount - offset) / ratio
  }

  /// Returns kelvin `[K]` temperature unit.
  ///
  /// This is a base unit.
  public static let kelvin = TemperatureUnit(
    name: "kelvin",
    symbol: "K",
    ratio: 1,
    offset: 0
  )

  /// Returns celsius `[°C]` temperature unit.
  public static let celsius = TemperatureUnit(
    name: "celsius",
    symbol: "°C",
    ratio: 1,
    offset: Decimal(string: "273.15")!
  )

  /// Returns fahrenheit `[°F]` temperature unit.
  public static let fahrenheit = TemperatureUnit(
    name: "fahrenheit",
    symbol: "°F",
    ratio: Decimal(string: "5")! / Decimal(string: "9")!,
    offset: Decimal(string: "459.67")! * Decimal(string: "5")! / Decimal(string: "9")!
  )

  /// Returns rankine `[°R]` temperature unit.
  public static let rankine = TemperatureUnit(
    name: "rankine",
    symbol: "°R",
    ratio: Decimal(string: "5")! / Decimal(string: "9")!,
    offset: 0
  )
}
