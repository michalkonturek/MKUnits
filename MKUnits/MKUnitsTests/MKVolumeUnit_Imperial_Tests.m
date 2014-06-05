//
//  MKVolumeUnit_Imperial_Tests.m
//  MKUnits
//
//  Created by Michal Konturek on 02/06/2014.
//  Copyright (c) 2014 Michal Konturek. All rights reserved.
//

#import "Base_Tests.h"

@interface MKVolumeUnit_Imperial_Tests : XCTestCase

@end

@implementation MKVolumeUnit_Imperial_Tests

- (void)test_one_tablespoon_is_3_teaspoons {
    MKQuantity *target = [@1 volume_tablespoon];    //  17.7581714 ml
    MKQuantity *expected = [@3 volume_teaspoon];    //  17.75817 ml
    
//    id test1 = [target convertTo:[MKVolumeUnit millilitre]];
//    id test2 = [expected convertTo:[MKVolumeUnit millilitre]];
    
    BOOL result = [expected isTheSame:target withPrecision:6];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_fluidonce_is_4_point_8_teaspoons {
    MKQuantity *target = [@1 volume_fluidounce];    // 28.4130625 ml
    MKQuantity *expected = [@4.8 volume_teaspoon];  // 28.413072 ml
    
    BOOL result = [expected isTheSame:target withPrecision:5];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_fluidonce_is_1_point_6_tablespoon {
    MKQuantity *target = [@1 volume_fluidounce];
    MKQuantity *expected = [@1.6 volume_tablespoon];
    
    BOOL result = [expected isTheSame:target withPrecision:5];
    assertThatBool(result, equalToBool(YES));
}


- (void)test_one_fluidonce_is_8_fluidrams {
    MKQuantity *target = [@1 volume_fluidounce];
    MKQuantity *expected = [@8 volume_fluidram];
    
    BOOL result = [expected isTheSame:target];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_pint_is_20_fluidounce {
    MKQuantity *target = [@1 volume_pint];
    MKQuantity *expected = [@20 volume_fluidounce];
    
    BOOL result = [expected isTheSame:target];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_quart_is_2_pints {
    MKQuantity *target = [@1 volume_quart];
    MKQuantity *expected = [@2 volume_pint];
    
    BOOL result = [expected isTheSame:target];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_gallon_is_4_quarts {
    MKQuantity *target = [@1 volume_gallon];
    MKQuantity *expected = [@4 volume_quart];
    
    BOOL result = [expected isTheSame:target];
    assertThatBool(result, equalToBool(YES));
}

@end
