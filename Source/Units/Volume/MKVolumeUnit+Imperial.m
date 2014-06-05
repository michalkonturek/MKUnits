//
//  MKVolumeUnit.m
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

#import "MKVolumeUnit.h"

@implementation MKVolumeUnit (Imperial)

+ (instancetype)fluidram {
    static NSString *name   = @"fluid dram";
    static NSString *symbol = @"fl dr";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:35516328125 exponent:-13 isNegative:NO];
    
//    3.5516328125 ml
//    35516328125
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)teaspoon {
    static NSString *name   = @"teaspoon";
    static NSString *symbol = @"tsp";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:591939 exponent:-8 isNegative:NO];
    
//    0.00591939
//    591939
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)tablespoon {
    static NSString *name   = @"tablespoon";
    static NSString *symbol = @"tbsp";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:177581714 exponent:-10 isNegative:NO];
    
//    17.7581714 ml
//    177581714
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)fluidounce {
    static NSString *name   = @"fluid ounce";
    static NSString *symbol = @"fl oz";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:284130625 exponent:-10 isNegative:NO];
    
//    28.4130625 mL
//    284130625
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)cup {
    static NSString *name   = @"cup";
    static NSString *symbol = @"cp";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:28413 exponent:-5 isNegative:NO];
    
//    284.13 ml
//    28413
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)pint {
    static NSString *name   = @"pint";
    static NSString *symbol = @"pt";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:56826125 exponent:-8 isNegative:NO];
    
//    0.56826125 L
//    56826125
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)quart {
    static NSString *name   = @"quart";
    static NSString *symbol = @"qt";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:11365225 exponent:-7 isNegative:NO];
    
//    1.1365225 L
//    11365225
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)gallon {
    static NSString *name   = @"gallon";
    static NSString *symbol = @"gal";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:454609 exponent:-5 isNegative:NO];
    
//    4.54609 L
//    454609
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

@end

@implementation MKQuantity (MKVolumeUnit_Imperial)

+ (instancetype)volume_fluidramWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKVolumeUnit fluidram]];
}

+ (instancetype)volume_teaspoonWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKVolumeUnit teaspoon]];
}

+ (instancetype)volume_tablespoonWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKVolumeUnit tablespoon]];
}

+ (instancetype)volume_fluidounceWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKVolumeUnit fluidounce]];
}

+ (instancetype)volume_cupWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKVolumeUnit cup]];
}

+ (instancetype)volume_pintWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKVolumeUnit pint]];
}

+ (instancetype)volume_quartWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKVolumeUnit quart]];
}

+ (instancetype)volume_gallonWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKVolumeUnit gallon]];
}

@end

@implementation NSNumber (MKVolumeUnit_Imperial)

- (MKQuantity *)volume_fluidram {
    return [MKQuantity volume_fluidramWithAmount:self];
}

- (MKQuantity *)volume_teaspoon {
    return [MKQuantity volume_teaspoonWithAmount:self];
}

- (MKQuantity *)volume_tablespoon {
    return [MKQuantity volume_tablespoonWithAmount:self];
}

- (MKQuantity *)volume_fluidounce {
    return [MKQuantity volume_fluidounceWithAmount:self];
}

- (MKQuantity *)volume_cup {
    return [MKQuantity volume_cupWithAmount:self];
}

- (MKQuantity *)volume_pint {
    return [MKQuantity volume_pintWithAmount:self];
}

- (MKQuantity *)volume_quart {
    return [MKQuantity volume_quartWithAmount:self];
}

- (MKQuantity *)volume_gallon {
    return [MKQuantity volume_gallonWithAmount:self];
}

@end
