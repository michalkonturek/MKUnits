//
//  NSNumber+MK_Comparison.m
//  MKFoundationKit
//
//  Created by Michal Konturek on 06/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSNumber+MK_Comparison.h"

#import "NSNumber+MK_Fraction.h"
#import "NSNumber+MK_Manipulation.h"

@implementation NSNumber (MK_Comparison)

- (BOOL)mk_isTheSame:(NSNumber *)other {
    return ([self compare:other] == NSOrderedSame);
}

- (BOOL)mk_isGreaterThan:(NSNumber *)other {
    return ([self compare:other] == NSOrderedDescending);
}

- (BOOL)mk_isLessThan:(NSNumber *)other {
    return ([self compare:other] == NSOrderedAscending);
}

- (BOOL)mk_isEven {
    return (![self mk_isOdd]);
}

- (BOOL)mk_isOdd {
    if ([self mk_isFraction]) return YES;
    if ([self mk_isTheSame:@0]) return NO;
    return [[self mk_divideBy:@2] mk_isFraction];
}

@end
