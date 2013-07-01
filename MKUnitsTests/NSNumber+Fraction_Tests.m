//
//  NSNumber+Fraction_Tests.m
//  MKUnits
//
//  Created by Michal Konturek on 01/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "Base_Tests.h"

@interface NSNumber_Fraction_Tests : SenTestCase

@end

@implementation NSNumber_Fraction_Tests

- (void)test_decimalNumberWithPrecision_throws_exception_when_negative_precision {
    STAssertThrows([@12.123456 decimalNumberWithPrecision:-2], @"");
}

@end
