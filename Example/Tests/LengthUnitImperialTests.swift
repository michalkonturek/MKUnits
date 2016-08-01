//
//  LengthUnitImperialTests.swift
//  MKUnits
//
//  Created by Michal Konturek on 01/08/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest

import MKUnits

class LengthUnitImperialTests: XCTestCase {

    func test_correctness() {
        XCTAssertTrue(1.nauticalMile() == 6080.foot())
        XCTAssertTrue(1.mile() == 5280.foot())
        XCTAssertTrue(1.furlong() == 10.chain())
        XCTAssertTrue(1.chain() == 22.yard())
        XCTAssertTrue(1.yard() == 3.foot())
        XCTAssertTrue(1.foot() == 12.inch())
    }
    
    func test_extension() {
        self.assert(1.nauticalMile(), expectedAmount: 1, expectedUnit: LengthUnit.nauticalMile)
        self.assert(1.5.mile(), expectedAmount: 1.5, expectedUnit: LengthUnit.mile)
        self.assert(0.00001.furlong(), expectedAmount: 0.00001, expectedUnit: LengthUnit.furlong)
        self.assert(1.chain(), expectedAmount: 1, expectedUnit: LengthUnit.chain)
        
        self.assert(1.yard(), expectedAmount: 1, expectedUnit: LengthUnit.yard)
        self.assert(1.foot(), expectedAmount: 1, expectedUnit: LengthUnit.foot)
        self.assert(1.inch(), expectedAmount: 1, expectedUnit: LengthUnit.inch)
    }
    
    func assert(item: Quantity, expectedAmount: NSNumber, expectedUnit: Unit) {
        XCTAssertEqual(item.amount, expectedAmount)
        XCTAssertEqual(item.unit, expectedUnit)
    }
}
