//
//  MKByteUnit.m
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

#import "MKByteUnit.h"

@implementation MKByteUnit

+ (instancetype)bit {
    static NSString *name   = @"bit";
    static NSString *symbol = @"b";
    id ratio = [NSDecimalNumber one];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)kilobit {
    static NSString *name   = @"kilobit";
    static NSString *symbol = @"kb";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:3 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)megabit {
    static NSString *name   = @"megabit";
    static NSString *symbol = @"Mb";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:6 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)gigabit {
    static NSString *name   = @"gigabit";
    static NSString *symbol = @"Gb";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:9 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)terabit {
    static NSString *name   = @"terabit";
    static NSString *symbol = @"Tb";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:12 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)crumb {
    static NSString *name   = @"crumb";
    static NSString *symbol = @"crumb";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:2 exponent:0 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)nibble {
    static NSString *name   = @"nibble";
    static NSString *symbol = @"nibble";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:4 exponent:0 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)byte {
    static NSString *name   = @"byte";
    static NSString *symbol = @"B";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:8 exponent:0 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)kibibyte {
    static NSString *name   = @"kibibyte";
    static NSString *symbol = @"KiB";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:(8ULL << 10) exponent:0 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)mebibyte {
    static NSString *name   = @"mebibyte";
    static NSString *symbol = @"MiB";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:(8ULL << 20) exponent:0 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)gibibyte {
    static NSString *name   = @"gibibyte";
    static NSString *symbol = @"GiB";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:(8ULL << 30) exponent:0 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)tebibyte {
    static NSString *name   = @"tebibyte";
    static NSString *symbol = @"TiB";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:(8ULL << 40) exponent:0 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)kilobyte {
    static NSString *name   = @"kilobyte";
    static NSString *symbol = @"kB";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:8 exponent:3 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)megabyte {
    static NSString *name   = @"megabyte";
    static NSString *symbol = @"MB";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:8 exponent:6 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)gigabyte {
    static NSString *name   = @"gigabyte";
    static NSString *symbol = @"GB";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:8 exponent:9 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)terabyte {
    static NSString *name   = @"terabyte";
    static NSString *symbol = @"TB";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:8 exponent:12 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

@end

@implementation MKQuantity (MKByteUnit)

+ (instancetype)byte_bitWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKByteUnit bit]];
}

+ (instancetype)byte_kilobitWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKByteUnit kilobit]];
}

+ (instancetype)byte_megabitWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKByteUnit megabit]];
}

+ (instancetype)byte_gigabitWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKByteUnit gigabit]];
}

+ (instancetype)byte_terabitWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKByteUnit terabit]];
}

+ (instancetype)byte_crumbWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKByteUnit crumb]];
}

+ (instancetype)byte_nibblebWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKByteUnit nibble]];
}

+ (instancetype)byte_byteWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKByteUnit byte]];
}

+ (instancetype)byte_kibibyteWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKByteUnit kibibyte]];
}

+ (instancetype)byte_mebibyteWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKByteUnit mebibyte]];
}

+ (instancetype)byte_gibibyteWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKByteUnit gibibyte]];
}

+ (instancetype)byte_tebibyteWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKByteUnit tebibyte]];
}

+ (instancetype)byte_kilobyteWithAmount:(NSNumber *)amount  {
    return [self createWithAmount:amount withUnit:[MKByteUnit kilobyte]];
}

+ (instancetype)byte_megabyteWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKByteUnit megabyte]];
}

+ (instancetype)byte_gigabyteWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKByteUnit gigabyte]];
}

+ (instancetype)byte_terabyteWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKByteUnit terabyte]];
}

@end

@implementation NSNumber (MKByteUnit)

- (MKQuantity *)byte_bit {
    return [MKQuantity byte_bitWithAmount:self];
}

- (MKQuantity *)byte_kilobit {
    return [MKQuantity byte_kilobitWithAmount:self];
}

- (MKQuantity *)byte_megabit {
    return [MKQuantity byte_megabitWithAmount:self];
}

- (MKQuantity *)byte_gigabit {
    return [MKQuantity byte_gigabitWithAmount:self];
}

- (MKQuantity *)byte_terabit {
    return [MKQuantity byte_terabitWithAmount:self];
}

- (MKQuantity *)byte_crumb {
    return [MKQuantity byte_crumbWithAmount:self];
}

- (MKQuantity *)byte_nibbleb {
    return [MKQuantity byte_nibblebWithAmount:self];
}

- (MKQuantity *)byte_byte {
    return [MKQuantity byte_byteWithAmount:self];
}

- (MKQuantity *)byte_kibibyte {
    return [MKQuantity byte_kibibyteWithAmount:self];
}

- (MKQuantity *)byte_mebibyte {
    return [MKQuantity byte_mebibyteWithAmount:self];
}

- (MKQuantity *)byte_gibibyte {
    return [MKQuantity byte_gibibyteWithAmount:self];
}

- (MKQuantity *)byte_tebibyte {
    return [MKQuantity byte_tebibyteWithAmount:self];
}

- (MKQuantity *)byte_kilobyte {
    return [MKQuantity byte_kilobyteWithAmount:self];
}

- (MKQuantity *)byte_megabyte {
    return [MKQuantity byte_megabyteWithAmount:self];
}

- (MKQuantity *)byte_gigabyte {
    return [MKQuantity byte_gigabyteWithAmount:self];
}

- (MKQuantity *)byte_terabyte {
    return [MKQuantity byte_terabyteWithAmount:self];
}

@end
