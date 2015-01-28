//
//  MKEnergyUnit_Tests.m
//  MKUnits
//
//  Created by Natalia Osiecka on 14.10.2014.
//  Copyright (c) 2014 Michal Konturek. All rights reserved.
//

#import "Base_Tests.h"

@interface MKEnergyUnit_Tests : XCTestCase

@end

@implementation MKEnergyUnit_Tests

- (void)test_one_kilocalorie_is_1000_calories {
    MKQuantity *target = [@1 energy_kiloCalorie];
    MKQuantity *expected = [@1000 energy_calorie];
    
    BOOL result = [target isTheSame:expected];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_kilocalorie_is_4186_point_8_jules {
    MKQuantity *target = [@1 energy_kiloCalorie];
    MKQuantity *expected = [@4186.8 energy_joule];
 
    BOOL result = [expected isTheSame:target withPrecision:1];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_1_kilojoule_is_1000_joules {
    MKQuantity *target = [@1 energy_kiloJoule];
    MKQuantity *expected = [@1000 energy_joule];
    
    BOOL result = [target isTheSame:expected];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_1_megajoule_is_1000_kilojoules {
    MKQuantity *target = [@1 energy_megaJoule];
    MKQuantity *expected = [@1000 energy_kiloJoule];
    
    BOOL result = [target isTheSame:expected];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_1_gigajoule_is_1000_megajoules {
    MKQuantity *target = [@1 energy_gigaJoule];
    MKQuantity *expected = [@1000 energy_megaJoule];
    
    BOOL result = [target isTheSame:expected];
    assertThatBool(result, equalToBool(YES));
}

@end
