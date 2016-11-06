//
//  VolumeUnitImperialTests.swift
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

class VolumeUnitImperialTests: XCTestCase {

    func test_correctness() {
        XCTAssertTrue(1.gallon() == 4.quart())
        XCTAssertTrue(1.quart() == 2.pint())
        XCTAssertTrue(1.pint() == 20.fluidounce())
        XCTAssertTrue(1.cup() == 284.13.millilitre())

        XCTAssertTrue(1.fluidounce() == 8.fluidram())
        XCTAssertTrue(1.tablespoon() == 17.7581714.millilitre())
        XCTAssertTrue(1.teaspoon() == 5.91939.millilitre())
        XCTAssertTrue(1.fluidram() == 3.5516328125.millilitre())
        
        XCTAssertTrue(1.pint()
            .converted(VolumeUnit.cup)
            .rounded(5) == 2.cup())
        
        XCTAssertTrue(1.cup()
            .converted(VolumeUnit.fluidounce)
            .rounded(4) == 10.fluidounce())
        
        XCTAssertTrue(1.tablespoon()
            .converted(VolumeUnit.teaspoon)
            .rounded(6) == 3.teaspoon())
    }
    
    func test_extension() {
        self.assert(1.gallon(), expectedAmount: 1, expectedUnit: VolumeUnit.gallon)
        self.assert(1.5.quart(), expectedAmount: 1.5, expectedUnit: VolumeUnit.quart)
        self.assert(0.00001.pint(), expectedAmount: 0.00001, expectedUnit: VolumeUnit.pint)
        self.assert(1.cup(), expectedAmount: 1, expectedUnit: VolumeUnit.cup)

        self.assert(1.fluidounce(), expectedAmount: 1, expectedUnit: VolumeUnit.fluidounce)
        self.assert(1.tablespoon(), expectedAmount: 1, expectedUnit: VolumeUnit.tablespoon)
        self.assert(1.teaspoon(), expectedAmount: 1, expectedUnit: VolumeUnit.teaspoon)
        self.assert(1.fluidram(), expectedAmount: 1, expectedUnit: VolumeUnit.fluidram)
    }
    
    func assert(_ item: Quantity, expectedAmount: NSNumber, expectedUnit: Unit) {
        XCTAssertEqual(item.amount, expectedAmount)
        XCTAssertEqual(item.unit, expectedUnit)
    }
}
