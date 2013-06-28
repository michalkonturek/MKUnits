//
//  Base_Tests.h
//
//  Created by Michal Konturek on 25/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//


#import <SenTestingKit/SenTestingKit.h>

#define HC_SHORTHAND
#import <OCHamcrest.h>

#import "MKUnits.h"

#import "NSDecimalNumber+Negative.h"
#import "MKUnit+Test.h"

#define TEST_PASSES assertThatBool(YES, equalToBool(YES));
#define TEST_FAILS  STFail(@"Test not implemented.");
#define TEST_NOT_IMPLEMENTED STFail(@"Test not implemented.");
