//
//  MKUnit_Tests.m
//  MKUnits
//
//  Created by Michal Konturek on 27/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "Base_Tests.h"

@interface MKUnit_Tests : SenTestCase

@property (nonatomic, strong) MKMassUnit *kilogram;
@property (nonatomic, strong) MKMassUnit *gram;

@end

@implementation MKUnit_Tests

- (void)setUp {
    self.kilogram = [MKMassUnit kilogram];
    self.gram = [MKMassUnit gram];
}

- (void)tearDown {
    self.kilogram = nil;
    self.gram = nil;
}

- (void)test_create {
    assertThat(self.kilogram, notNilValue());
    assertThat(self.kilogram.name, equalToIgnoringCase(@"kilogram"));
    assertThat(self.kilogram.symbol, equalToIgnoringCase(@"kg"));
    assertThat(self.kilogram.ratio, equalTo(@1));
}

- (void)test_convertAmountFromTo_no_exception_when_same_group {
    STAssertNoThrow([self.kilogram convertAmount:@1 to:[MKMassUnit pound]], @"");
}

- (void)test_convertAmountFromTo_throws_exception_when_diff_groups {
    STAssertThrows([self.kilogram convertAmount:@1 to:[MKLengthUnit meter]], @"");
}

- (void)test_convertFromBaseUnit {
    id result = [self.gram convertToBaseUnit:@600];
    assertThat(result, equalTo(@0.6));
}

- (void)test_convertToBaseUnit {
    id result = [self.gram convertFromBaseUnit:@0.2];
    assertThat(result, equalTo(@200));
}

- (void)test_description {
    id result = [self.kilogram description];
    assertThat(result, equalTo(@"kg"));
}

- (void)test_isEqual_returns_true {
    BOOL result = [self.kilogram isEqual:[MKMassUnit kilogram]];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isEqual_returns_false_when_diff_units_but_same_group {
    BOOL result = [self.kilogram isEqual:[MKMassUnit gram]];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isEqual_returns_false_when_diff_units_and_diff_group {
    BOOL result = [self.kilogram isEqual:[MKLengthUnit centimeter]];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_hash {
    BOOL result = ([[MKMassUnit kilogram] hash] == [[MKMassUnit grain] hash]);
    assertThatBool(result, equalToBool(NO));
    
    result = ([[MKMassUnit megagram] hash] == [[MKMassUnit milligram] hash]);
    assertThatBool(result, equalToBool(NO));
}

@end
