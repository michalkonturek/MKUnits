//
//  UnitTests.swift
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

@Suite struct UnitTests {
    let sut = TestUnit.unitA
    
    @Test func initialization() {
        #expect(self.sut.name == "Unit A")
        #expect(self.sut.symbol == "A")
        #expect(self.sut.ratio == Decimal(1))
        #expect(type(of: self.sut.ratio) == Decimal.self)
    }
    
    @Test func convertFromBaseUnit() {
        let value = self.sut.convertFromBaseUnit(100)
        #expect(value == 100)
    }
    
    @Test func convertToBaseUnit() {
        let value = self.sut.convertFromBaseUnit(100)
        #expect(value == 100)
    }

    // MARK: - CustomStringConvertible
    
    @Test func customDescription() {
        #expect(self.sut.description == "A")
    }
    
    // MARK: - UnitConvertible
    
    @Test func isConvertible_returnsTrue() {
        let kilogram = MassUnit.kilogram
        let decagram = MassUnit.decagram
        #expect(kilogram.isConvertible(decagram))
    }
    
    @Test func isConvertible_returnsFalse() {
        let decagram = MassUnit.decagram
        #expect(!self.sut.isConvertible(decagram))
    }

    @Test func convert_from() {
        let unitA = TestUnit.unitA
        let unitB = TestUnit.unitB
        let converted = unitA.convert(10, from: unitB)
        #expect(converted == 100)
    }
    
    @Test func convert_from_to() {
        let unitA = TestUnit.unitA
        let unitB = TestUnit.unitB
        let converted = unitA.convert(10, from: unitB, to: unitA)
        #expect(converted == 100)
    }
    
    @Test func convert_to() {
        let unitA = TestUnit.unitA
        let unitB = TestUnit.unitB
        let converted = unitA.convert(10, to: unitB)
        #expect(converted == 1)
    }
    
    // MARK: - Equatable
    
    @Test func equatable_returnsTrue() {
        let other = TestUnit.unitA
        #expect(self.sut == other)
    }
    
    @Test func equatable_returnsFalse() {
        var other = TestUnit.unitB
        #expect(!(self.sut == other))
        
        other = TestOtherUnit.unit
        #expect(!(self.sut == other))
    }
}

class TestUnit: MKUnits.Unit, @unchecked Sendable {
    
    internal static var unitA: TestUnit {
        return TestUnit(name: "Unit A", symbol: "A", ratio: 1)
    }
    
    internal static var unitB: TestUnit {
        return TestUnit(name: "Unit B", symbol: "B", ratio: 10)
    }
}

class TestOtherUnit: TestUnit, @unchecked Sendable {
    
    internal static var unit: TestOtherUnit {
        return TestOtherUnit(name: "Unit A", symbol: "A", ratio: 1)
    }
}
