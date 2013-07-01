//
//  MKQuantity+Precision.h
//  MKUnits
//
//  Created by Michal Konturek on 30/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKQuantity.h"

@interface MKQuantity (Precision)

- (instancetype)quantityWithPrecision:(short)precision;
- (NSNumber *)amountWithPrecision:(short)precision;

- (BOOL)isTheSame:(MKQuantity *)other withPrecision:(short)precision;
- (BOOL)isGreaterThan:(MKQuantity *)other withPrecision:(short)precision;
- (BOOL)isLessThan:(MKQuantity *)other withPrecision:(short)precision;

- (NSComparisonResult)compare:(MKQuantity *)other withPrecision:(short)precision;

@end
