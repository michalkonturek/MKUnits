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
    let sut = TestUnit.unit
    
    func test_init() {
        XCTAssertEqual(self.sut.name!, "Unit")
        XCTAssertEqual(self.sut.symbol!, "U")
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

    func test_description() {
        XCTAssertEqual(self.sut.description, "U")
    }

    func test_equatable_returnsTrue() {
        let other = TestUnit(name: "Unit", symbol: "U", ratio: NSDecimalNumber.one())
        XCTAssertTrue(self.sut == other)
    }
    
    func test_equatable_returnsFalse() {
        let other = TestUnit(name: "UnitZ", symbol: "Z", ratio: NSDecimalNumber.one())
        XCTAssertFalse(self.sut == other)
    }
    
    func test_isConvertible_returnsTrue() {
        let kilogram = MassUnit.kilogram
        let decagram = MassUnit.decagram
        XCTAssertTrue(kilogram.isConvertible(decagram))
    }
    
    func test_isConvertible_returnsFalse() {
        let decagram = MassUnit.decagram
        XCTAssertFalse(self.sut.isConvertible(decagram))
    }
}

struct TestUnit: Unit {
    internal static var unit: TestUnit {
        return TestUnit(name: "Unit", symbol: "U", ratio: 1)
    }
    
    internal var name: String?
    internal var symbol: String?
    internal var ratio: NSDecimalNumber?
    
    internal init() {}
}
