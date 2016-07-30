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
}

extension Unit {
    public init(name: String, symbol: String, ratio: NSDecimalNumber) {
        self.init()
        self.name = name
        self.symbol = symbol
        self.ratio = ratio
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

public func ==<T : Unit>(lhs: T, rhs: T) -> Bool {
    return lhs.symbol == rhs.symbol
}




//public struct Unit {
//    public let name: String
//    public let symbol: String
//    public let ratio: NSDecimalNumber
//    
//    init(name: String, symbol: String, ratio: NSDecimalNumber) {
//        self.name = name
//        self.symbol = symbol
//        self.ratio = ratio
//    }
// 
//    public func convertFromBaseUnit(amount: NSNumber) -> NSNumber {
//        let converted = NSDecimalNumber(decimal: amount.decimalValue)
//        return converted.decimalNumberByDividingBy(self.ratio)
//    }
//
//    public func convertToBaseUnit(amount: NSNumber) -> NSNumber {
//        let converted = NSDecimalNumber(decimal: amount.decimalValue)
//        return converted.decimalNumberByMultiplyingBy(self.ratio)
//    }
//    
////    public func isConvertible(with: Unit) -> Bool {
////        return with.dynamicType == self.dynamicType
////    }
//}
//
//extension Unit: CustomStringConvertible {
//    public var description: String {
//        return self.symbol
//    }
//}
//
//extension Unit: Equatable {}
//public func ==(lhs: Unit, rhs: Unit) -> Bool {
//    return lhs.symbol == rhs.symbol
//}

