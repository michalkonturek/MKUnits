//
//  TemperatureUnit+Extensions.swift
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

extension Int {
  /// Returns instance converted as kelvin quantity.
  public func kelvin() -> Quantity {
    Quantity(amount: Decimal(self), unit: TemperatureUnit.kelvin)
  }
  /// Returns instance converted as celsius quantity.
  public func celsius() -> Quantity {
    Quantity(amount: Decimal(self), unit: TemperatureUnit.celsius)
  }
  /// Returns instance converted as fahrenheit quantity.
  public func fahrenheit() -> Quantity {
    Quantity(amount: Decimal(self), unit: TemperatureUnit.fahrenheit)
  }
  /// Returns instance converted as rankine quantity.
  public func rankine() -> Quantity {
    Quantity(amount: Decimal(self), unit: TemperatureUnit.rankine)
  }
}

extension Double {
  /// Returns instance converted as kelvin quantity.
  public func kelvin() -> Quantity {
    Quantity(amount: Decimal(self), unit: TemperatureUnit.kelvin)
  }
  /// Returns instance converted as celsius quantity.
  public func celsius() -> Quantity {
    Quantity(amount: Decimal(self), unit: TemperatureUnit.celsius)
  }
  /// Returns instance converted as fahrenheit quantity.
  public func fahrenheit() -> Quantity {
    Quantity(amount: Decimal(self), unit: TemperatureUnit.fahrenheit)
  }
  /// Returns instance converted as rankine quantity.
  public func rankine() -> Quantity {
    Quantity(amount: Decimal(self), unit: TemperatureUnit.rankine)
  }
}
