//
//  MKByteUnit.h
//  MKUnits
//
//  Created by Michal Konturek on 29/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
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
