//
//  NSNumber+Fraction.m
//  MKUnits
//
//  Created by Michal Konturek on 30/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSNumber+Fraction.h"

/*
 info:
 http://www.cimgf.com/2008/04/23/cocoa-tutorial-dont-be-lazy-with-nsdecimalnumber-like-me/
 */

@implementation NSNumber (Fraction)


+ (NSDecimalNumberHandler *)decimalNumberHandlerWithScale:(short)scale {
    return [NSDecimalNumberHandler
            decimalNumberHandlerWithRoundingMode:NSRoundPlain
            scale:scale
            raiseOnExactness:NO
            raiseOnOverflow:NO
            raiseOnUnderflow:NO
            raiseOnDivideByZero:NO
            ];
}

- (NSNumber *)integerPart {
    return [NSNumber numberWithInteger:[self integerValue]];
//    return [self decimalNumberWithPrecision:0];   // do not use as it rounds the number
}

- (NSNumber *)fractionPart {
    NSDecimalNumber *integerPart = [[self integerPart] decimalNumber];
    return [[self decimalNumber] decimalNumberBySubtracting:integerPart];
}

- (NSDecimalNumber *)decimalNumberWithPrecision:(short)precision {
    NSAssert(precision >= 0, @"Precision cannot be negative.");
    NSDecimalNumberHandler *behavior = [[self class] decimalNumberHandlerWithScale:precision];
    return [[self decimalNumber] decimalNumberByRoundingAccordingToBehavior:behavior];
}

- (NSDecimalNumber *)decimalNumber {
    return [NSDecimalNumber decimalNumberWithString:[self stringValue]];
//    return [NSDecimalNumber decimalNumberWithDecimal:[self decimalValue]];
}

@end
