//
//  NSNumber+MK_Precision.m
//  MKFoundationKit
//
//  Created by Michal Konturek on 02/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSNumber+MK_Precision.h"

#import "NSNumber+MK_Creation.h"

@implementation NSNumber (MK_Precision)

+ (NSDecimalNumberHandler *)mk_decimalNumberHandlerWithScale:(short)scale {
    return [NSDecimalNumberHandler
            decimalNumberHandlerWithRoundingMode:NSRoundPlain
            scale:scale
            raiseOnExactness:NO
            raiseOnOverflow:NO
            raiseOnUnderflow:NO
            raiseOnDivideByZero:NO
            ];
}

- (instancetype)mk_roundedAsMoney {
    return [self mk_roundedWithPrecision:2];
}

- (instancetype)mk_roundedWithPrecision:(short)precision {
    NSAssert(precision >= 0, @"Precision cannot be negative.");
    NSDecimalNumberHandler *behavior = [NSDecimalNumber mk_decimalNumberHandlerWithScale:precision];
    return [[self mk_decimalNumber] decimalNumberByRoundingAccordingToBehavior:behavior];
}

@end
