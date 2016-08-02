//
//  TimeUnitTests.swift
//  MKUnits
//
//  Copyright (c) 2016 Michal Konturek <michal.konturek@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
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
