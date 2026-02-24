//
//  EnergyUnitTests.swift
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

@Suite struct EnergyUnitTests {

  @Test func correctness() {
    #expect(1.gigajoule() == 1000.megajoule())
    #expect(1.megajoule() == 1000.kilojoule())
    #expect(1.kilojoule() == 1000.joule())
    #expect(1.kilocalorie() == 1000.calorie())

    let joule = Decimal(string: "4186.7999408823848347407261334609")!
    #expect(Quantity(amount: joule, unit: EnergyUnit.joule) == 1.kilocalorie())

    #expect(
      1.kilocalorie()
        .converted(EnergyUnit.joule)
        .rounded(1) == 4186.8.joule())
  }

  @Test func fluentAPI() {
    self.assert(1.gigajoule(), expectedAmount: 1, expectedUnit: EnergyUnit.gigajoule)
    self.assert(1.5.megajoule(), expectedAmount: 1.5, expectedUnit: EnergyUnit.megajoule)
    self.assert(0.00001.kilojoule(), expectedAmount: 0.00001, expectedUnit: EnergyUnit.kilojoule)
    self.assert(1.joule(), expectedAmount: 1, expectedUnit: EnergyUnit.joule)

    self.assert(1.kilocalorie(), expectedAmount: 1, expectedUnit: EnergyUnit.kilocalorie)
    self.assert(1.calorie(), expectedAmount: 1, expectedUnit: EnergyUnit.calorie)
  }

  private func assert(_ item: Quantity, expectedAmount: Decimal, expectedUnit: MKUnits.Unit) {
    #expect(item.amount == expectedAmount)
    #expect(item.unit == expectedUnit)
  }
}
