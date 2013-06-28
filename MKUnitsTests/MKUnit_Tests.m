//
//  MKUnit_Tests.m
//  MKUnits
//
//  Created by Michal Konturek on 27/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "Base_Tests.h"

@interface MKUnit_Tests : SenTestCase

@property (nonatomic, strong) MKUnit *test_class;

@end

@implementation MKUnit_Tests

- (void)setUp {
    self.test_class = [MKUnit create];
}

- (void)tearDown {
    self.test_class = nil;
}

- (void)test_create_default {
    assertThat(self.test_class, notNilValue());
    assertThat(self.test_class.name, equalToIgnoringCase(@"Unit"));
    assertThat(self.test_class.symbol, equalToIgnoringCase(@"unit"));
    assertThat(self.test_class.ratio, equalTo(@1));
}


@end
