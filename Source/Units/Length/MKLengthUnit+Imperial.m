//
//  MKLengthUnit+Imperial.m
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

#import "MKLengthUnit+Imperial.h"

@implementation MKLengthUnit (Imperial)

+ (instancetype)inch {
    static NSString *name   = @"inch";
    static NSString *symbol = @"in";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:254 exponent:-4 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)foot {
    static NSString *name   = @"foot";
    static NSString *symbol = @"ft";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:3048 exponent:-4 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)yard {
    static NSString *name   = @"yard";
    static NSString *symbol = @"yd";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:9144 exponent:-4 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)chain {
    static NSString *name   = @"chain";
    static NSString *symbol = @"ch";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:201168 exponent:-4 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)furlong {
    static NSString *name   = @"furlong";
    static NSString *symbol = @"fur";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:201168 exponent:-3 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)mile {
    static NSString *name   = @"mile";
    static NSString *symbol = @"mi";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1609344 exponent:-3 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)nautical_mile {
    static NSString *name   = @"nautical mile";
    static NSString *symbol = @"nmi";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1853184 exponent:-3 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

@end

@implementation MKQuantity (MKLengthUnit_Imperial)

+ (instancetype)length_inchWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKLengthUnit inch]];
}

+ (instancetype)length_footWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKLengthUnit foot]];
}

+ (instancetype)length_yardWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKLengthUnit yard]];
}

+ (instancetype)length_chainWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKLengthUnit chain]];
}

+ (instancetype)length_furlongWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKLengthUnit furlong]];
}

+ (instancetype)length_mileWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKLengthUnit mile]];
}

+ (instancetype)length_nautical_mileWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKLengthUnit nautical_mile]];
}

@end

@implementation NSNumber (MKLengthUnit_Imperial)

- (MKQuantity *)length_inch {
    return [MKQuantity length_inchWithAmount:self];
}

- (MKQuantity *)length_foot {
    return [MKQuantity length_footWithAmount:self];
}

- (MKQuantity *)length_yard {
    return [MKQuantity length_yardWithAmount:self];
}

- (MKQuantity *)length_chain {
    return [MKQuantity length_chainWithAmount:self];
}

- (MKQuantity *)length_furlong {
    return [MKQuantity length_furlongWithAmount:self];
}

- (MKQuantity *)length_mile {
    return [MKQuantity length_mileWithAmount:self];
}

- (MKQuantity *)length_nautical_mile {
    return [MKQuantity length_nautical_mileWithAmount:self];
}

@end
