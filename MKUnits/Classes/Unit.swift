//
//  Unit.swift
//  MKUnits
//
//  Created by Michal Konturek on 29/07/2016.
//
//

import Foundation

public class Unit {
    let name: String
    let symbol: String
    let ratio: NSDecimalNumber
    
    public init(name: String, symbol: String, ratio: NSNumber) {
        self.name = name
        self.symbol = symbol
        self.ratio = NSDecimalNumber(decimal: ratio.decimalValue)
    }
    
    public func convertFromBaseUnit(amount: NSNumber) -> NSNumber {
        let converted = NSDecimalNumber(decimal: amount.decimalValue)
        return converted.decimalNumberByDividingBy(self.ratio)
    }
    
    public func convertToBaseUnit(amount: NSNumber) -> NSNumber {
        let converted = NSDecimalNumber(decimal: amount.decimalValue)
        return converted.decimalNumberByMultiplyingBy(self.ratio)
    }
}

// MARK: - CustomStringConvertible
extension Unit: CustomStringConvertible {
    public var description: String {
        return self.symbol
    }
}

// MARK: - UnitConversion
public protocol UnitConversion {
    func convert(amount: NSNumber, to: Unit) -> NSNumber
    func convert(amount: NSNumber, from: Unit) -> NSNumber
    func convert(amount: NSNumber, from: Unit, to: Unit) -> NSNumber
    func isConvertible(with: Unit) -> Bool
}

extension Unit: UnitConversion {

    public func convert(amount: NSNumber, to: Unit) -> NSNumber {
        return self.convert(amount, from: self, to: to)
    }
    
    public func convert(amount: NSNumber, from: Unit) -> NSNumber {
        return self.convert(amount, from: from, to: self)
    }
    
    public func convert(amount: NSNumber, from: Unit, to: Unit) -> NSNumber {
        let baseAmount = from.convertToBaseUnit(amount)
        let converted = to.convertFromBaseUnit(baseAmount)
        return converted
    }
    
    public func isConvertible(with: Unit) -> Bool {
        return with.dynamicType == self.dynamicType
    }
}

// MARK: - Equatable
extension Unit: Equatable {
    public func equals(other: Unit) -> Bool {
        if other.dynamicType !== self.dynamicType {
            return false
        }
        return self.symbol == other.symbol
    }
}
public func ==<T where T: Unit>(lhs: T, rhs: T) -> Bool {
    return lhs.equals(rhs)
}
//public func ==(lhs: Unit, rhs: Unit) -> Bool {
//    return lhs.symbol == rhs.symbol
//}
