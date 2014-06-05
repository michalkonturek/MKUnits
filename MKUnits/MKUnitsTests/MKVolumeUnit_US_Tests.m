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

- (void)test_one_gallon_is_4_quarts {
    MKQuantity *target = [@1 volume_fluidounce];
    MKQuantity *expected = [@4 volume_tablespoon];
    
    BOOL result = [expected isTheSame:target withPrecision:5];
    assertThatBool(result, equalToBool(YES));
}

@end
