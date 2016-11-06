//
//  VolumeUnitTests.swift
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

class VolumeUnitTests: XCTestCase {

    func test_correctness() {
        XCTAssertTrue(1.hectolitre() == 100.litre())
        XCTAssertTrue(1.litre() == 10.decilitre())
        XCTAssertTrue(1.decilitre() == 10.centilitre())
        XCTAssertTrue(1.centilitre() == 10.millilitre())
        
        XCTAssertTrue(1.millilitre() == 1000.microlitre())
        XCTAssertTrue(1.microlitre() == 0.000001.litre())
    }
    
    func test_extension() {
        self.assert(1.hectolitre(), expectedAmount: 1, expectedUnit: VolumeUnit.hectolitre)
        self.assert(1.5.litre(), expectedAmount: 1.5, expectedUnit: VolumeUnit.litre)
        self.assert(0.00001.decilitre(), expectedAmount: 0.00001, expectedUnit: VolumeUnit.decilitre)
        self.assert(1.centilitre(), expectedAmount: 1, expectedUnit: VolumeUnit.centilitre)
        
        self.assert(1.millilitre(), expectedAmount: 1, expectedUnit: VolumeUnit.millilitre)
        self.assert(1.microlitre(), expectedAmount: 1, expectedUnit: VolumeUnit.microlitre)
    }
    
    func assert(_ item: Quantity, expectedAmount: NSNumber, expectedUnit: MKUnits.Unit) {
        XCTAssertEqual(item.amount, expectedAmount)
        XCTAssertEqual(item.unit, expectedUnit)
    }
}
