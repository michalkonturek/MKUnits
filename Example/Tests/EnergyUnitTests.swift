//
//  EnergyUnitTests.swift
//  MKUnits
//
//  Created by Michal Konturek on 31/07/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest

import MKUnits

class EnergyUnitTests: XCTestCase {

    func test_correctness() {
        XCTAssertTrue(1.gigajoule() == 1000.megajoule())
        XCTAssertTrue(1.megajoule() == 1000.kilojoule())
        XCTAssertTrue(1.kilojoule() == 1000.joule())
        XCTAssertTrue(1.kilocalorie() == 1000.calorie())
        
        let joule = NSDecimalNumber(string: "4186.7999408823848347407261334609")
        XCTAssertTrue(joule.joule() == 1.kilocalorie())
        
        XCTAssertTrue(1.kilocalorie()
            .converted(EnergyUnit.joule)
            .rounded(with: 1) == 4186.8.joule())
    }
    
    func test_extension() {
        self.assert(1.gigajoule(), expectedAmount: 1, expectedUnit: EnergyUnit.gigajoule)
        self.assert(1.5.megajoule(), expectedAmount: 1.5, expectedUnit: EnergyUnit.megajoule)
        self.assert(0.00001.kilojoule(), expectedAmount: 0.00001, expectedUnit: EnergyUnit.kilojoule)
        self.assert(1.joule(), expectedAmount: 1, expectedUnit: EnergyUnit.joule)
     
        self.assert(1.kilocalorie(), expectedAmount: 1, expectedUnit: EnergyUnit.kilocalorie)
        self.assert(1.calorie(), expectedAmount: 1, expectedUnit: EnergyUnit.calorie)
    }
    
    func assert(item: Quantity, expectedAmount: NSNumber, expectedUnit: Unit) {
        XCTAssertEqual(item.amount, expectedAmount)
        XCTAssertEqual(item.unit, expectedUnit)
    }
}
