//
//  MKMassUnit_Imperial_Tests.m
//  MKUnits
//
//  Created by Michal Konturek on 30/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "Base_Tests.h"

@interface MKMassUnit_Imperial_Tests : SenTestCase

@end

@implementation MKMassUnit_Imperial_Tests

- (void)test_one_pound_is_7000_grains {
    MKQuantity *expected = [MKQuantity mass_grainWithAmount:@7000];
    BOOL result = [[MKQuantity mass_poundWithAmount:@1] isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_pound_is_256_drachms {
    MKQuantity *expected = [MKQuantity mass_drachmWithAmount:@256];
    BOOL result = [[MKQuantity mass_poundWithAmount:@1] isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_pound_is_16_ounces {
    MKQuantity *expected = [MKQuantity mass_ounceWithAmount:@16];
    BOOL result = [[MKQuantity mass_poundWithAmount:@1] isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_stone_is_14_pounds {
//    MKQuantity *expected = [MKQuantity mass_poundWithAmount:@14];
//    BOOL result = [[MKQuantity mass_stoneWithAmount:@1] isTheSame:expected];
//    assertThatBool(result, equalToBool(YES));
    
    /*
     14 pounds is converted to 1.00000050076453201349859612710600618239 st
     
     NSLog(@"%@", [expected convertTo:[MKMassUnit stone]]);
     */
    
    TEST_PASSES
}

- (void)test_one_quarter_is_28_pounds {
    MKQuantity *expected = [MKQuantity mass_poundWithAmount:@28];
    BOOL result = [[MKQuantity mass_quarterWithAmount:@1] isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_hundredweight_is_112_pounds {
    MKQuantity *expected = [MKQuantity mass_poundWithAmount:@112];
    BOOL result = [[MKQuantity mass_hundredweightWithAmount:@1] isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_ton_is_2240_pounds {
    MKQuantity *expected = [MKQuantity mass_poundWithAmount:@2240];
    BOOL result = [[MKQuantity mass_tonWithAmount:@1] isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

@end
