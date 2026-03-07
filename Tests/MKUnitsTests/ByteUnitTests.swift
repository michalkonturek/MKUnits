//
//  ByteUnitTests.swift
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

@Suite struct ByteUnitTests {

  @Test func correctness() {
    #expect(1.petabyte() == 1024.terabyte())
    #expect(1.terabyte() == 1024.gigabyte())
    #expect(1.gigabyte() == 1024.megabyte())
    #expect(1.megabyte() == 1024.kilobyte())
    #expect(1.kilobyte() == 1024.byte())

    #expect(
      1.gigabyte().converted(ByteUnit.byte)
        == Quantity(amount: 1_073_741_824, unit: ByteUnit.byte))

    #expect(
      2048.kilobyte().converted(ByteUnit.megabyte)
        == Quantity(amount: 2, unit: ByteUnit.megabyte))
  }

  @Test func fluentAPI() {
    self.assert(1.petabyte(), expectedAmount: 1, expectedUnit: ByteUnit.petabyte)
    self.assert(1.5.terabyte(), expectedAmount: 1.5, expectedUnit: ByteUnit.terabyte)
    self.assert(1.gigabyte(), expectedAmount: 1, expectedUnit: ByteUnit.gigabyte)
    self.assert(1.5.megabyte(), expectedAmount: 1.5, expectedUnit: ByteUnit.megabyte)
    self.assert(1.kilobyte(), expectedAmount: 1, expectedUnit: ByteUnit.kilobyte)
    self.assert(1.byte(), expectedAmount: 1, expectedUnit: ByteUnit.byte)
  }

  private func assert(_ item: Quantity, expectedAmount: Decimal, expectedUnit: MKUnits.Unit) {
    #expect(item.amount == expectedAmount)
    #expect(item.unit == expectedUnit)
  }
}
