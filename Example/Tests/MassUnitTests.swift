//
//  MassUnitTests.swift
//  MKUnits
//
//  Created by Michal Konturek on 30/07/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest

@testable import MKUnits

class MassUnitTests: XCTestCase {

    func test_megagram() {
        let target = MassUnit.megagram
        let converted = target.convert(1, to: MassUnit.kilogram)
        XCTAssertEqual(converted, 1000)
    }
    
    func test_kilogram() {
        let target = MassUnit.kilogram
        let converted = target.convert(1, to: MassUnit.gram)
        XCTAssertEqual(converted, 1000)
    }
    
    func test_decagram() {
        let target = MassUnit.decagram
        let converted = target.convert(1, to: MassUnit.gram)
        XCTAssertEqual(converted, 10)
    }

    func test_gram() {
        let target = MassUnit.gram
        let converted = target.convert(1, to: MassUnit.milligram)
        XCTAssertEqual(converted, 1000)
    }
    
    func test_milligram() {
        let target = MassUnit.milligram
        let converted = target.convert(1000, to: MassUnit.kilogram)
        XCTAssertEqual(converted, 0.001)
    }
    
    func test_extension_int() {
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
