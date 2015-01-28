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

//- (void)test_1kcal_is_4186J {
//    MKQuantity *target = [MKQuantity energy_jouleWithAmount:@4186.8];
//    MKQuantity *expected = [MKQuantity energy_kiloCalorieWithAmount:@1];
//    BOOL maxIsGreater = [[MKQuantity energy_jouleWithAmount:@4186.8] isGreaterThan:expected];
//    BOOL minIsSmaller = [[MKQuantity energy_jouleWithAmount:@4186.7999] isLessThan:expected];
//    BOOL result = maxIsGreater && minIsSmaller; // percision won't let us compare via isTheSame:
//    
//    assertThatBool(result, equalToBool(YES));
//}

- (void)test_1_kilojoule_is_1000_joules {
    MKQuantity *target = [@1 energy_kiloJoule];
    MKQuantity *expected = [@1000 energy_joule];
    
    BOOL result = [target isTheSame:expected];
    assertThatBool(result, equalToBool(YES));
}

//- (void)test_1kJ_is_1000J {
//    MKQuantity *expected = [MKQuantity energy_kiloJouleWithAmount:@1];
//    BOOL result = [[MKQuantity energy_jouleWithAmount:@1000]isTheSame:expected];
//    
//    assertThatBool(result, equalToBool(YES));
//}


- (void)test_1_megajoule_is_1000_kilojoules {
    MKQuantity *target = [@1 energy_megaJoule];
    MKQuantity *expected = [@1000 energy_kiloJoule];
    
    BOOL result = [target isTheSame:expected];
    assertThatBool(result, equalToBool(YES));
}

//- (void)test_1MJ_is_100kJ {
//    MKQuantity *expected = [MKQuantity energy_megaJouleWithAmount:@1];
//    BOOL result = [[MKQuantity energy_kiloJouleWithAmount:@1000]isTheSame:expected];
//    
//    assertThatBool(result, equalToBool(YES));
//}

- (void)test_1_gigajoule_is_1000_megajoules {
    MKQuantity *target = [@1 energy_gigaJoule];
    MKQuantity *expected = [@1000 energy_megaJoule];
    
    BOOL result = [target isTheSame:expected];
    assertThatBool(result, equalToBool(YES));
}

//- (void)test_1GJ_is_1MJ {
//    MKQuantity *expected = [MKQuantity energy_gigaJouleWithAmount:@1];
//    BOOL result = [[MKQuantity energy_megaJouleWithAmount:@1000]isTheSame:expected];
//    
//    assertThatBool(result, equalToBool(YES));
//}

@end
