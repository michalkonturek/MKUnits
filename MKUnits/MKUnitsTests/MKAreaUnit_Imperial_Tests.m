//
//  MKAreaUnit_Imperial_Tests.m
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

@interface MKAreaUnit_Imperial_Tests : XCTestCase

@end

@implementation MKAreaUnit_Imperial_Tests

- (void)test_one_sq_inch_is_6_coma_4516_sq_centimeters {
    MKQuantity *expected = [MKQuantity area_square_centimeterWithAmount:@6.4516];
    BOOL result = [[MKQuantity area_square_inchWithAmount:@1]isTheSame:expected];
    assertThatBool(result, isTrue());
}

- (void)test_one_sq_foot_is_144_sq_inches {
    MKQuantity *expected = [MKQuantity area_square_inchWithAmount:@144];
    BOOL result = [[MKQuantity area_square_footWithAmount:@1] isTheSame:expected];
    assertThatBool(result, isTrue());
}

- (void)test_one_sq_yard_is_9_sq_feet {
    MKQuantity *expected = [MKQuantity area_square_footWithAmount:@9];
    BOOL result = [[MKQuantity area_square_yardWithAmount:@1] isTheSame:expected];
    assertThatBool(result, isTrue());
}

- (void)test_one_acre_is_4840_sq_yards {
    MKQuantity *expected = [MKQuantity area_square_yardWithAmount:@4840];
    BOOL result = [[MKQuantity area_acreWithAmount:@1] isTheSame:expected];
    assertThatBool(result, isTrue());
}

- (void)test_one_sq_mile_is_640_sq_acres {    
    MKQuantity *expected = [MKQuantity area_acreWithAmount:@640];
    BOOL result = [[MKQuantity area_square_mileWithAmount:@1] isTheSame:expected withPrecision:8];
    assertThatBool(result, isTrue());
    
    /*
     640 acres is converted to 1.00000000012973032528709176197723934724 sq mi
     
     NSLog(@"%@", [expected convertTo:[MKAreaUnit square_mile]]);
     */
}

@end
