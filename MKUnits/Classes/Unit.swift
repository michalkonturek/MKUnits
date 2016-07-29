//
//  Unit.swift
//  MKUnits
//
//  Created by Michal Konturek on 29/07/2016.
//
//

import Foundation

public struct Unit {
    public let name: String
    public let symbol: String
    public let ratio: NSDecimalNumber
    
    init(name: String, symbol: String, ratio: NSDecimalNumber) {
        self.name = name
        self.symbol = symbol
        self.ratio = ratio
    }
 
    public func convertFromBaseUnit(amount: NSNumber) -> NSNumber! {
        let converted = NSDecimalNumber(decimal: amount.decimalValue)
        return converted.decimalNumberByDividingBy(self.ratio)
    }

    public func convertToBaseUnit(amount: NSNumber) -> NSNumber! {
        let converted = NSDecimalNumber(decimal: amount.decimalValue)
        return converted.decimalNumberByMultiplyingBy(self.ratio)
    }
}

extension Unit: CustomStringConvertible {
    public var description: String {
        return self.symbol
    }
}

extension Unit: Equatable {}
public func ==(lhs: Unit, rhs: Unit) -> Bool {
    return lhs.symbol == rhs.symbol
}

