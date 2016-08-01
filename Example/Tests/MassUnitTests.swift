//
//  MassUnitTests.swift
//  MKUnits
//
//  Created by Michal Konturek on 30/07/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest

import MKUnits

class MassUnitTests: XCTestCase {

    func test_correctness() {
        XCTAssertTrue(1.megagram() == 1000.kilogram())
        XCTAssertTrue(1.kilogram() == 100.decagram())
        XCTAssertTrue(1.decagram() == 10.gram())
        XCTAssertTrue(1.gram() == 1000.milligram())
        XCTAssertTrue(1000.milligram() == 0.001.kilogram())
    }
    
    func test_extension() {
        self.assert(1.megagram(), expectedAmount: 1, expectedUnit: MassUnit.megagram)
        self.assert(1.5.kilogram(), expectedAmount: 1.5, expectedUnit: MassUnit.kilogram)
        self.assert(0.00001.decagram(), expectedAmount: 0.00001, expectedUnit: MassUnit.decagram)
        self.assert(1.gram(), expectedAmount: 1, expectedUnit: MassUnit.gram)
        self.assert(1.milligram(), expectedAmount: 1, expectedUnit: MassUnit.milligram)
    }
    
    func assert(item: Quantity, expectedAmount: NSNumber, expectedUnit: Unit) {
        XCTAssertEqual(item.amount, expectedAmount)
        XCTAssertEqual(item.unit, expectedUnit)
    }
}
