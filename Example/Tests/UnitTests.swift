//
//  UnitTests.swift
//  MKUnits
//
//  Created by Michal Konturek on 29/07/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest

@testable import MKUnits

class UnitTests: XCTestCase {
    let sut: Unit = Unit(name: "Unit", symbol: "U", ratio: NSDecimalNumber.one())

    override func setUp() {
        super.setUp()
    }
    
    func test_init() {
        XCTAssertEqual(sut.name, "Unit")
        XCTAssertEqual(sut.symbol, "U")
        XCTAssertEqual(sut.ratio, NSDecimalNumber.one())
    }
    
    func test_convertFromBaseUnit() {
        let value = self.sut.convertFromBaseUnit(100)
        XCTAssertEqual(value, 100)
    }
    
    func test_convertToBaseUnit() {
        let value = self.sut.convertFromBaseUnit(100)
        XCTAssertEqual(value, 100)
        print(sut)
    }

    func test_description() {
        XCTAssertEqual(self.sut.description, "U")
    }

    func test_equatable_returnsTrue() {
        let other = Unit(name: "Unit", symbol: "U", ratio: NSDecimalNumber.one())
        XCTAssertTrue(self.sut == other)
    }
    
    func test_equatable_returnsFalse() {
        let other = Unit(name: "Zunit", symbol: "Z", ratio: NSDecimalNumber.one())
        XCTAssertFalse(self.sut == other)
    }
}
