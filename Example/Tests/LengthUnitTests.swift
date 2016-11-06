//
//  LengthUnitTests.swift
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

class LengthUnitTests: XCTestCase {

    func test_correctness() {
        XCTAssertTrue(1.kilometer() == 1000.meter())
        XCTAssertTrue(1.meter() == 100.centimeter())
        XCTAssertTrue(1.centimeter() == 10.millimeter())
        XCTAssertTrue(1.millimeter() == 0.001.meter())
    }
    
    func test_extension() {
        self.assert(1.kilometer(), expectedAmount: 1, expectedUnit: LengthUnit.kilometer)
        self.assert(1.5.meter(), expectedAmount: 1.5, expectedUnit: LengthUnit.meter)
        self.assert(0.00001.centimeter(), expectedAmount: 0.00001, expectedUnit: LengthUnit.centimeter)
        self.assert(1.millimeter(), expectedAmount: 1, expectedUnit: LengthUnit.millimeter)
    }
    
    func assert(_ item: Quantity, expectedAmount: NSNumber, expectedUnit: Unit) {
        XCTAssertEqual(item.amount, expectedAmount)
        XCTAssertEqual(item.unit, expectedUnit)
    }
}
