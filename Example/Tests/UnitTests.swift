//
//  UnitTests.swift
//  MKUnits
//
//  Created by Michal Konturek on 29/07/2016.
//
//

import XCTest

@testable import MKUnits

class UnitTests: XCTestCase {
    let sut = TestUnit.unitA
    
    func test_init() {
        XCTAssertEqual(self.sut.name!, "Unit A")
        XCTAssertEqual(self.sut.symbol!, "A")
        XCTAssertEqual(self.sut.ratio!, NSDecimalNumber.one())
        XCTAssertTrue(self.sut.ratio!.dynamicType == NSDecimalNumber.self)
    }
    
    func test_convertFromBaseUnit() {
        let value = self.sut.convertFromBaseUnit(100)
        XCTAssertEqual(value, 100)
    }
    
    func test_convertToBaseUnit() {
        let value = self.sut.convertFromBaseUnit(100)
        XCTAssertEqual(value, 100)
    }

    // MARK: - CustomStringConvertible
    func test_description() {
        XCTAssertEqual(self.sut.description, "A")
    }
    
    // MARK: - CustomStringConvertible
    func test_isConvertible_returnsTrue() {
        let kilogram = MassUnit.kilogram
        let decagram = MassUnit.decagram
        XCTAssertTrue(kilogram.isConvertible(decagram))
    }
    
    func test_isConvertible_returnsFalse() {
        let decagram = MassUnit.decagram
        XCTAssertFalse(self.sut.isConvertible(decagram))
    }
    
    func test_convert_from_to() {
        let kilogram = MassUnit.kilogram
        let decagram = MassUnit.decagram
        let converted = kilogram.convert(1, from: kilogram, to: decagram)
        XCTAssertEqual(converted, 100)
    }
    
    // MARK: - Equatable
    func test_equatable_returnsTrue() {
        let other = TestUnit.unitA
        XCTAssertTrue(self.sut == other)
    }
    
    func test_equatable_returnsFalse() {
        let other = TestUnit.unitB
        XCTAssertFalse(self.sut == other)
    }
}

struct TestUnit: Unit {
    
    internal static var unitA: TestUnit {
        return TestUnit(name: "Unit A", symbol: "A", ratio: 1)
    }
    
    internal static var unitB: TestUnit {
        return TestUnit(name: "Unit B", symbol: "B", ratio: 10)
    }
    
    internal var name: String?
    internal var symbol: String?
    internal var ratio: NSDecimalNumber?
    
    internal init() {}
}
