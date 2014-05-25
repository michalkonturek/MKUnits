//
//  MKQuantity.m
//  MKUnits
//
//  Copyright (c) 2013 Michal Konturek
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "MKQuantity.h"

#import "MKUnit.h"
#import "MKUnit+Conversion.h"

#import <MKFoundationKit/NSNumber+MK.h>


@interface MKQuantity ()

@property (nonatomic, copy) NSDecimalNumber *amount;
@property (nonatomic, strong) MKUnit *unit;

@end


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

- (instancetype)multiplyBy:(NSNumber *)other {
    id amount = [self.amount decimalNumberByMultiplyingBy:[other mk_decimalNumber]];
    return [[self class] createWithAmount:amount withUnit:self.unit];
}

- (instancetype)divideBy:(NSNumber *)other {
    id amount = [self.amount decimalNumberByDividingBy:[other mk_decimalNumber]];
    return [[self class] createWithAmount:amount withUnit:self.unit];
}

- (instancetype)negate {
    id amount = [NSDecimalNumber decimalNumberWithDecimal:[self.amount decimalValue]];
    return [[self class] createWithAmount:[amount mk_negate] withUnit:self.unit];
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
