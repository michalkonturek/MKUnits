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

+ (instancetype)gallon {
    static NSString *name   = @"gallon";
    static NSString *symbol = @"gal";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:128 exponent:0 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)quart {
    static NSString *name   = @"quart";
    static NSString *symbol = @"qt";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:32 exponent:0 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)pint {
    static NSString *name   = @"pint";
    static NSString *symbol = @"pt";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:16 exponent:0 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)cup {
    static NSString *name   = @"cup";
    static NSString *symbol = @"c";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:8 exponent:0 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)tablespoon {
    static NSString *name   = @"tablespoon";
    static NSString *symbol = @"tbsp";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:5 exponent:-1 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)teaspoon {
    static NSString *name   = @"teaspoon";
    static NSString *symbol = @"tsp";
    id ratio = [[NSDecimalNumber one] decimalNumberByDividingBy:[NSDecimalNumber decimalNumberWithString:@"6.0"]];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)fluidounce {
    static NSString *name   = @"fluid ounce";
    static NSString *symbol = @"fl oz";
    id ratio = [NSDecimalNumber one];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

@end

@implementation MKQuantity (MKVolumeUnit_Imperial)

+ (instancetype)volume_gallonWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKVolumeUnit gallon]];
}

+ (instancetype)volume_quartWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKVolumeUnit quart]];
}

+ (instancetype)volume_pintWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKVolumeUnit pint]];
}

+ (instancetype)volume_cupWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKVolumeUnit cup]];
}

+ (instancetype)volume_tablespoonWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKVolumeUnit tablespoon]];
}

+ (instancetype)volume_teaspoonWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKVolumeUnit teaspoon]];
}

+ (instancetype)volume_fluidounceWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKVolumeUnit fluidounce]];
}

- (instancetype)volume_convertToCup {
    return [self convertTo:[MKVolumeUnit cup]];
}

- (instancetype)volume_convertToFluidOunce {
    return [self convertTo:[MKVolumeUnit fluidounce]];
}

@end

@implementation NSNumber (MKVolumeUnit_Imperial)

- (MKQuantity *)volume_gallon {
    return [MKQuantity volume_gallonWithAmount:self];
}

- (MKQuantity *)volume_quart {
    return [MKQuantity volume_quartWithAmount:self];
}

- (MKQuantity *)volume_pint {
    return [MKQuantity volume_pintWithAmount:self];
}

- (MKQuantity *)volume_cup {
    return [MKQuantity volume_cupWithAmount:self];
}

- (MKQuantity *)volume_tablespoon {
    return [MKQuantity volume_tablespoonWithAmount:self];
}

- (MKQuantity *)volume_teaspoon {
    return [MKQuantity volume_teaspoonWithAmount:self];
}

- (MKQuantity *)volume_fluidounce {
    return [MKQuantity volume_fluidounceWithAmount:self];
}

@end
