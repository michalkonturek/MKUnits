//
//  Quantity.swift
//  Pods
//
//  Created by Michal Konturek on 29/07/2016.
//
//

import Foundation

protocol Unitable {
    associatedtype UnitType
    var amount: NSDecimalNumber { get }
    var unit: UnitType { get }
    
    init(amount: NSNumber, unit: UnitType)
}

public struct Quantity<T>: Unitable {
    public let amount: NSDecimalNumber
    public let unit: T
    
    public init(amount: NSNumber, unit: T) {
        self.amount = NSDecimalNumber(decimal: amount.decimalValue)
        self.unit = unit
    }
    
}

//func +(left: Quantity, right: Quantity) -> Quantity {
//    assert(left.unit == right.unit)
//}
//http://stackoverflow.com/questions/29644963/convert-nsdecimalnumbers-to-negative