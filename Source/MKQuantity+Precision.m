//
//  MKQuantity+Precision.m
//  MKUnits
//
//  Created by Michal Konturek on 30/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKQuantity+Precision.h"

#import "MKUnit.h"
#import "MKUnit+Conversion.h"

#import <MKFoundationKit/NSNumber+MK.h>

@implementation MKQuantity (Precision)

- (instancetype)quantityWithPrecision:(short)precision {
    id rounded = [self amountWithPrecision:precision];
    return [[self class] createWithAmount:rounded withUnit:[self.unit copy]];
}

- (NSNumber *)amountWithPrecision:(short)precision {
    return [self.amount mk_roundedWithPrecision:precision];
}

- (BOOL)isTheSame:(MKQuantity *)other withPrecision:(short)precision {
    return ([self compare:other withPrecision:precision] == NSOrderedSame);
}

- (BOOL)isGreaterThan:(MKQuantity *)other withPrecision:(short)precision {
    return ([self compare:other withPrecision:precision] == NSOrderedDescending);
}

- (BOOL)isLessThan:(MKQuantity *)other withPrecision:(short)precision {
    return ([self compare:other withPrecision:precision] == NSOrderedAscending);
}

- (NSComparisonResult)compare:(MKQuantity *)other withPrecision:(short)precision {
    NSAssert([self.unit isConvertibleWith:other.unit], UNITS_NOT_CONVERTIBLE);
    MKQuantity *converted = [other convertTo:self.unit];
    return ([[self.amount mk_roundedWithPrecision:precision]
             compare:[converted.amount mk_roundedWithPrecision:precision]]);
}

@end
