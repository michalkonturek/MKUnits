//
//  MKArea_Tests.m
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

@interface MKArea_Tests : SenTestCase

@end

@implementation MKArea_Tests

- (void)test_one_sq_centimeter_is_100_sq_millimeters {
    MKQuantity *expected = [MKQuantity area_square_millimeterWithAmount:@100];
    BOOL result = [[MKQuantity area_square_centimeterWithAmount:@1]isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_sq_decimeter_is_100_sq_centimeters {
    MKQuantity *expected = [MKQuantity area_square_centimeterWithAmount:@100];
    BOOL result = [[MKQuantity area_square_decimeterWithAmount:@1]isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_sq_meter_is_10000_sq_centimeters {
    MKQuantity *expected = [MKQuantity area_square_centimeterWithAmount:@10000];
    BOOL result = [[MKQuantity area_square_meterWithAmount:@1]isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_are_is_100_sq_meters {
    MKQuantity *expected = [MKQuantity area_square_meterWithAmount:@100];
    BOOL result = [[MKQuantity area_areWithAmount:@1]isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_hectare_is_100_ares {
    MKQuantity *expected = [MKQuantity area_areWithAmount:@100];
    BOOL result = [[MKQuantity area_hectareWithAmount:@1]isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_sq_kilometer_is_1000000_sq_meters {
    MKQuantity *expected = [MKQuantity area_square_meterWithAmount:@1000000];
    BOOL result = [[MKQuantity area_square_kilometerWithAmount:@1]isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

@end
