//
//  MKMassUnit_Tests.m
//  MKUnits
//
//  Created by Michal Konturek on 30/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "Base_Tests.h"

@interface MKMassUnit_Tests : SenTestCase

@end

@implementation MKMassUnit_Tests

- (void)test_one_gram_is_1000_miligrams {
    MKQuantity *expected = [MKQuantity mass_milligramWithAmount:@1000];
    BOOL result = [[MKQuantity mass_gramWithAmount:@1] isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_decagram_is_10_grams {
    MKQuantity *expected = [MKQuantity mass_gramWithAmount:@10];
    BOOL result = [[MKQuantity mass_decagramWithAmount:@1] isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_kilogram_is_1000_grams {
    MKQuantity *expected = [MKQuantity mass_gramWithAmount:@1000];
    BOOL result = [[MKQuantity mass_kilogramWithAmount:@1] isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_megagram_is_1000_killograms {
    MKQuantity *expected = [MKQuantity mass_kilogramWithAmount:@1000];
    BOOL result = [[MKQuantity mass_megagramWithAmount:@1] isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_tonne_is_one_megagram {
    MKQuantity *expected = [MKQuantity mass_megagramWithAmount:@1];
    BOOL result = [[MKQuantity mass_tonneWithAmount:@1] isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_nsnumber_category {
    id expected = [@1000 mass_gram];
    BOOL result = [[@1 mass_kilogram] isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

@end
