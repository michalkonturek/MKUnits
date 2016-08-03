//
//  AreaUnitImperialTests.swift
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

class AreaUnitImperialTests: XCTestCase {

    func test_correctness() {
        
        XCTAssertTrue(1.squareMile()
            .converted(AreaUnit.acre)
            .rounded(6) == 640.acre())
        
        XCTAssertTrue(1.acre() == 4840.squareYard())
        XCTAssertTrue(1.squareYard() == 9.squareFoot())
        XCTAssertTrue(1.squareFoot() == 144.squareInch())
        XCTAssertTrue(1.squareInch() == 6.4516.squareCentimeter())
    }
    
    func test_extension() {
        self.assert(1.squareMile(), expectedAmount: 1, expectedUnit: AreaUnit.squareMile)
        self.assert(1.acre(), expectedAmount: 1, expectedUnit: AreaUnit.acre)
        self.assert(1.squareYard(), expectedAmount: 1, expectedUnit: AreaUnit.squareYard)
        self.assert(1.squareFoot(), expectedAmount: 1, expectedUnit: AreaUnit.squareFoot)
        self.assert(1.squareInch(), expectedAmount: 1, expectedUnit: AreaUnit.squareInch)
    }
    
    func assert(item: Quantity, expectedAmount: NSNumber, expectedUnit: Unit) {
        XCTAssertEqual(item.amount, expectedAmount)
        XCTAssertEqual(item.unit, expectedUnit)
    }
}
