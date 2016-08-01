//
//  VolumeUnitImperialTests.swift
//  MKUnits
//
//  Created by Michal Konturek on 01/08/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest

import MKUnits

class VolumeUnitImperialTests: XCTestCase {

    func test_correctness() {
        XCTAssertTrue(1.gallon() == 4.quart())
        XCTAssertTrue(1.quart() == 2.pint())
        XCTAssertTrue(1.pint() == 20.fluidounce())
//        XCTAssertTrue(1.pint() == 2.cup()) precision 5
        XCTAssertTrue(1.cup() == 284.13.millilitre())
//        XCTAssertTrue(1.cup() == 10.fluidounce()) precision 4
        XCTAssertTrue(1.fluidounce() == 8.fluidram())
//        XCTAssertTrue(1.tablespoon() == 3.teaspoon()) precision 6
        XCTAssertTrue(1.tablespoon() == 17.7581714.millilitre())
        XCTAssertTrue(1.teaspoon() == 5.91939.millilitre())
        XCTAssertTrue(1.fluidram() == 3.5516328125.millilitre())
    }
    
    func test_extension() {
        self.assert(1.gallon(), expectedAmount: 1, expectedUnit: VolumeUnit.gallon)
        self.assert(1.5.quart(), expectedAmount: 1.5, expectedUnit: VolumeUnit.quart)
        self.assert(0.00001.pint(), expectedAmount: 0.00001, expectedUnit: VolumeUnit.pint)
        self.assert(1.cup(), expectedAmount: 1, expectedUnit: VolumeUnit.cup)
        self.assert(1.fluidounce(), expectedAmount: 1, expectedUnit: VolumeUnit.fluidounce)
        self.assert(1.tablespoon(), expectedAmount: 1, expectedUnit: VolumeUnit.tablespoon)
        self.assert(1.teaspoon(), expectedAmount: 1, expectedUnit: VolumeUnit.teaspoon)
        self.assert(1.fluidram(), expectedAmount: 1, expectedUnit: VolumeUnit.fluidram)
    }
    
    func assert(item: Quantity, expectedAmount: NSNumber, expectedUnit: Unit) {
        XCTAssertEqual(item.amount, expectedAmount)
        XCTAssertEqual(item.unit, expectedUnit)
    }
}
