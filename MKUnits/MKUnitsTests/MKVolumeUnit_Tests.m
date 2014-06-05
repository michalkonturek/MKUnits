//
//  MKVolumeUnit_Tests.m
//  MKUnits
//
//  Created by Michal Konturek on 02/06/2014.
//  Copyright (c) 2014 Michal Konturek. All rights reserved.
//

#import "Base_Tests.h"

@interface MKVolumeUnit_Tests : XCTestCase

@end

@implementation MKVolumeUnit_Tests

- (void)test_one_millilitre_is_1000_microlitres {
    MKQuantity *target = [@1 volume_millilitre];
    MKQuantity *expected = [@1000 volume_microlitre];
    
    BOOL result = [expected isTheSame:target];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_centilitre_is_10_millilitres {
    MKQuantity *target = [@1 volume_centilitre];
    MKQuantity *expected = [@10 volume_millilitre];
    
    BOOL result = [expected isTheSame:target];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_decilitre_is_10_centilitre {
    MKQuantity *target = [@1 volume_decilitre];
    MKQuantity *expected = [@10 volume_centilitre];
    
    BOOL result = [expected isTheSame:target];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_litre_is_1000_millilitres {
    MKQuantity *target = [@1 volume_litre];
    MKQuantity *expected = [@1000 volume_millilitre];
    
    BOOL result = [expected isTheSame:target];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_hectolitre_is_100_litres {
    MKQuantity *target = [@1 volume_hectolitre];
    MKQuantity *expected = [@100 volume_litre];
    
    BOOL result = [expected isTheSame:target];
    assertThatBool(result, equalToBool(YES));
}

@end
