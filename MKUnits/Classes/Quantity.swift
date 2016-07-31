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
    
    public func converted(to: Unit) -> Quantity {
        assert(self.unit.isConvertible(to))
        let amount = self.unit.convert(self.amount, to: to)
        return Quantity(amount: amount, unit: to)
    }
}

// MARK: - Equatable
extension Quantity: Equatable {
    public func equals(other: Quantity) -> Bool {
        if self.unit != other.unit {
            return false
        }
        return self.amount == other.amount
    }
}
public func ==(lhs: Quantity, rhs: Quantity) -> Bool {
    return lhs.equals(rhs)
}

// MARK: - Comparable
extension Quantity: Comparable {}
public func <(lhs: Quantity, rhs: Quantity) -> Bool {
    assert(lhs.unit.isConvertible(rhs.unit))
    let converted = lhs.converted(rhs.unit)
    return converted.amount.compare(rhs.amount) == .OrderedAscending
}

public func <=(lhs: Quantity, rhs: Quantity) -> Bool {
    assert(lhs.unit.isConvertible(rhs.unit))
    let converted = lhs.converted(rhs.unit)
    return converted.amount.compare(rhs.amount) != .OrderedDescending
}

public func >(lhs: Quantity, rhs: Quantity) -> Bool {
    assert(lhs.unit.isConvertible(rhs.unit))
    let converted = lhs.converted(rhs.unit)
    return converted.amount.compare(rhs.amount) == .OrderedDescending
}

public func >=(lhs: Quantity, rhs: Quantity) -> Bool {
    assert(lhs.unit.isConvertible(rhs.unit))
    let converted = lhs.converted(rhs.unit)
    return converted.amount.compare(rhs.amount) != .OrderedAscending
}


//func +<T : Unit, X : Unit>(left: Quantity<T>, right: Quantity<X>) -> Quantity<T> {
//    assert(left.unit.isConvertible(right.unit))
//    let other = right.
////    return Quantity(amount: other, unit: )
//}


//http://stackoverflow.com/questions/29644963/convert-nsdecimalnumbers-to-negative