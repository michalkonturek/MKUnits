//
//  Unit.swift
//  MKUnits
//
//  Created by Michal Konturek on 29/07/2016.
//
//

import Foundation

public protocol Unit: CustomStringConvertible, Equatable {
    var name: String? { get set }
    var symbol: String? { get set }
    var ratio: NSDecimalNumber? { get set }
    
    init()
    func convertFromBaseUnit(amount: NSNumber) -> NSNumber
    func convertToBaseUnit(amount: NSNumber) -> NSNumber
    func isConvertible<T : Unit>(with: T) -> Bool
    func convert<T : Unit>(amount: NSNumber, from: T, to: T) -> NSNumber;
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
    
    public func isConvertible<T : Unit>(with: T) -> Bool {
        return with.dynamicType == self.dynamicType
    }
}

extension Unit {
    public var description: String {
        return self.symbol!
    }
}

extension Unit {
    public func convert<T : Unit>(amount: NSNumber, from: T, to: T) -> NSNumber {
        let baseAmount = from.convertToBaseUnit(amount)
        let converted = to.convertFromBaseUnit(baseAmount)
        return converted
    }
}

public func ==<T : Unit>(lhs: T, rhs: T) -> Bool {
    return lhs.symbol == rhs.symbol
}
