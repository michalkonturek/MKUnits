//
//  MKVolumeUnit_US_Tests.m
//  MKUnits
//
//  Created by Michal Konturek on 05/06/2014.
//  Copyright (c) 2014 Michal Konturek. All rights reserved.
//

#import "Base_Tests.h"

@interface MKVolumeUnit_US_Tests : XCTestCase

@end

@implementation MKVolumeUnit_US_Tests

- (void)test_one_fluidram_is_60_minims {
    MKQuantity *target = [@1 volume_us_fluidram];
    MKQuantity *expected = [@60 volume_us_minim];
    
    BOOL result = [expected isTheSame:target];
    assertThatBool(result, isTrue());
}

- (void)test_one_teaspoon_is_80_minims {
    MKQuantity *target = [@1 volume_us_teaspoon];
    MKQuantity *expected = [@80 volume_us_minim];
    
    BOOL result = [expected isTheSame:target];
    assertThatBool(result, isTrue());
}

- (void)test_one_tablespoon_is_4_fluidrams {
    MKQuantity *target = [@1 volume_us_tablespoon];
    MKQuantity *expected = [@4 volume_us_fluidram];
    
    BOOL result = [expected isTheSame:target];
    assertThatBool(result, isTrue());
}

- (void)test_one_tablespoon_is_3_teaspoons {
    MKQuantity *target = [@1 volume_us_tablespoon];
    MKQuantity *expected = [@3 volume_us_teaspoon];
    
    BOOL result = [expected isTheSame:target];
    assertThatBool(result, isTrue());
}

- (void)test_one_fluidounce_is_2_tablespoons {
    MKQuantity *target = [@1 volume_us_fluidounce];
    MKQuantity *expected = [@2 volume_us_tablespoon];
    
    BOOL result = [expected isTheSame:target];
    assertThatBool(result, isTrue());
}

- (void)test_one_gill_is_4_fluidounces {
    MKQuantity *target = [@1 volume_us_gill];
    MKQuantity *expected = [@4 volume_us_fluidounce];
    
    BOOL result = [expected isTheSame:target];
    assertThatBool(result, isTrue());
}

- (void)test_one_cup_is_2_gills {
    MKQuantity *target = [@1 volume_us_cup];
    MKQuantity *expected = [@2 volume_us_gill];
    
    BOOL result = [expected isTheSame:target];
    assertThatBool(result, isTrue());
}

- (void)test_one_pint_is_2_cups {
    MKQuantity *target = [@1 volume_us_pint];
    MKQuantity *expected = [@2 volume_us_cup];
    
    BOOL result = [expected isTheSame:target];
    assertThatBool(result, isTrue());
}

- (void)test_one_quart_is_2_pints {
    MKQuantity *target = [@1 volume_us_quart];
    MKQuantity *expected = [@2 volume_us_pint];
    
    BOOL result = [expected isTheSame:target];
    assertThatBool(result, isTrue());
}

- (void)test_one_gallon_is_4_quarts {
    MKQuantity *target = [@1 volume_us_gallon];
    MKQuantity *expected = [@4 volume_us_quart];
    
    BOOL result = [expected isTheSame:target];
    assertThatBool(result, isTrue());
}

- (void)test_one_barell_is_31_coma_5_gallons {
    MKQuantity *target = [@1 volume_us_barrel];
    MKQuantity *expected = [@31.5 volume_us_gallon];
    
    BOOL result = [expected isTheSame:target];
    assertThatBool(result, isTrue());
}

- (void)test_one_hogshead_is_63_gallons {
    MKQuantity *target = [@1 volume_us_hogshead];
    MKQuantity *expected = [@63 volume_us_gallon];
    
    BOOL result = [expected isTheSame:target];
    assertThatBool(result, isTrue());
}

@end
