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

- (void)test_1kcal_is_1000cal {
    MKQuantity *expected = [MKQuantity energy_kiloCalorieWithAmount:@1];
    BOOL result = [[MKQuantity energy_calorieWithAmount:@1000]isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_1kcal_is_4186J {
    MKQuantity *expected = [MKQuantity energy_kiloCalorieWithAmount:@1];
    BOOL maxIsGreater = [[MKQuantity energy_jouleWithAmount:@4186.8] isGreaterThan:expected];
    BOOL minIsSmaller = [[MKQuantity energy_jouleWithAmount:@4186.7999] isLessThan:expected];
    BOOL result = maxIsGreater && minIsSmaller; // percision won't let us compare via isTheSame:
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_1kJ_is_1000J {
    MKQuantity *expected = [MKQuantity energy_kiloJouleWithAmount:@1];
    BOOL result = [[MKQuantity energy_jouleWithAmount:@1000]isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_1MJ_is_100kJ {
    MKQuantity *expected = [MKQuantity energy_megaJouleWithAmount:@1];
    BOOL result = [[MKQuantity energy_kiloJouleWithAmount:@1000]isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_1GJ_is_1MJ {
    MKQuantity *expected = [MKQuantity energy_gigaJouleWithAmount:@1];
    BOOL result = [[MKQuantity energy_megaJouleWithAmount:@1000]isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

@end
