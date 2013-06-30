//
//  MKArea_Tests.m
//  MKUnits
//
//  Created by Michal Konturek on 30/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "Base_Tests.h"

@interface MKArea_Tests : SenTestCase

@end

@implementation MKArea_Tests

- (void)test_one_sq_centimeter_is_100_sq_millimeters {
    MKQuantity *expected = [MKQuantity area_square_millimeterWithQuantity:@100];
    BOOL result = [[MKQuantity area_square_centimeterWithQuantity:@1]isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_sq_decimeter_is_100_sq_centimeters {
    MKQuantity *expected = [MKQuantity area_square_centimeterWithQuantity:@100];
    BOOL result = [[MKQuantity area_square_decimeterWithQuantity:@1]isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_sq_meter_is_10000_sq_centimeters {
    MKQuantity *expected = [MKQuantity area_square_centimeterWithQuantity:@10000];
    BOOL result = [[MKQuantity area_square_meterWithQuantity:@1]isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_are_is_100_sq_meters {
    MKQuantity *expected = [MKQuantity area_square_meterWithQuantity:@100];
    BOOL result = [[MKQuantity area_areWithQuantity:@1]isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_hectare_is_100_ares {
    MKQuantity *expected = [MKQuantity area_areWithQuantity:@100];
    BOOL result = [[MKQuantity area_hectareWithQuantity:@1]isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_sq_kilometer_is_1000000_sq_meters {
    MKQuantity *expected = [MKQuantity area_square_meterWithQuantity:@1000000];
    BOOL result = [[MKQuantity area_square_kilometerWithQuantity:@1]isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

@end
