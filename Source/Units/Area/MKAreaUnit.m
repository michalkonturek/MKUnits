//
//  MKAreaUnit.m
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

#import "MKAreaUnit.h"

@implementation MKAreaUnit

+ (instancetype)square_millimeter {
    static NSString *name   = @"square millimeter";
    static NSString *symbol = @"mm2";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:-6 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)square_centimeter {
    static NSString *name   = @"centimeter";
    static NSString *symbol = @"cm";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:-4 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)square_decimeter {
    static NSString *name   = @"square decimeter";
    static NSString *symbol = @"dm2";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:-2 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)square_meter {
    static NSString *name   = @"square meter";
    static NSString *symbol = @"m2";
    id ratio = [NSDecimalNumber one];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)are {
    static NSString *name   = @"are";
    static NSString *symbol = @"dam2";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:2 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)hectare {
    static NSString *name   = @"hectare";
    static NSString *symbol = @"hm2";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:4 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)square_kilometer {
    static NSString *name   = @"square kilometer";
    static NSString *symbol = @"km2";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:6 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

@end

@implementation MKQuantity (MKAreaUnit)

+ (instancetype)area_square_millimeterWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKAreaUnit square_millimeter]];
}

+ (instancetype)area_square_centimeterWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKAreaUnit square_centimeter]];
}

+ (instancetype)area_square_decimeterWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKAreaUnit square_decimeter]];
}

+ (instancetype)area_square_meterWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKAreaUnit square_meter]];
}

+ (instancetype)area_areWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKAreaUnit are]];
}

+ (instancetype)area_hectareWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKAreaUnit hectare]];
}

+ (instancetype)area_square_kilometerWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKAreaUnit square_kilometer]];
}

@end

@implementation NSNumber (MKAreaUnit_Imperial)

- (MKQuantity *)area_square_millimeter {
    return [MKQuantity area_square_millimeterWithAmount:self];
}

- (MKQuantity *)area_square_centimeter {
    return [MKQuantity area_square_centimeterWithAmount:self];
}

- (MKQuantity *)area_square_decimeter {
    return [MKQuantity area_square_decimeterWithAmount:self];
}

- (MKQuantity *)area_square_meter {
    return [MKQuantity area_square_meterWithAmount:self];
}

- (MKQuantity *)area_are {
    return [MKQuantity area_areWithAmount:self];
}

- (MKQuantity *)area_hectare {
    return [MKQuantity area_hectareWithAmount:self];
}

- (MKQuantity *)area_square_kilometer {
    return [MKQuantity area_square_kilometerWithAmount:self];
}

@end
