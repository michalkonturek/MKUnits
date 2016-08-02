//
//  LengthUnitImperialTests.swift
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
