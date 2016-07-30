//
//  Quantity.swift
//  Pods
//
//  Created by Michal Konturek on 29/07/2016.
//
//

import Foundation

public struct Quantity {
    public let amount: NSDecimalNumber
    public let unit: Unit
    
    public init(amount: NSNumber, unit: Unit) {
        self.amount = NSDecimalNumber(decimal: amount.decimalValue)
        self.unit = unit
    }
    
    
//    public func convert(to: T) -> Quantity<T> {
//        assert(self.unit.isConvertible(to))
//    }
}

//func +<T : Unit, X : Unit>(left: Quantity<T>, right: Quantity<X>) -> Quantity<T> {
//    assert(left.unit.isConvertible(right.unit))
//    let other = right.
////    return Quantity(amount: other, unit: <#T##T#>)
//}


//http://stackoverflow.com/questions/29644963/convert-nsdecimalnumbers-to-negative