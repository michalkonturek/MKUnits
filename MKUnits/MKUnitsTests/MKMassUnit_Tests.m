//
//  MKMassUnit_Tests.m
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

@interface MKMassUnit_Tests : XCTestCase

@end

@implementation MKMassUnit_Tests

- (void)test_one_gram_is_1000_miligrams {
    MKQuantity *expected = [MKQuantity mass_milligramWithAmount:@1000];
    BOOL result = [[MKQuantity mass_gramWithAmount:@1] isTheSame:expected];
    assertThatBool(result, isTrue());
}

- (void)test_one_decagram_is_10_grams {
    MKQuantity *expected = [MKQuantity mass_gramWithAmount:@10];
    BOOL result = [[MKQuantity mass_decagramWithAmount:@1] isTheSame:expected];
    assertThatBool(result, isTrue());
}

- (void)test_one_kilogram_is_1000_grams {
    MKQuantity *expected = [MKQuantity mass_gramWithAmount:@1000];
    BOOL result = [[MKQuantity mass_kilogramWithAmount:@1] isTheSame:expected];
    assertThatBool(result, isTrue());
}

- (void)test_one_megagram_is_1000_killograms {
    MKQuantity *expected = [MKQuantity mass_kilogramWithAmount:@1000];
    BOOL result = [[MKQuantity mass_megagramWithAmount:@1] isTheSame:expected];
    assertThatBool(result, isTrue());
}

- (void)test_one_tonne_is_one_megagram {
    MKQuantity *expected = [MKQuantity mass_megagramWithAmount:@1];
    BOOL result = [[MKQuantity mass_tonneWithAmount:@1] isTheSame:expected];
    assertThatBool(result, isTrue());
}

- (void)test_nsnumber_category {
    id expected = [@1000 mass_gram];
    BOOL result = [[@1 mass_kilogram] isTheSame:expected];
    assertThatBool(result, isTrue());
}

@end
