//
//  MKLengthUnit_Imperial_Tests.m
//  MKUnits
//
//  Created by Michal Konturek on 30/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "Base_Tests.h"

@interface MKLengthUnit_Imperial_Tests : SenTestCase

@end

@implementation MKLengthUnit_Imperial_Tests

- (void)test_one_foot_is_12_inches {
    MKQuantity *expected = [MKQuantity length_inchWithAmount:@12];
    BOOL result = [[MKQuantity length_footWithAmount:@1] isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_yard_is_3_feet {
    MKQuantity *expected = [MKQuantity length_footWithAmount:@3];
    BOOL result = [[MKQuantity length_yardWithAmount:@1] isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_chain_is_22_yards {
    MKQuantity *expected = [MKQuantity length_yardWithAmount:@22];
    BOOL result = [[MKQuantity length_chainWithAmount:@1] isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_furlong_is_10_chains {
    MKQuantity *expected = [MKQuantity length_chainWithAmount:@10];
    BOOL result = [[MKQuantity length_furlongWithAmount:@1] isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_mile_is_5280_feet {
    MKQuantity *expected = [MKQuantity length_footWithAmount:@5280];
    BOOL result = [[MKQuantity length_mileWithAmount:@1] isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_nautical_mile_is_6080_feet {
    MKQuantity *expected = [MKQuantity length_footWithAmount:@6080];
    BOOL result = [[MKQuantity length_nautical_mileWithAmount:@1] isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

@end
