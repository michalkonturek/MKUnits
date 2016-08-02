//
//  TimeUnitTests.swift
//  MKUnits
//
//  Created by Michal Konturek on 31/07/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest

import MKUnits

class TimeUnitTests: XCTestCase {

    func test_correctness() {
        XCTAssertTrue(1.century() == 10.decade())
        XCTAssertTrue(1.century() == 100.year())        
        XCTAssertTrue(1.decade() == 10.year())
        XCTAssertTrue(1.year() == 365.25.day())
        
        XCTAssertTrue(1.month() == 30.day())
        XCTAssertTrue(1.week() == 7.day())
        XCTAssertTrue(1.day() == 24.hour())
        XCTAssertTrue(1.hour() == 60.minute())
        
        XCTAssertTrue(1.minute() == 60.second())
        XCTAssertTrue(1.second() == 1000.millisecond())
        XCTAssertTrue(1.millisecond() == 1000.microsecond())
        XCTAssertTrue(1.microsecond() == 1000.nanosecond())
    }
    
    func test_extension() {
        self.assert(1.century(), expectedAmount: 1, expectedUnit: TimeUnit.century)
        self.assert(1.5.decade(), expectedAmount: 1.5, expectedUnit: TimeUnit.decade)
        self.assert(0.00001.year(), expectedAmount: 0.00001, expectedUnit: TimeUnit.year)
        self.assert(1.month(), expectedAmount: 1, expectedUnit: TimeUnit.month)
        
        self.assert(1.week(), expectedAmount: 1, expectedUnit: TimeUnit.week)
        self.assert(1.day(), expectedAmount: 1, expectedUnit: TimeUnit.day)
        self.assert(1.hour(), expectedAmount: 1, expectedUnit: TimeUnit.hour)
        self.assert(1.minute(), expectedAmount: 1, expectedUnit: TimeUnit.minute)
        
        self.assert(1.second(), expectedAmount: 1, expectedUnit: TimeUnit.second)
        self.assert(1.millisecond(), expectedAmount: 1, expectedUnit: TimeUnit.millisecond)
        self.assert(1.microsecond(), expectedAmount: 1, expectedUnit: TimeUnit.microsecond)
        self.assert(1.nanosecond(), expectedAmount: 1, expectedUnit: TimeUnit.nanosecond)
    }
    
    func assert(item: Quantity, expectedAmount: NSNumber, expectedUnit: Unit) {
        XCTAssertEqual(item.amount, expectedAmount)
        XCTAssertEqual(item.unit, expectedUnit)
    }
}
