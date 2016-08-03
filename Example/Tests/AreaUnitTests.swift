//
//  AreaUnitTests.swift
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

class AreaUnitTests: XCTestCase {

    func test_correctness() {
        XCTAssertTrue(1.squareKilometer() == 100.hectare())
        XCTAssertTrue(1.hectare() == 100.are())
        XCTAssertTrue(1.are() == 100.squareMeter())
        XCTAssertTrue(1.squareMeter() == 100.squareDecimeter())
        XCTAssertTrue(1.squareDecimeter() == 100.squareCentimeter())
        XCTAssertTrue(1.squareCentimeter() == 100.squareMillimeter())
    }
    
    func test_extension() {
        self.assert(1.squareKilometer(), expectedAmount: 1, expectedUnit: AreaUnit.squareKilometer)
        self.assert(1.hectare(), expectedAmount: 1, expectedUnit: AreaUnit.hectare)
        self.assert(1.are(), expectedAmount: 1, expectedUnit: AreaUnit.are)
        self.assert(1.squareMeter(), expectedAmount: 1, expectedUnit: AreaUnit.squareMeter)
        self.assert(1.squareDecimeter(), expectedAmount: 1, expectedUnit: AreaUnit.squareDecimeter)
        self.assert(1.squareCentimeter(), expectedAmount: 1, expectedUnit: AreaUnit.squareCentimeter)
        self.assert(1.squareMillimeter(), expectedAmount: 1, expectedUnit: AreaUnit.squareMillimeter)
    }
    
    func assert(item: Quantity, expectedAmount: NSNumber, expectedUnit: Unit) {
        XCTAssertEqual(item.amount, expectedAmount)
        XCTAssertEqual(item.unit, expectedUnit)
    }
}
