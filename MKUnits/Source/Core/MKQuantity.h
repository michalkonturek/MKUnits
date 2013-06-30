//
//  MKQuantity.h
//  MKUnits
//
//  Created by Michal Konturek on 27/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXPORT NSString * const UNIT_MISMATCH;

@class MKUnit;

@interface MKQuantity : NSObject

+ (instancetype)createWithAmount:(NSNumber *)amount
                        withUnit:(MKUnit *)unit;

@property (nonatomic, copy) NSDecimalNumber *amount;
@property (nonatomic, strong) MKUnit *unit;

- (id)initWithAmount:(NSNumber *)amount withUnit:(MKUnit *)unit;

- (instancetype)add:(MKQuantity *)other;
- (instancetype)subtract:(MKQuantity *)other;
- (instancetype)multiplyBy:(MKQuantity *)other;
- (instancetype)divideBy:(MKQuantity *)other;
- (instancetype)negate;

- (instancetype)convertTo:(MKUnit *)unit;

- (BOOL)isTheSame:(MKQuantity *)other;
- (BOOL)isGreaterThan:(MKQuantity *)other;
- (BOOL)isLessThan:(MKQuantity *)other;

- (NSComparisonResult)compare:(MKQuantity *)other;

- (NSNumber *)amountInBaseUnit;
- (NSNumber *)amountFromBaseUnit;

@end
