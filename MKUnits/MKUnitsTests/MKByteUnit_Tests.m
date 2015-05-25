//
//  MKByteUnit_Tests.m
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

@interface MKByteUnit_Tests : XCTestCase

@end

@implementation MKByteUnit_Tests

- (void)test_one_kilobit_is_1000_bit {
    MKQuantity *expected = [MKQuantity byte_bitWithAmount:@1000];
    BOOL result = [[MKQuantity byte_kilobitWithAmount:@1]isTheSame:expected];
    assertThatBool(result, isTrue());
}

- (void)test_one_megabit_is_1000_kilobit {
    MKQuantity *expected = [MKQuantity byte_bitWithAmount:@1000];
    BOOL result = [[MKQuantity byte_kilobitWithAmount:@1]isTheSame:expected];
    assertThatBool(result, isTrue());
}

- (void)test_one_gigabit_is_1000_megabit {
    MKQuantity *expected = [MKQuantity byte_megabitWithAmount:@1000];
    BOOL result = [[MKQuantity byte_gigabitWithAmount:@1]isTheSame:expected];
    assertThatBool(result, isTrue());
}

- (void)test_one_terabit_is_1000_gigabit {
    MKQuantity *expected = [MKQuantity byte_gigabitWithAmount:@1000];
    BOOL result = [[MKQuantity byte_terabitWithAmount:@1]isTheSame:expected];
    assertThatBool(result, isTrue());
}

- (void)test_one_crumb_is_2_bits {
    MKQuantity *expected = [MKQuantity byte_bitWithAmount:@2];
    BOOL result = [[MKQuantity byte_crumbWithAmount:@1]isTheSame:expected];
    assertThatBool(result, isTrue());
}

- (void)test_one_nibble_is_4_bits {
    MKQuantity *expected = [MKQuantity byte_bitWithAmount:@4];
    BOOL result = [[MKQuantity byte_nibblebWithAmount:@1]isTheSame:expected];
    assertThatBool(result, isTrue());
}

- (void)test_one_byte_is_8_bits {
    MKQuantity *expected = [MKQuantity byte_bitWithAmount:@8];
    BOOL result = [[MKQuantity byte_byteWithAmount:@1]isTheSame:expected];
    assertThatBool(result, isTrue());
}

- (void)test_one_kibibyte_is_1024_bytes {
    MKQuantity *expected = [MKQuantity byte_byteWithAmount:@1024];
    BOOL result = [[MKQuantity byte_kibibyteWithAmount:@1]isTheSame:expected];
    assertThatBool(result, isTrue());
}

- (void)test_one_mebibyte_is_1024_kibibytes {
    MKQuantity *expected = [MKQuantity byte_kibibyteWithAmount:@1024];
    BOOL result = [[MKQuantity byte_mebibyteWithAmount:@1]isTheSame:expected];
    assertThatBool(result, isTrue());
}

- (void)test_one_gibibyte_is_1024_mebibytes {
    MKQuantity *expected = [MKQuantity byte_mebibyteWithAmount:@1024];
    BOOL result = [[MKQuantity byte_gibibyteWithAmount:@1]isTheSame:expected];
    assertThatBool(result, isTrue());
}

- (void)test_one_tebibyte_is_1024_gibibytes {
    MKQuantity *expected = [MKQuantity byte_gibibyteWithAmount:@1024];
    BOOL result = [[MKQuantity byte_tebibyteWithAmount:@1]isTheSame:expected];
    assertThatBool(result, isTrue());
}

- (void)test_one_kilobyte_is_1000_bytes {
    MKQuantity *expected = [MKQuantity byte_byteWithAmount:@1000];
    BOOL result = [[MKQuantity byte_kilobyteWithAmount:@1]isTheSame:expected];
    assertThatBool(result, isTrue());
}

- (void)test_one_megabyte_is_1000_kilobytes {
    MKQuantity *expected = [MKQuantity byte_kilobyteWithAmount:@1000];
    BOOL result = [[MKQuantity byte_megabyteWithAmount:@1]isTheSame:expected];
    assertThatBool(result, isTrue());
}

- (void)test_one_gigabyte_is_1000_megabytes {
    MKQuantity *expected = [MKQuantity byte_megabyteWithAmount:@1000];
    BOOL result = [[MKQuantity byte_gigabyteWithAmount:@1]isTheSame:expected];
    assertThatBool(result, isTrue());
}

- (void)test_one_terabyte_is_1000_gigabytes {
    MKQuantity *expected = [MKQuantity byte_gigabyteWithAmount:@1000];
    BOOL result = [[MKQuantity byte_terabyteWithAmount:@1]isTheSame:expected];
    assertThatBool(result, isTrue());
}


@end
