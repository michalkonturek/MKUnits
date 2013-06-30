//
//  MKLengthUnit_Tests.m
//  MKUnits
//
//  Created by Michal Konturek on 30/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "Base_Tests.h"

@interface MKLengthUnit_Tests : SenTestCase

@end

@implementation MKLengthUnit_Tests

- (void)test_one_centimeter_is_10_milimeters {
    MKQuantity *expected = [MKQuantity length_millimeterWithAmount:@10];
    BOOL result = [[MKQuantity length_centimeterWithAmount:@1]isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_meter_is_100_centimeters {
    MKQuantity *expected = [MKQuantity length_centimeterWithAmount:@100];
    BOOL result = [[MKQuantity length_meterWithAmount:@1]isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_kilometer_is_1000_meters {
    MKQuantity *expected = [MKQuantity length_meterWithAmount:@1000];
    BOOL result = [[MKQuantity length_kilometerWithAmount:@1]isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

@end
