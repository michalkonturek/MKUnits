//
//  QuantityTests.swift
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
import Testing

import MKUnits

@Suite struct QuantityTests {
    var sut = Quantity(amount: 100, unit: TestUnit.unitA)

    @Test func initialization() {
        #expect(self.sut.amount == 100)
        #expect(self.sut.unit == TestUnit.unitA)
    }

    @Test func converted() {
        let converted = self.sut.converted(TestUnit.unitB)
        #expect(converted.amount == 10)
        #expect(converted.unit == TestUnit.unitB)
    }

    @Test func negative() {
        let target = self.sut.negative()
        #expect(target.amount == -100)
        #expect(target.unit == TestUnit.unitA)
    }

    @Test func rounded() {
        var target = Quantity(amount: 1.2, unit: TestUnit.unitA)
        var rounded = target.rounded(1)
        #expect(rounded.amount == 1.2)
        #expect(rounded.unit == TestUnit.unitA)

        target = Quantity(amount: 1.21, unit: TestUnit.unitA)
        rounded = target.rounded(1)
        #expect(rounded.amount == 1.2)
        #expect(rounded.unit == TestUnit.unitA)

        target = Quantity(amount: 1.24, unit: TestUnit.unitA)
        rounded = target.rounded(1)
        #expect(rounded.amount == 1.2)
        #expect(rounded.unit == TestUnit.unitA)

        target = Quantity(amount: 1.25, unit: TestUnit.unitA)
        rounded = target.rounded(1)
        #expect(rounded.amount == 1.3)
        #expect(rounded.unit == TestUnit.unitA)

        target = Quantity(amount: 1.2, unit: TestUnit.unitA)
        rounded = target.rounded(1)
        #expect(rounded.amount == 1.2)
        #expect(rounded.unit == TestUnit.unitA)
    }

    // MARK: - Arithmetic Operators

    @Test func operator_addition() {
        var other = Quantity(amount: 100, unit: TestUnit.unitA)
        var target = self.sut + other
        #expect(target.amount == 200)
        #expect(target.unit == TestUnit.unitA)

        other = Quantity(amount: 100, unit: TestUnit.unitB)
        target = self.sut + other
        #expect(target.amount == 1100)
        #expect(target.unit == TestUnit.unitA)
    }

    @Test func operator_subtraction() {
        var other = Quantity(amount: 60, unit: TestUnit.unitA)
        var target = self.sut - other
        #expect(target.amount == 40)
        #expect(target.unit == TestUnit.unitA)

        other = Quantity(amount: 20, unit: TestUnit.unitB)
        target = self.sut - other
        #expect(target.amount == -100)
        #expect(target.unit == TestUnit.unitA)
    }

    @Test func operator_multiplication() {
        var target = self.sut * 2
        #expect(target.amount == 200)
        #expect(target.unit == TestUnit.unitA)

        target = 1.5 * self.sut
        #expect(target.amount == 150)
        #expect(target.unit == TestUnit.unitA)

        target = self.sut * Decimal(3)
        #expect(target.amount == 300)
        #expect(target.unit == TestUnit.unitA)
    }

    @Test func operator_multiplication_reversed() {
        var target = 2 * self.sut
        #expect(target.amount == 200)
        #expect(target.unit == TestUnit.unitA)

        target = 1.5 * self.sut
        #expect(target.amount == 150)
        #expect(target.unit == TestUnit.unitA)

        target = Decimal(3) * self.sut
        #expect(target.amount == 300)
        #expect(target.unit == TestUnit.unitA)
    }

    // MARK: - CustomStringConvertible

    @Test func customDescription() {
        #expect(self.sut.description == "100 A")
    }

    // MARK: - Equatable

    @Test func equatable_returnsTrue() {
        var other = Quantity(amount: 100, unit: TestUnit.unitA)
        #expect(self.sut == other)

        other = Quantity(amount: 10, unit: TestUnit.unitB)
        #expect(self.sut == other)
    }

    @Test func equatable_returnsFalse() {
        var other = Quantity(amount: 100, unit: TestUnit.unitB)
        #expect(!(self.sut == other))

        other = Quantity(amount: 10, unit: TestUnit.unitA)
        #expect(!(self.sut == other))
    }

    // MARK: - Comparable

    @Test func comparable_lessThan_returnsTrue() {
        var other = Quantity(amount: 200, unit: TestUnit.unitA)
        #expect(self.sut < other)

        other = Quantity(amount: 11, unit: TestUnit.unitB)
        #expect(self.sut < other)
    }

    @Test func comparable_lessThan_returnsFalse() {
        var other = Quantity(amount: 10, unit: TestUnit.unitA)
        #expect(!(self.sut < other))

        other = Quantity(amount: 100, unit: TestUnit.unitA)
        #expect(!(self.sut < other))

        other = Quantity(amount: 1, unit: TestUnit.unitB)
        #expect(!(self.sut < other))
    }

    @Test func comparable_lessThanOrEqual_returnsTrue() {
        var other = Quantity(amount: 100, unit: TestUnit.unitA)
        #expect(self.sut <= other)

        other = Quantity(amount: 200, unit: TestUnit.unitA)
        #expect(self.sut <= other)

        other = Quantity(amount: 10, unit: TestUnit.unitB)
        #expect(self.sut <= other)

        other = Quantity(amount: 11, unit: TestUnit.unitB)
        #expect(self.sut <= other)
    }

    @Test func comparable_lessThanOrEqual_returnsFalse() {
        var other = Quantity(amount: 20, unit: TestUnit.unitA)
        #expect(!(self.sut <= other))

        other = Quantity(amount: 1, unit: TestUnit.unitB)
        #expect(!(self.sut <= other))
    }

    @Test func comparable_greaterThan_returnsTrue() {
        var other = Quantity(amount: 10, unit: TestUnit.unitA)
        #expect(self.sut > other)

        other = Quantity(amount: 1, unit: TestUnit.unitB)
        #expect(self.sut > other)
    }

    @Test func comparable_greaterThan_returnsFalse() {
        var other = Quantity(amount: 200, unit: TestUnit.unitA)
        #expect(!(self.sut > other))

        other = Quantity(amount: 100, unit: TestUnit.unitA)
        #expect(!(self.sut > other))

        other = Quantity(amount: 11, unit: TestUnit.unitB)
        #expect(!(self.sut > other))
    }

    @Test func comparable_greaterThanOrEqual_returnsTrue() {
        var other = Quantity(amount: 10, unit: TestUnit.unitA)
        #expect(self.sut >= other)

        other = Quantity(amount: 100, unit: TestUnit.unitA)
        #expect(self.sut >= other)

        other = Quantity(amount: 10, unit: TestUnit.unitB)
        #expect(self.sut >= other)

        other = Quantity(amount: 9, unit: TestUnit.unitB)
        #expect(self.sut >= other)
    }

    @Test func comparable_greaterThanOrEqual_returnsFalse() {
        var other = Quantity(amount: 200, unit: TestUnit.unitA)
        #expect(!(self.sut >= other))

        other = Quantity(amount: 11, unit: TestUnit.unitB)
        #expect(!(self.sut >= other))
    }
}
