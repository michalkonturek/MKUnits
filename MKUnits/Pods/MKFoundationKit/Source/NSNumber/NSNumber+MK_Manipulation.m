//
//  NSNumber+MK_Manipulation.m
//  MKFoundationKit
//
//  Created by Michal Konturek on 02/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSNumber+MK_Manipulation.h"

#import "NSNumber+MK_Creation.h"

@implementation NSNumber (MK_Manipulation)

- (instancetype)mk_add:(NSNumber *)other {
    if (!other) return self;
    return [[self mk_decimalNumber] decimalNumberByAdding:[other mk_decimalNumber]];
}

- (instancetype)mk_subtract:(NSNumber *)other {
    if (!other) return self;
    return [[self mk_decimalNumber] decimalNumberBySubtracting:[other mk_decimalNumber]];
}

- (instancetype)mk_multiplyBy:(NSNumber *)other {
    if (!other) return self;
    return [[self mk_decimalNumber] decimalNumberByMultiplyingBy:[other mk_decimalNumber]];
}

- (instancetype)mk_divideBy:(NSNumber *)other {
    if (!other) return self;
    return [[self mk_decimalNumber] decimalNumberByDividingBy:[other mk_decimalNumber]];
}

- (instancetype)mk_raiseToPower:(NSInteger)power {
    if (power < 0) return [self _raiseToNegativePower:power];
    return [[self mk_decimalNumber] decimalNumberByRaisingToPower:power];
}

- (instancetype)_raiseToNegativePower:(NSInteger)power {

    /*
     source:
     http://stackoverflow.com/questions/3596060/raise-an-nsdecimalnumber-to-a-negative-power
     
     a^(-b) == 1 / (a^b)
     */
    
    power = power * (-1);
    
    id result = [self mk_raiseToPower:power];
    return [[NSDecimalNumber one] mk_divideBy:result];
}

@end
