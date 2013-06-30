//
//  MKByteUnit_Tests.m
//  MKUnits
//
//  Created by Michal Konturek on 30/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "Base_Tests.h"

@interface MKByteUnit_Tests : SenTestCase

@end

@implementation MKByteUnit_Tests

- (void)test_one_kilobit_is_1000_bit {
    MKQuantity *expected = [MKQuantity byte_bitWithAmount:@1000];
    BOOL result = [[MKQuantity byte_kilobitWithAmount:@1]isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_megabit_is_1000_kilobit {
    MKQuantity *expected = [MKQuantity byte_bitWithAmount:@1000];
    BOOL result = [[MKQuantity byte_kilobitWithAmount:@1]isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_gigabit_is_1000_megabit {
    MKQuantity *expected = [MKQuantity byte_megabitWithAmount:@1000];
    BOOL result = [[MKQuantity byte_gigabitWithAmount:@1]isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_terabit_is_1000_gigabit {
    MKQuantity *expected = [MKQuantity byte_gigabitWithAmount:@1000];
    BOOL result = [[MKQuantity byte_terabitWithAmount:@1]isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_crumb_is_2_bits {
    MKQuantity *expected = [MKQuantity byte_bitWithAmount:@2];
    BOOL result = [[MKQuantity byte_crumbWithAmount:@1]isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_nibble_is_4_bits {
    MKQuantity *expected = [MKQuantity byte_bitWithAmount:@4];
    BOOL result = [[MKQuantity byte_nibblebWithAmount:@1]isTheSame:expected];

    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_byte_is_8_bits {
    MKQuantity *expected = [MKQuantity byte_bitWithAmount:@8];
    BOOL result = [[MKQuantity byte_byteWithAmount:@1]isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_kibibyte_is_1024_bytes {
    MKQuantity *expected = [MKQuantity byte_byteWithAmount:@1024];
    BOOL result = [[MKQuantity byte_kibibyteWithAmount:@1]isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_mebibyte_is_1024_kibibytes {
    MKQuantity *expected = [MKQuantity byte_kibibyteWithAmount:@1024];
    BOOL result = [[MKQuantity byte_mebibyteWithAmount:@1]isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_gibibyte_is_1024_mebibytes {
    MKQuantity *expected = [MKQuantity byte_mebibyteWithAmount:@1024];
    BOOL result = [[MKQuantity byte_gibibyteWithAmount:@1]isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_tebibyte_is_1024_gibibytes {
    MKQuantity *expected = [MKQuantity byte_gibibyteWithAmount:@1024];
    BOOL result = [[MKQuantity byte_tebibyteWithAmount:@1]isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_kilobyte_is_1000_bytes {
    MKQuantity *expected = [MKQuantity byte_byteWithAmount:@1000];
    BOOL result = [[MKQuantity byte_kilobyteWithAmount:@1]isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_megabyte_is_1000_kilobytes {
    MKQuantity *expected = [MKQuantity byte_kilobyteWithAmount:@1000];
    BOOL result = [[MKQuantity byte_megabyteWithAmount:@1]isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_gigabyte_is_1000_megabytes {
    MKQuantity *expected = [MKQuantity byte_megabyteWithAmount:@1000];
    BOOL result = [[MKQuantity byte_gigabyteWithAmount:@1]isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_terabyte_is_1000_gigabytes {
    MKQuantity *expected = [MKQuantity byte_gigabyteWithAmount:@1000];
    BOOL result = [[MKQuantity byte_terabyteWithAmount:@1]isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}


@end
