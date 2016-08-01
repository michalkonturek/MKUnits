//
//  LengthUnitTests.swift
//  MKUnits
//
//  Created by Michal Konturek on 01/08/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest

@testable import MKUnits

class LengthUnitTests: XCTestCase {

    func test_correctness() {
        XCTAssertTrue(1.kilometer() == 1000.meter())
        XCTAssertTrue(1.meter() == 100.centimeter())
        XCTAssertTrue(1.centimeter() == 10.millimeter())
        XCTAssertTrue(1.millimeter() == 0.001.meter())
    }
    
    func test_extension() {
        self.assert(1.kilometer(), expectedAmount: 1, expectedUnit: LengthUnit.kilometer)
        self.assert(1.5.meter(), expectedAmount: 1.5, expectedUnit: LengthUnit.meter)
        self.assert(0.00001.centimeter(), expectedAmount: 0.00001, expectedUnit: LengthUnit.centimeter)
        self.assert(1.millimeter(), expectedAmount: 1, expectedUnit: LengthUnit.millimeter)
    }
    
    func assert(item: Quantity, expectedAmount: NSNumber, expectedUnit: Unit) {
        XCTAssertEqual(item.amount, expectedAmount)
        XCTAssertEqual(item.unit, expectedUnit)
    }
}
