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
    var sut = Quantity<TestUnit>(amount: 100, unit: TestUnit.unit)

    func test_init() {
        XCTAssertEqual(sut.amount, 100)
        XCTAssertEqual(sut.unit, TestUnit.unit)
    }
}
