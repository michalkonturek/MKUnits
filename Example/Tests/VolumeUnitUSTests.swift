//
//  VolumeUnitUSTests.swift
//  MKUnits
//
//  Created by Michal Konturek on 01/08/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest

import MKUnits

class VolumeUnitUSTests: XCTestCase {

    func test_correctness() {
        XCTAssertTrue(1.us_hogshead() == 63.us_gallon())
        XCTAssertTrue(1.us_hogshead() == 2.us_barrel())
        XCTAssertTrue(1.us_barrel() == 31.5.us_gallon())
        XCTAssertTrue(1.us_gallon() == 4.us_quart())
        XCTAssertTrue(1.us_quart() == 2.us_pint())
        
        XCTAssertTrue(1.us_pint() == 2.us_cup())
        XCTAssertTrue(1.us_cup() == 2.us_gill())
        XCTAssertTrue(1.us_gill() == 4.us_fluidounce())
        XCTAssertTrue(1.us_fluidounce() == 2.us_tablespoon())
        
        XCTAssertTrue(1.us_tablespoon() == 3.us_teaspoon())
        XCTAssertTrue(1.us_tablespoon() == 4.us_fluidram())
        XCTAssertTrue(1.us_teaspoon() == 80.us_minim())
        XCTAssertTrue(1.us_fluidram() == 60.us_minim())
        XCTAssertTrue(1.us_minim() == 0.061611519921875.millilitre())
    }
    
    func test_extension() {
        self.assert(1.us_hogshead(), expectedAmount: 1, expectedUnit: VolumeUnit.us_hogshead)
        self.assert(1.us_barrel(), expectedAmount: 1, expectedUnit: VolumeUnit.us_barrel)
        self.assert(1.us_gallon(), expectedAmount: 1, expectedUnit: VolumeUnit.us_gallon)
        self.assert(1.5.us_quart(), expectedAmount: 1.5, expectedUnit: VolumeUnit.us_quart)
        
        self.assert(0.00001.us_pint(), expectedAmount: 0.00001, expectedUnit: VolumeUnit.us_pint)
        self.assert(1.us_cup(), expectedAmount: 1, expectedUnit: VolumeUnit.us_cup)
        self.assert(1.us_gill(), expectedAmount: 1, expectedUnit: VolumeUnit.us_gill)
        self.assert(1.us_fluidounce(), expectedAmount: 1, expectedUnit: VolumeUnit.us_fluidounce)
        
        self.assert(1.us_tablespoon(), expectedAmount: 1, expectedUnit: VolumeUnit.us_tablespoon)
        self.assert(1.us_teaspoon(), expectedAmount: 1, expectedUnit: VolumeUnit.us_teaspoon)
        self.assert(1.us_fluidram(), expectedAmount: 1, expectedUnit: VolumeUnit.us_fluidram)
        self.assert(1.us_minim(), expectedAmount: 1, expectedUnit: VolumeUnit.us_minim)
    }
    
    func assert(item: Quantity, expectedAmount: NSNumber, expectedUnit: Unit) {
        XCTAssertEqual(item.amount, expectedAmount)
        XCTAssertEqual(item.unit, expectedUnit)
    }
}
