//
//  VolumeUnitTests.swift
//  MKUnits
//
//  Created by Michal Konturek on 01/08/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest

import MKUnits

class VolumeUnitTests: XCTestCase {

    func test_correctness() {
        XCTAssertTrue(1.hectolitre() == 100.litre())
        XCTAssertTrue(1.litre() == 10.decilitre())
        XCTAssertTrue(1.decilitre() == 10.centilitre())
        XCTAssertTrue(1.centilitre() == 10.millilitre())
        
        XCTAssertTrue(1.millilitre() == 1000.microlitre())
        XCTAssertTrue(1.microlitre() == 0.000001.litre())
    }
    
    func test_extension() {
        self.assert(1.hectolitre(), expectedAmount: 1, expectedUnit: VolumeUnit.hectolitre)
        self.assert(1.5.litre(), expectedAmount: 1.5, expectedUnit: VolumeUnit.litre)
        self.assert(0.00001.decilitre(), expectedAmount: 0.00001, expectedUnit: VolumeUnit.decilitre)
        self.assert(1.centilitre(), expectedAmount: 1, expectedUnit: VolumeUnit.centilitre)
        
        self.assert(1.millilitre(), expectedAmount: 1, expectedUnit: VolumeUnit.millilitre)
        self.assert(1.microlitre(), expectedAmount: 1, expectedUnit: VolumeUnit.microlitre)
    }
    
    func assert(item: Quantity, expectedAmount: NSNumber, expectedUnit: Unit) {
        XCTAssertEqual(item.amount, expectedAmount)
        XCTAssertEqual(item.unit, expectedUnit)
    }
}
