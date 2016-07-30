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
        XCTAssertTrue(self.sut.unit == TestUnit.unitA)
    }
}
