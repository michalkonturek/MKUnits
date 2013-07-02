//
//  MKQuantity.m
//  MKUnits
//
//  Created by Michal Konturek on 27/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKQuantity.h"

#import "MKUnit.h"
#import "MKUnit+Conversion.h"

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
    [self _assert_that_is_convertible_with_unit:other.unit];

    MKQuantity *converted = [other convertTo:self.unit];
    id amount = [self.amount decimalNumberByAdding:converted.amount];
    return [[self class] createWithAmount:amount withUnit:self.unit];
}

- (instancetype)subtract:(MKQuantity *)other {
    [self _assert_that_is_convertible_with_unit:other.unit];
    
    MKQuantity *converted = [other convertTo:self.unit];
    id amount = [self.amount decimalNumberBySubtracting:converted.amount];
    return [[self class] createWithAmount:amount withUnit:self.unit];
}

- (instancetype)multiplyBy:(MKQuantity *)other {
    [self _assert_that_is_convertible_with_unit:other.unit];
    
    id amount = [self.amount decimalNumberByMultiplyingBy:other.amount];
    return [[self class] createWithAmount:amount withUnit:self.unit];
}

- (instancetype)divideBy:(MKQuantity *)other {
    [self _assert_that_is_convertible_with_unit:other.unit];
    
    id amount = [self.amount decimalNumberByDividingBy:other.amount];
    return [[self class] createWithAmount:amount withUnit:self.unit];
}

- (instancetype)negate {
    id amount = [NSDecimalNumber decimalNumberWithDecimal:[self.amount decimalValue]];
    return [[self class] createWithAmount:[amount negate] withUnit:self.unit];
}

- (instancetype)convertTo:(MKUnit *)unit {
    [self _assert_that_is_convertible_with_unit:unit];

    id converted = [self.unit convertAmount:self.amount to:unit];
    return [[self class] createWithAmount:converted withUnit:unit];
}

- (NSNumber *)amountInBaseUnit {
    return [self.unit convertToBaseUnit:self.amount];
}

- (BOOL)isTheSame:(MKQuantity *)other {
    return ([self compare:other] == NSOrderedSame);
}

- (BOOL)isGreaterThan:(MKQuantity *)other {
    return ([self compare:other] == NSOrderedDescending);
}

- (BOOL)isLessThan:(MKQuantity *)other {
    return ([self compare:other] == NSOrderedAscending);
}

- (NSComparisonResult)compare:(MKQuantity *)other {
    [self _assert_that_is_convertible_with_unit:other.unit];
    
    MKQuantity *converted = [other convertTo:self.unit];
    return ([self.amount compare:converted.amount]);
}

- (void)_assert_that_is_convertible_with_unit:(MKUnit *)unit {
    NSAssert([self.unit isConvertibleWith:unit], UNITS_NOT_CONVERTIBLE);
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ %@", self.amount, self.unit];
}

- (BOOL)isEqual:(id)object {
    if (![object isKindOfClass:[self class]]) return NO;
    if (![[object unit] isEqual:self.unit]) return NO;
    return [self.amount isEqual:[object amount]];
}

- (NSUInteger)hash {
    return [[NSString stringWithFormat:@"%@%@%@",
             [self class], self.unit.symbol, self.amount] hash];
}

@end
