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

import Foundation
import Testing

import MKUnits

@Suite struct VolumeUnitTests {

    @Test func correctness() {
        #expect(1.hectolitre() == 100.litre())
        #expect(1.litre() == 10.decilitre())
        #expect(1.decilitre() == 10.centilitre())
        #expect(1.centilitre() == 10.millilitre())
        
        #expect(1.millilitre() == 1000.microlitre())
        #expect(1.microlitre() == 0.000001.litre())
    }
    
    @Test func fluentAPI() {
        self.assert(1.hectolitre(), expectedAmount: 1, expectedUnit: VolumeUnit.hectolitre)
        self.assert(1.5.litre(), expectedAmount: 1.5, expectedUnit: VolumeUnit.litre)
        self.assert(0.00001.decilitre(), expectedAmount: 0.00001, expectedUnit: VolumeUnit.decilitre)
        self.assert(1.centilitre(), expectedAmount: 1, expectedUnit: VolumeUnit.centilitre)
        
        self.assert(1.millilitre(), expectedAmount: 1, expectedUnit: VolumeUnit.millilitre)
        self.assert(1.microlitre(), expectedAmount: 1, expectedUnit: VolumeUnit.microlitre)
    }
    
    func assert(_ item: Quantity, expectedAmount: Decimal, expectedUnit: MKUnits.Unit) {
        #expect(item.amount == expectedAmount)
        #expect(item.unit == expectedUnit)
    }
}
