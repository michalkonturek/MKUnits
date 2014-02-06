//
//  NSNumber+MK_Negative.m
//  MKFoundationKit
//
//  Created by Michal Konturek on 02/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSNumber+MK_Negative.h"

#import "NSNumber+MK_Creation.h"

@implementation NSNumber (MK_Negative)

+ (instancetype)mk_minusOne {
    return [[NSDecimalNumber zero] decimalNumberBySubtracting:[NSDecimalNumber one]];
}

- (instancetype)mk_negative {
    return ([self mk_isNegative]) ? self : [self mk_negate];
}

- (instancetype)mk_positive {
    return ([self mk_isPositive]) ? self : [self mk_negate];
}

- (instancetype)mk_negate {    
    return [[self mk_decimalNumber] decimalNumberByMultiplyingBy:[NSDecimalNumber mk_minusOne]];
}

- (BOOL)mk_isPositive {
    return (![self mk_isNegative]);
}

- (BOOL)mk_isNegative {
    return ([self doubleValue] < 0);
}

@end
