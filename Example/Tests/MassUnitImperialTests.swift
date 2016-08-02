//
//  MassUnitImperialTests.swift
//  MKUnits
//
//  Created by Michal Konturek on 01/08/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest

import MKUnits

class MassUnitImperialTests: XCTestCase {

    func test_correctness() {
        XCTAssertTrue(1.ton() == 2240.pound())
        XCTAssertTrue(1.hundredweight() == 112.pound())
        XCTAssertTrue(1.quarter() == 28.pound())
        XCTAssertTrue(1.pound() == 16.ounce())
        
        XCTAssertTrue(1.pound() == 256.drachm())
        XCTAssertTrue(1.pound() == 7000.grain())
        XCTAssertTrue(1.pound() == 0.45359237.kilogram())

        let stone = NSDecimalNumber(string: "1.00000050076453201349859612710600618239")
        XCTAssertTrue(stone.stone() == 14.pound())
    }
    
    func test_extension() {
        self.assert(1.ton(), expectedAmount: 1, expectedUnit: MassUnit.ton)
        self.assert(1.5.hundredweight(), expectedAmount: 1.5, expectedUnit: MassUnit.hundredweight)
        self.assert(0.00001.quarter(), expectedAmount: 0.00001, expectedUnit: MassUnit.quarter)
        self.assert(1.stone(), expectedAmount: 1, expectedUnit: MassUnit.stone)
        
        self.assert(1.pound(), expectedAmount: 1, expectedUnit: MassUnit.pound)
        self.assert(1.ounce(), expectedAmount: 1, expectedUnit: MassUnit.ounce)
        self.assert(1.drachm(), expectedAmount: 1, expectedUnit: MassUnit.drachm)
        self.assert(1.grain(), expectedAmount: 1, expectedUnit: MassUnit.grain)
    }
    
    func assert(item: Quantity, expectedAmount: NSNumber, expectedUnit: Unit) {
        XCTAssertEqual(item.amount, expectedAmount)
        XCTAssertEqual(item.unit, expectedUnit)
    }
}
