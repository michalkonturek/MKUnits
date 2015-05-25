//
//  MKLengthUnit_Tests.m
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

@interface MKLengthUnit_Tests : XCTestCase

@end

@implementation MKLengthUnit_Tests

- (void)test_one_centimeter_is_10_milimeters {
    MKQuantity *expected = [MKQuantity length_millimeterWithAmount:@10];
    BOOL result = [[MKQuantity length_centimeterWithAmount:@1] isTheSame:expected];
    assertThatBool(result, isTrue());
}

- (void)test_one_meter_is_100_centimeters {
    MKQuantity *expected = [MKQuantity length_centimeterWithAmount:@100];
    BOOL result = [[MKQuantity length_meterWithAmount:@1] isTheSame:expected];
    assertThatBool(result, isTrue());
}

- (void)test_one_kilometer_is_1000_meters {
    MKQuantity *expected = [MKQuantity length_meterWithAmount:@1000];
    BOOL result = [[MKQuantity length_kilometerWithAmount:@1] isTheSame:expected];
    assertThatBool(result, isTrue());
}

@end
