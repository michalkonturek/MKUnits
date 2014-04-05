//
//  MKMassUnit.m
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

#import "MKMassUnit.h"

@implementation MKMassUnit

+ (instancetype)milligram {
    static NSString *name   = @"milligram";
    static NSString *symbol = @"mg";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:-6 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)gram {
    static NSString *name   = @"gram";
    static NSString *symbol = @"g";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:-3 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)decagram {
    static NSString *name   = @"decagram";
    static NSString *symbol = @"dag";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:-2 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)kilogram {
    static NSString *name   = @"kilogram";
    static NSString *symbol = @"kg";
    id ratio = [NSDecimalNumber one];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)megagram {
    static NSString *name   = @"megagram";
    static NSString *symbol = @"Mg";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:3 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)tonne {
    static NSString *name   = @"tonne";
    
    /*
     NOTE:
     There is a collision of symbols between tonne and imperial ton.
     As tonne is a different name for megagram, use Mg istead of t.
     */
    
    static NSString *symbol = @"Mg";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:3 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

@end

@implementation MKQuantity (MKMassUnit)

+ (instancetype)mass_milligramWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKMassUnit milligram]];
}

+ (instancetype)mass_gramWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKMassUnit gram]];
}

+ (instancetype)mass_decagramWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKMassUnit decagram]];
}

+ (instancetype)mass_kilogramWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKMassUnit kilogram]];
}

+ (instancetype)mass_megagramWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKMassUnit megagram]];
}

+ (instancetype)mass_tonneWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKMassUnit tonne]];
}

- (instancetype)mass_convertToGram {
    return [self convertTo:[MKMassUnit gram]];
}

- (instancetype)mass_convertToKilogram {
    return [self convertTo:[MKMassUnit kilogram]];
}

@end

@implementation NSNumber (MKMassUnit)

- (MKQuantity *)mass_milligram {
    return [MKQuantity mass_milligramWithAmount:self];
}

- (MKQuantity *)mass_gram {
    return [MKQuantity mass_gramWithAmount:self];
}

- (MKQuantity *)mass_decagram {
    return [MKQuantity mass_decagramWithAmount:self];
}

- (MKQuantity *)mass_kilogram {
    return [MKQuantity mass_kilogramWithAmount:self];
}

- (MKQuantity *)mass_megagram {
    return [MKQuantity mass_megagramWithAmount:self];
}

- (MKQuantity *)mass_tonne {
    return [MKQuantity mass_tonneWithAmount:self];
}

@end
