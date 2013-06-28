//
//  MKQuantity.m
//  MKUnits
//
//  Created by Michal Konturek on 27/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKQuantity.h"
#import "MKUnit.h"

NSString * const UNIT_MISMATCH = @"Unit mismatch";

@implementation MKQuantity

+ (instancetype)createWithAmount:(NSNumber *)amount
                        withUnit:(MKUnit *)unit {
    return [[self alloc] initWithAmount:amount withUnit:unit];
}

- (id)initWithAmount:(NSNumber *)amount withUnit:(MKUnit *)unit {
    if (self = [super init]) {
        self.amount = [NSDecimalNumber decimalNumberWithDecimal:[amount decimalValue]];
        self.unit = unit;
    }
    return self;
}

- (instancetype)add:(MKQuantity *)other {
    NSAssert([self.unit isMemberOfClass:[other.unit class]], UNIT_MISMATCH);
    
    id amount = [self.amount decimalNumberByAdding:other.amount];
    return [[self class] createWithAmount:amount withUnit:self.unit];
}

- (instancetype)subtract:(MKQuantity *)other {
    NSAssert([self.unit isMemberOfClass:[other.unit class]], UNIT_MISMATCH);
    
    id amount = [self.amount decimalNumberBySubtracting:other.amount];
    return [[self class] createWithAmount:amount withUnit:self.unit];
}

- (instancetype)multiplyBy:(MKQuantity *)other {
    NSAssert([self.unit isMemberOfClass:[other.unit class]], UNIT_MISMATCH);
    
    id amount = [self.amount decimalNumberByMultiplyingBy:other.amount];
    return [[self class] createWithAmount:amount withUnit:self.unit];
}

- (instancetype)divideBy:(MKQuantity *)other {
    NSAssert([self.unit isMemberOfClass:[other.unit class]], UNIT_MISMATCH);
    
    id amount = [self.amount decimalNumberByDividingBy:other.amount];
    return [[self class] createWithAmount:amount withUnit:self.unit];
}

- (instancetype)negate {
    id amount = [NSDecimalNumber decimalNumberWithDecimal:[self.amount decimalValue]];
    return [[self class] createWithAmount:[amount negate] withUnit:self.unit];
}

- (instancetype)convertTo:(MKUnit *)unit {
    NSAssert([self.unit isMemberOfClass:[unit class]], UNIT_MISMATCH);
    id base_amount = [self amountInBaseUnit];
    id unit_amount = [unit convertFromBaseUnit:base_amount];
    return [[self class] createWithAmount:unit_amount withUnit:unit];
}

- (BOOL)isTheSame:(MKQuantity *)other {
    if (![self.unit isEqual:other.unit]) return NO;
    return ([self compare:other] == NSOrderedSame);
}

- (BOOL)isGreaterThan:(MKQuantity *)other {
    if (![self.unit isEqual:other.unit]) return NO;
    return ([self compare:other] == NSOrderedDescending);
}

- (BOOL)isLessThan:(MKQuantity *)other {
    if (![self.unit isEqual:other.unit]) return NO;
    return ([self compare:other] == NSOrderedAscending);
}

- (NSComparisonResult)compare:(MKQuantity *)other {
    return ([self.amount compare:other.amount]);
}

- (NSNumber *)amountInBaseUnit {
    return [self.unit convertToBaseUnit:self.amount];
}

- (NSNumber *)amountFromBaseUnit {
    return [self.unit convertFromBaseUnit:self.amount];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ %@", self.amount, self.unit];
}

- (NSUInteger)hash {
    return [self.amount hash];
}

- (BOOL)isEqual:(id)object {
    if (![object isKindOfClass:[self class]]) return NO;
    if ([[object unit] isEqual:self.amount]) return NO;
    return [self.amount isEqual:[object amount]];
}


@end
