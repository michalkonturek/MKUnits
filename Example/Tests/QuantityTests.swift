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

import XCTest

import MKUnits

class QuantityTests: XCTestCase {
    var sut = Quantity(amount: 100, unit: TestUnit.unitA)

    func test_init() {
        XCTAssertEqual(self.sut.amount, 100)
        XCTAssertEqual(self.sut.unit, TestUnit.unitA)
    }
    
    func test_converted() {
        let converted = self.sut.converted(TestUnit.unitB)
        XCTAssertEqual(converted.amount, 10)
        XCTAssertTrue(converted.unit == TestUnit.unitB)
    }
    
    func test_negative() {
        let target = self.sut.negative()
        XCTAssertEqual(target.amount, -100)
        XCTAssertEqual(target.unit, TestUnit.unitA)
    }
    
    func test_rounded() {
        var target = Quantity(amount: 1.2, unit: TestUnit.unitA)
        var rounded = target.rounded(1)
        XCTAssertEqual(rounded.amount, 1.2)
        XCTAssertEqual(rounded.unit, TestUnit.unitA)
        
        target = Quantity(amount: 1.21, unit: TestUnit.unitA)
        rounded = target.rounded(1)
        XCTAssertEqual(rounded.amount, 1.2)
        XCTAssertEqual(rounded.unit, TestUnit.unitA)
        
        target = Quantity(amount: 1.24, unit: TestUnit.unitA)
        rounded = target.rounded(1)
        XCTAssertEqual(rounded.amount, 1.2)
        XCTAssertEqual(rounded.unit, TestUnit.unitA)
        
        target = Quantity(amount: 1.25, unit: TestUnit.unitA)
        rounded = target.rounded(1)
        XCTAssertEqual(rounded.amount, 1.3)
        XCTAssertEqual(rounded.unit, TestUnit.unitA)
        
        target = Quantity(amount: 1.2, unit: TestUnit.unitA)
        rounded = target.rounded(1)
        XCTAssertEqual(rounded.amount, 1.2)
        XCTAssertEqual(rounded.unit, TestUnit.unitA)
    }
    
    // MARK: - Arithmetic Operators
    
    func test_operator_addition() {
        var other = Quantity(amount: 100, unit: TestUnit.unitA)
        var target = self.sut + other
        XCTAssertEqual(target.amount, 200)
        XCTAssertEqual(target.unit, TestUnit.unitA)
        
        other = Quantity(amount: 100, unit: TestUnit.unitB)
        target = self.sut + other
        XCTAssertEqual(target.amount, 1100)
        XCTAssertEqual(target.unit, TestUnit.unitA)
    }
    
    func test_operator_subtraction() {
        var other = Quantity(amount: 60, unit: TestUnit.unitA)
        var target = self.sut - other
        XCTAssertEqual(target.amount, 40)
        XCTAssertEqual(target.unit, TestUnit.unitA)
        
        other = Quantity(amount: 20, unit: TestUnit.unitB)
        target = self.sut - other
        XCTAssertEqual(target.amount, -100)
        XCTAssertEqual(target.unit, TestUnit.unitA)
    }
    
    func test_operator_multiplication() {
        var target = self.sut * 2
        XCTAssertEqual(target.amount, 200)
        XCTAssertEqual(target.unit, TestUnit.unitA)
        
        target = 1.5 * self.sut
        XCTAssertEqual(target.amount, 150)
        XCTAssertEqual(target.unit, TestUnit.unitA)
        
        target = self.sut * NSNumber(integer: 3)
        XCTAssertEqual(target.amount, 300)
        XCTAssertEqual(target.unit, TestUnit.unitA)
    }
    
    func test_operator_multiplication_reversed() {
        var target = 2 * self.sut
        XCTAssertEqual(target.amount, 200)
        XCTAssertEqual(target.unit, TestUnit.unitA)
        
        target = 1.5 * self.sut
        XCTAssertEqual(target.amount, 150)
        XCTAssertEqual(target.unit, TestUnit.unitA)
        
        target = NSNumber(integer: 3) * self.sut
        XCTAssertEqual(target.amount, 300)
        XCTAssertEqual(target.unit, TestUnit.unitA)
    }
    
    // MARK: - CustomStringConvertible
    
    func test_description() {
        XCTAssertEqual(self.sut.description, "100 A")
    }
    
    // MARK: - Equatable
    
    func test_equatable_returnsTrue() {
        var other = Quantity(amount: 100, unit: TestUnit.unitA)
        XCTAssertTrue(self.sut == other)
        
        other = Quantity(amount: 10, unit: TestUnit.unitB)
        XCTAssertTrue(self.sut == other)
    }
    
    func test_equatable_returnsFalse() {
        var other = Quantity(amount: 100, unit: TestUnit.unitB)
        XCTAssertFalse(self.sut == other)
        
        other = Quantity(amount: 10, unit: TestUnit.unitA)
        XCTAssertFalse(self.sut == other)
    }
    
    // MARK: - Comparable
    
    func test_comparable_lessThan_returnsTrue() {
        var other = Quantity(amount: 200, unit: TestUnit.unitA)
        XCTAssertTrue(self.sut < other)

        other = Quantity(amount: 11, unit: TestUnit.unitB)
        XCTAssertTrue(self.sut < other)
    }
    
    func test_comparable_lessThan_returnsFalse() {
        var other = Quantity(amount: 10, unit: TestUnit.unitA)
        XCTAssertFalse(self.sut < other)
        
        other = Quantity(amount: 100, unit: TestUnit.unitA)
        XCTAssertFalse(self.sut < other)
        
        other = Quantity(amount: 1, unit: TestUnit.unitB)
        XCTAssertFalse(self.sut < other)
    }
    
    func test_comparable_lessThanOrEqual_returnsTrue() {
        var other = Quantity(amount: 100, unit: TestUnit.unitA)
        XCTAssertTrue(self.sut <= other)
        
        other = Quantity(amount: 200, unit: TestUnit.unitA)
        XCTAssertTrue(self.sut <= other)
        
        other = Quantity(amount: 10, unit: TestUnit.unitB)
        XCTAssertTrue(self.sut <= other)
        
        other = Quantity(amount: 11, unit: TestUnit.unitB)
        XCTAssertTrue(self.sut <= other)
    }
    
    func test_comparable_lessThanOrEqual_returnsFalse() {
        var other = Quantity(amount: 20, unit: TestUnit.unitA)
        XCTAssertFalse(self.sut <= other)
        
        other = Quantity(amount: 1, unit: TestUnit.unitB)
        XCTAssertFalse(self.sut <= other)
    }
    
    func test_comparable_greaterThan_returnsTrue() {
        var other = Quantity(amount: 10, unit: TestUnit.unitA)
        XCTAssertTrue(self.sut > other)
        
        other = Quantity(amount: 1, unit: TestUnit.unitB)
        XCTAssertTrue(self.sut > other)
    }
    
    func test_comparable_greaterThan_returnsFalse() {
        var other = Quantity(amount: 200, unit: TestUnit.unitA)
        XCTAssertFalse(self.sut > other)
        
        other = Quantity(amount: 100, unit: TestUnit.unitA)
        XCTAssertFalse(self.sut > other)
        
        other = Quantity(amount: 11, unit: TestUnit.unitB)
        XCTAssertFalse(self.sut > other)
    }
    
    func test_comparable_greaterThanOrEqual_returnsTrue() {
        var other = Quantity(amount: 10, unit: TestUnit.unitA)
        XCTAssertTrue(self.sut >= other)
        
        other = Quantity(amount: 100, unit: TestUnit.unitA)
        XCTAssertTrue(self.sut >= other)
        
        other = Quantity(amount: 10, unit: TestUnit.unitB)
        XCTAssertTrue(self.sut >= other)
        
        other = Quantity(amount: 9, unit: TestUnit.unitB)
        XCTAssertTrue(self.sut >= other)
    }
    
    func test_comparable_greaterThanOrEqual_returnsFalse() {
        var other = Quantity(amount: 200, unit: TestUnit.unitA)
        XCTAssertFalse(self.sut >= other)
        
        other = Quantity(amount: 11, unit: TestUnit.unitB)
        XCTAssertFalse(self.sut >= other)
    }
}
