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
- (void)test_one_hectolitre_is_100_litres {
    MKQuantity *target = [@1 volume_hectolitre];
    MKQuantity *expected = [@100 volume_litre];
    
    BOOL result = [expected isTheSame:target];
    assertThatBool(result, equalToBool(YES));
}
@end
