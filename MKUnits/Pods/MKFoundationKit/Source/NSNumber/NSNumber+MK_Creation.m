//
//  NSNumber+MK_Creation.m
//  MKFoundationKit
//
//  Created by Michal Konturek on 02/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSNumber+MK_Creation.h"

@implementation NSNumber (MK_Creation)

+ (instancetype)mk_createFrom:(NSNumber *)number {
    if ([self class] == [NSNumber class]) return number;
    return [NSDecimalNumber decimalNumberWithDecimal:[number decimalValue]];
}

- (NSDecimalNumber *)mk_decimalNumber {
    if ([self isMemberOfClass:[NSDecimalNumber class]]) return (NSDecimalNumber *)self;
    return [NSDecimalNumber decimalNumberWithDecimal:[self decimalValue]];
//    return [NSDecimalNumber decimalNumberWithString:[self stringValue]];
}

@end
