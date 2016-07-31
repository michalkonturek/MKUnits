//
//  QuantityTests.swift
//  MKUnits
//
//  Created by Michal Konturek on 29/07/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest

@testable import MKUnits

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
        let other = Quantity(amount: 100, unit: TestUnit.unitA)
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
