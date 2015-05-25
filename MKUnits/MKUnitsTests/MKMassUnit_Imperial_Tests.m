//
//  MKMassUnit_Imperial_Tests.m
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

@interface MKMassUnit_Imperial_Tests : XCTestCase

@end

@implementation MKMassUnit_Imperial_Tests

- (void)test_one_pound_is_7000_grains {
    MKQuantity *expected = [MKQuantity mass_grainWithAmount:@7000];
    BOOL result = [[MKQuantity mass_poundWithAmount:@1] isTheSame:expected];
    assertThatBool(result, isTrue());
}

- (void)test_one_pound_is_256_drachms {
    MKQuantity *expected = [MKQuantity mass_drachmWithAmount:@256];
    BOOL result = [[MKQuantity mass_poundWithAmount:@1] isTheSame:expected];
    assertThatBool(result, isTrue());
}

- (void)test_one_pound_is_16_ounces {
    MKQuantity *expected = [MKQuantity mass_ounceWithAmount:@16];
    BOOL result = [[MKQuantity mass_poundWithAmount:@1] isTheSame:expected];
    assertThatBool(result, isTrue());
}

- (void)test_one_stone_is_14_pounds {
    MKQuantity *expected = [MKQuantity mass_poundWithAmount:@14];
    BOOL result = [[MKQuantity mass_stoneWithAmount:@1] isTheSame:expected withPrecision:5];
    assertThatBool(result, isTrue());
    
    /*
     14 pounds is converted to 1.00000050076453201349859612710600618239 st
     
     NSLog(@"%@", [expected convertTo:[MKMassUnit stone]]);
     */
}

- (void)test_one_quarter_is_28_pounds {
    MKQuantity *expected = [MKQuantity mass_poundWithAmount:@28];
    BOOL result = [[MKQuantity mass_quarterWithAmount:@1] isTheSame:expected];
    assertThatBool(result, isTrue());
}

- (void)test_one_hundredweight_is_112_pounds {
    MKQuantity *expected = [MKQuantity mass_poundWithAmount:@112];
    BOOL result = [[MKQuantity mass_hundredweightWithAmount:@1] isTheSame:expected];
    assertThatBool(result, isTrue());
}

- (void)test_one_ton_is_2240_pounds {
    MKQuantity *expected = [MKQuantity mass_poundWithAmount:@2240];
    BOOL result = [[MKQuantity mass_tonWithAmount:@1] isTheSame:expected];
    assertThatBool(result, isTrue());
}

@end
