//
//  Unit.swift
//  MKUnits
//
//  Created by Michal Konturek on 29/07/2016.
//
//

import Foundation

public protocol Unit: CustomStringConvertible, UnitConversion, Equatable {
    var name: String? { get set }
    var symbol: String? { get set }
    var ratio: NSDecimalNumber? { get set }
    
    init()
    func convertFromBaseUnit(amount: NSNumber) -> NSNumber
    func convertToBaseUnit(amount: NSNumber) -> NSNumber
}

extension Unit {
    public init(name: String, symbol: String, ratio: NSNumber) {
        self.init()
        self.name = name
        self.symbol = symbol
        self.ratio = NSDecimalNumber(decimal: ratio.decimalValue)
    }

    public func convertFromBaseUnit(amount: NSNumber) -> NSNumber {
        let converted = NSDecimalNumber(decimal: amount.decimalValue)
        return converted.decimalNumberByDividingBy(self.ratio!)
    }
    
    public func convertToBaseUnit(amount: NSNumber) -> NSNumber {
        let converted = NSDecimalNumber(decimal: amount.decimalValue)
        return converted.decimalNumberByMultiplyingBy(self.ratio!)
    }
}

// MARK: - CustomStringConvertible
extension Unit {
    public var description: String {
        return self.symbol!
    }
}

// MARK: - UnitConversion
public protocol UnitConversion {
    func convert<T : Unit>(amount: NSNumber, from: T, to: T) -> NSNumber;
    func isConvertible<T : Unit>(with: T) -> Bool
}

extension Unit {
    public func convert<T : Unit>(amount: NSNumber, from: T, to: T) -> NSNumber {
        let baseAmount = from.convertToBaseUnit(amount)
        let converted = to.convertFromBaseUnit(baseAmount)
        return converted
    }
    
    public func isConvertible<T : Unit>(with: T) -> Bool {
        return with.dynamicType == self.dynamicType
    }
}

// MARK: - Equatable
public func ==<T : Unit>(lhs: T, rhs: T) -> Bool {
    return lhs.symbol == rhs.symbol
}
