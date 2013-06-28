//
//  NSDecimalNumber+Negative_Tests.m
//  MKUnits
//
//  Created by Michal Konturek on 27/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "Base_Tests.h"

#import "NSDecimalNumber+Negative.h"

@interface NSDecimalNumber_Negative_Tests : SenTestCase

@end

@implementation NSDecimalNumber_Negative_Tests

- (void)test_minusOne {
    NSDecimalNumber *input = [NSDecimalNumber minutOne];
    assertThat(input, equalToInteger(-1));
}

- (void)test_negate_integer {
    NSInteger value = 1000;
    
    NSDecimalNumber *input = [NSDecimalNumber createFrom:[NSNumber numberWithInteger:value]];
    NSDecimalNumber *negative = [input negate];
    
    assertThat(negative, equalToInteger(-value));
}

@end
