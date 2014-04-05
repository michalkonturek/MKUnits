//
//  MKMassUnit+Imperial.m
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

#import "MKMassUnit+Imperial.h"

@implementation MKMassUnit (Imperial)

// source: http://en.wikipedia.org/wiki/Imperial_units


+ (instancetype)grain {
    static NSString *name   = @"grain";
    static NSString *symbol = @"gr";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:6479891 exponent:-11 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)drachm {
    static NSString *name   = @"drachm";
    static NSString *symbol = @"dr";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:17718451953125 exponent:-16 isNegative:NO];
    
//    1.7718451953125 g
//    0.0017718451953125 kg
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)ounce {
    static NSString *name   = @"ounce";
    static NSString *symbol = @"oz";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:28349523125 exponent:-12 isNegative:NO];

//    28.349523125 g
//    0.028349523125 kg
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)pound {
    static NSString *name   = @"pound";
    static NSString *symbol = @"lb";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:45359237 exponent:-8 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)stone {
    static NSString *name   = @"stone";
    static NSString *symbol = @"st";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:635029 exponent:-5 isNegative:NO];
        
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)quarter {
    static NSString *name   = @"quarter";
    static NSString *symbol = @"qtr";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1270058636 exponent:-8 isNegative:NO];
    
//    12.70058636 kg
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)hundredweight {
    static NSString *name   = @"hundredweight";
    static NSString *symbol = @"cwt";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:5080234544 exponent:-8 isNegative:NO];
    
//    50.80234544 kg
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)ton {
    static NSString *name   = @"ton";
    static NSString *symbol = @"t";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:10160469088 exponent:-7 isNegative:NO];
    
//    1,016.0469088 kg
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}


@end

@implementation MKQuantity (MKMassUnit_Imperial)

+ (instancetype)mass_grainWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKMassUnit grain]];
}

+ (instancetype)mass_drachmWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKMassUnit drachm]];
}

+ (instancetype)mass_ounceWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKMassUnit ounce]];
}

+ (instancetype)mass_poundWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKMassUnit pound]];
}

+ (instancetype)mass_stoneWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKMassUnit stone]];
}

+ (instancetype)mass_quarterWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKMassUnit quarter]];
}

+ (instancetype)mass_hundredweightWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKMassUnit hundredweight]];
}

+ (instancetype)mass_tonWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKMassUnit ton]];
}

@end

@implementation NSNumber (MKMassUnit_Imperial)

- (MKQuantity *)mass_grain {
    return [MKQuantity mass_grainWithAmount:self];
}

- (MKQuantity *)mass_drachm {
    return [MKQuantity mass_drachmWithAmount:self];
}

- (MKQuantity *)mass_ounce {
    return [MKQuantity mass_ounceWithAmount:self];
}

- (MKQuantity *)mass_pound {
    return [MKQuantity mass_poundWithAmount:self];
}

- (MKQuantity *)mass_stone {
    return [MKQuantity mass_stoneWithAmount:self];
}

- (MKQuantity *)mass_quarter {
    return [MKQuantity mass_quarterWithAmount:self];
}

- (MKQuantity *)mass_hundredweight {
    return [MKQuantity mass_hundredweightWithAmount:self];
}

- (MKQuantity *)mass_ton {
    return [MKQuantity mass_tonWithAmount:self];
}

@end
