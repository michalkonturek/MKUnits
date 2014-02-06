//
//  NSNumber+MK_Fraction.m
//  MKFoundationKit
//
//  Created by Michal Konturek on 30/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSNumber+MK_Fraction.h"

#import "NSNumber+MK_Creation.h"

@implementation NSNumber (MK_Fraction)

- (instancetype)mk_integralPart {
    if ([self isMemberOfClass:[NSNumber class]])
        return [NSNumber numberWithInteger:[self integerValue]];
    
    return [[NSDecimalNumber numberWithInteger:[self integerValue]] mk_decimalNumber];
//    return [self decimalNumberWithPrecision:0];   // do not use as it rounds the number
}

- (instancetype)mk_fractionalPart {
    NSDecimalNumber *integerPart = [[self mk_integralPart] mk_decimalNumber];
    return [[self mk_decimalNumber] decimalNumberBySubtracting:integerPart];
}

- (BOOL)mk_isInteger {
    return ([[self mk_fractionalPart] isEqualToNumber:@0]);
}

- (BOOL)mk_isFraction {
    return (![self mk_isInteger]);
}

@end
