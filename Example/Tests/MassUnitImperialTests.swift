//
//  MassUnitImperialTests.swift
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
