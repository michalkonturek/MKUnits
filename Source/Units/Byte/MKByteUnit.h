//
//  MKByteUnit.h
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

#import "MKUnit.h"
#import "MKQuantity.h"

@interface MKByteUnit : MKUnit

+ (instancetype)bit;
+ (instancetype)kilobit;
+ (instancetype)megabit;
+ (instancetype)gigabit;
+ (instancetype)terabit;

+ (instancetype)crumb;
+ (instancetype)nibble;
+ (instancetype)byte;

+ (instancetype)kibibyte;
+ (instancetype)mebibyte;
+ (instancetype)gibibyte;
+ (instancetype)tebibyte;

+ (instancetype)kilobyte;
+ (instancetype)megabyte;
+ (instancetype)gigabyte;
+ (instancetype)terabyte;

@end

@interface MKQuantity (MKByteUnit)

+ (instancetype)byte_bitWithAmount:(NSNumber *)amount;
+ (instancetype)byte_kilobitWithAmount:(NSNumber *)amount;
+ (instancetype)byte_megabitWithAmount:(NSNumber *)amount;
+ (instancetype)byte_gigabitWithAmount:(NSNumber *)amount;
+ (instancetype)byte_terabitWithAmount:(NSNumber *)amount;

+ (instancetype)byte_crumbWithAmount:(NSNumber *)amount;
+ (instancetype)byte_nibblebWithAmount:(NSNumber *)amount;
+ (instancetype)byte_byteWithAmount:(NSNumber *)amount;

+ (instancetype)byte_kibibyteWithAmount:(NSNumber *)amount;
+ (instancetype)byte_mebibyteWithAmount:(NSNumber *)amount;
+ (instancetype)byte_gibibyteWithAmount:(NSNumber *)amount;
+ (instancetype)byte_tebibyteWithAmount:(NSNumber *)amount;

+ (instancetype)byte_kilobyteWithAmount:(NSNumber *)amount;
+ (instancetype)byte_megabyteWithAmount:(NSNumber *)amount;
+ (instancetype)byte_gigabyteWithAmount:(NSNumber *)amount;
+ (instancetype)byte_terabyteWithAmount:(NSNumber *)amount;

@end

@interface NSNumber (MKByteUnit)

- (MKQuantity *)byte_bit;
- (MKQuantity *)byte_kilobit;
- (MKQuantity *)byte_megabit;
- (MKQuantity *)byte_gigabit;
- (MKQuantity *)byte_terabit;

- (MKQuantity *)byte_crumb;
- (MKQuantity *)byte_nibbleb;
- (MKQuantity *)byte_byte;

- (MKQuantity *)byte_kibibyte;
- (MKQuantity *)byte_mebibyte;
- (MKQuantity *)byte_gibibyte;
- (MKQuantity *)byte_tebibyte;

- (MKQuantity *)byte_kilobyte;
- (MKQuantity *)byte_megabyte;
- (MKQuantity *)byte_gigabyte;
- (MKQuantity *)byte_terabyte;

@end
