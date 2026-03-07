//
//  TemperatureUnitTests.swift
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
import MKUnits
import Testing

@Suite struct TemperatureUnitTests {

  @Test func correctness() {
    let q = { (amount: String, unit: TemperatureUnit) in
      Quantity(amount: Decimal(string: amount)!, unit: unit)
    }

    // Celsius <-> Kelvin
    #expect(100.celsius() == q("373.15", .kelvin))
    #expect(0.celsius() == q("273.15", .kelvin))

    // Absolute zero
    #expect(0.kelvin() == q("-273.15", .celsius))
    #expect(0.kelvin() == q("-459.67", .fahrenheit))
    #expect(0.kelvin() == 0.rankine())

    // Fahrenheit <-> Celsius
    #expect(212.fahrenheit() == 100.celsius())
    #expect(32.fahrenheit() == 0.celsius())

    // Rankine <-> Kelvin
    #expect(q("491.67", .rankine) == q("273.15", .kelvin))
  }

  @Test func fluentAPI() {
    self.assert(1.kelvin(), expectedAmount: 1, expectedUnit: TemperatureUnit.kelvin)
    self.assert(1.5.celsius(), expectedAmount: 1.5, expectedUnit: TemperatureUnit.celsius)
    self.assert(1.fahrenheit(), expectedAmount: 1, expectedUnit: TemperatureUnit.fahrenheit)
    self.assert(1.rankine(), expectedAmount: 1, expectedUnit: TemperatureUnit.rankine)
  }

  private func assert(_ item: Quantity, expectedAmount: Decimal, expectedUnit: MKUnits.Unit) {
    #expect(item.amount == expectedAmount)
    #expect(item.unit == expectedUnit)
  }
}
