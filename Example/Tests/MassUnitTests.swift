//
//  MassUnitTests.swift
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

class MassUnitTests: XCTestCase {

    func test_correctness() {
        XCTAssertTrue(1.megagram() == 1000.kilogram())
        XCTAssertTrue(1.kilogram() == 100.decagram())
        XCTAssertTrue(1.decagram() == 10.gram())
        XCTAssertTrue(1.gram() == 1000.milligram())
        XCTAssertTrue(1000.milligram() == 0.001.kilogram())
    }
    
    func test_extension() {
        self.assert(1.megagram(), expectedAmount: 1, expectedUnit: MassUnit.megagram)
        self.assert(1.5.kilogram(), expectedAmount: 1.5, expectedUnit: MassUnit.kilogram)
        self.assert(0.00001.decagram(), expectedAmount: 0.00001, expectedUnit: MassUnit.decagram)
        self.assert(1.gram(), expectedAmount: 1, expectedUnit: MassUnit.gram)
        self.assert(1.milligram(), expectedAmount: 1, expectedUnit: MassUnit.milligram)
    }
    
    func assert(_ item: Quantity, expectedAmount: NSNumber, expectedUnit: MKUnits.Unit) {
        XCTAssertEqual(item.amount, expectedAmount)
        XCTAssertEqual(item.unit, expectedUnit)
    }
}
