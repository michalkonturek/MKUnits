//
//  VolumeUnitUSTests.swift
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

import Foundation
import Testing

import MKUnits

@Suite struct VolumeUnitUSTests {

    @Test func correctness() {
        #expect(1.us_hogshead() == 63.us_gallon())
        #expect(1.us_hogshead() == 2.us_barrel())
        #expect(1.us_barrel() == 31.5.us_gallon())
        #expect(1.us_gallon() == 4.us_quart())
        #expect(1.us_quart() == 2.us_pint())
        
        #expect(1.us_pint() == 2.us_cup())
        #expect(1.us_cup() == 2.us_gill())
        #expect(1.us_gill() == 4.us_fluidounce())
        #expect(1.us_fluidounce() == 2.us_tablespoon())
        
        #expect(1.us_tablespoon() == 3.us_teaspoon())
        #expect(1.us_tablespoon() == 4.us_fluidram())
        #expect(1.us_teaspoon() == 80.us_minim())
        #expect(1.us_fluidram() == 60.us_minim())
        #expect(1.us_minim() == Quantity(amount: Decimal(string: "0.061611519921875")!, unit: VolumeUnit.millilitre))
    }
    
    @Test func fluentAPI() {
        self.assert(1.us_hogshead(), expectedAmount: 1, expectedUnit: VolumeUnit.us_hogshead)
        self.assert(1.us_barrel(), expectedAmount: 1, expectedUnit: VolumeUnit.us_barrel)
        self.assert(1.us_gallon(), expectedAmount: 1, expectedUnit: VolumeUnit.us_gallon)
        self.assert(1.5.us_quart(), expectedAmount: 1.5, expectedUnit: VolumeUnit.us_quart)
        
        self.assert(0.00001.us_pint(), expectedAmount: 0.00001, expectedUnit: VolumeUnit.us_pint)
        self.assert(1.us_cup(), expectedAmount: 1, expectedUnit: VolumeUnit.us_cup)
        self.assert(1.us_gill(), expectedAmount: 1, expectedUnit: VolumeUnit.us_gill)
        self.assert(1.us_fluidounce(), expectedAmount: 1, expectedUnit: VolumeUnit.us_fluidounce)
        
        self.assert(1.us_tablespoon(), expectedAmount: 1, expectedUnit: VolumeUnit.us_tablespoon)
        self.assert(1.us_teaspoon(), expectedAmount: 1, expectedUnit: VolumeUnit.us_teaspoon)
        self.assert(1.us_fluidram(), expectedAmount: 1, expectedUnit: VolumeUnit.us_fluidram)
        self.assert(1.us_minim(), expectedAmount: 1, expectedUnit: VolumeUnit.us_minim)
    }
    
    private func assert(_ item: Quantity, expectedAmount: Decimal, expectedUnit: MKUnits.Unit) {
        #expect(item.amount == expectedAmount)
        #expect(item.unit == expectedUnit)
    }
}
