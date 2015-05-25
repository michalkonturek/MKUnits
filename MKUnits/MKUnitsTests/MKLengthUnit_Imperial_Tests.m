//
//  MKLengthUnit_Imperial_Tests.m
//  MKUnits
//
//  Copyright (c) 2013 Michal Konturek
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "Base_Tests.h"

@interface MKLengthUnit_Imperial_Tests : XCTestCase

@end

@implementation MKLengthUnit_Imperial_Tests

- (void)test_one_foot_is_12_inches {
    MKQuantity *expected = [MKQuantity length_inchWithAmount:@12];
    BOOL result = [[MKQuantity length_footWithAmount:@1] isTheSame:expected];
    assertThatBool(result, isTrue());
}

- (void)test_one_yard_is_3_feet {
    MKQuantity *expected = [MKQuantity length_footWithAmount:@3];
    BOOL result = [[MKQuantity length_yardWithAmount:@1] isTheSame:expected];
    assertThatBool(result, isTrue());
}

- (void)test_one_chain_is_22_yards {
    MKQuantity *expected = [MKQuantity length_yardWithAmount:@22];
    BOOL result = [[MKQuantity length_chainWithAmount:@1] isTheSame:expected];
    assertThatBool(result, isTrue());
}

- (void)test_one_furlong_is_10_chains {
    MKQuantity *expected = [MKQuantity length_chainWithAmount:@10];
    BOOL result = [[MKQuantity length_furlongWithAmount:@1] isTheSame:expected];
    assertThatBool(result, isTrue());
}

- (void)test_one_mile_is_5280_feet {
    MKQuantity *expected = [MKQuantity length_footWithAmount:@5280];
    BOOL result = [[MKQuantity length_mileWithAmount:@1] isTheSame:expected];
    assertThatBool(result, isTrue());
}

- (void)test_one_nautical_mile_is_6080_feet {
    MKQuantity *expected = [MKQuantity length_footWithAmount:@6080];
    BOOL result = [[MKQuantity length_nautical_mileWithAmount:@1] isTheSame:expected];
    assertThatBool(result, isTrue());
}

@end
