//
//  NSDecimalNumber+Negative.m
//
//  Created by Michal Konturek on 25/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDecimalNumber+Negative.h"

@implementation NSDecimalNumber (Negative)

+ (NSDecimalNumber *)createFrom:(NSNumber *)number {
    return [self decimalNumberWithDecimal:[number decimalValue]];
}

+ (NSDecimalNumber *)minutOne {
    return [[NSDecimalNumber zero] decimalNumberBySubtracting:[NSDecimalNumber one]];
}

- (NSDecimalNumber *)negate {
    return [self decimalNumberByMultiplyingBy:[NSDecimalNumber minutOne]];
}

@end
