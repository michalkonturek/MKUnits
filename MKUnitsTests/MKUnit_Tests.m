//
//  MKUnit_Tests.m
//  MKUnits
//
//  Created by Michal Konturek on 27/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "Base_Tests.h"

@interface MKUnit_Tests : SenTestCase

@property (nonatomic, strong) MKUnit *unit_A;
@property (nonatomic, strong) MKUnit *unit_B;

@end

@implementation MKUnit_Tests

- (void)setUp {
    self.unit_A = [MKUnit unit_A];  // base unit
    self.unit_B = [MKUnit unit_B];
}

- (void)tearDown {
    self.unit_A = nil;
    self.unit_B = nil;
}

- (void)test_create {
    assertThat(self.unit_A, notNilValue());
    assertThat(self.unit_A.name, equalToIgnoringCase(@"Unit A"));
    assertThat(self.unit_A.symbol, equalToIgnoringCase(@"unit-a"));
    assertThat(self.unit_A.ratio, equalTo(@1));
}

- (void)test_convertFromBaseUnit {
    id result = [self.unit_B convertToBaseUnit:@2];
    assertThat(result, equalTo(@4));
}

- (void)test_convertToBaseUnit {
    id result = [self.unit_B convertFromBaseUnit:@2];
    assertThat(result, equalTo(@1));
}

- (void)test_description {
    id result = [self.unit_A description];
    assertThat(result, equalTo(@"unit-a"));
}

- (void)test_isEqual_returns_true_when_same_units {
    BOOL result = [self.unit_A isEqual:[MKUnit unit_A]];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isEqual_returns_false_when_diff_units {
    BOOL result = [self.unit_A isEqual:[MKUnit unit_B]];
    assertThatBool(result, equalToBool(NO));
}

@end
