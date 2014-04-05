//
//  MKAreaUnit+Imperial.m
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

#import "MKAreaUnit+Imperial.h"

@implementation MKAreaUnit (Imperial)

+ (instancetype)square_inch {
    static NSString *name   = @"square inch";
    static NSString *symbol = @"sq in";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:64516 exponent:-8 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)square_foot {
    static NSString *name   = @"square foot";
    static NSString *symbol = @"sq ft";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:9290304 exponent:-8 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)square_yard {
    static NSString *name   = @"square yard";
    static NSString *symbol = @"sq yd";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:83612736 exponent:-8 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)acre {
    static NSString *name   = @"acre";
    static NSString *symbol = @"ac";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:40468564224 exponent:-7 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)square_mile {
    static NSString *name   = @"square mile";
    static NSString *symbol = @"sq mi";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:258998811 exponent:-2 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

@end

@implementation MKQuantity (MKAreaUnit_Imperial)

+ (instancetype)area_square_inchWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKAreaUnit square_inch]];
}

+ (instancetype)area_square_footWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKAreaUnit square_foot]];
}

+ (instancetype)area_square_yardWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKAreaUnit square_yard]];
}

+ (instancetype)area_acreWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKAreaUnit acre]];
}

+ (instancetype)area_square_mileWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKAreaUnit square_mile]];
}

@end

@implementation NSNumber (MKAreaUnit_Imperial)

- (MKQuantity *)area_square_inch {
    return [MKQuantity area_square_inchWithAmount:self];
}

- (MKQuantity *)area_square_foot {
    return [MKQuantity area_square_footWithAmount:self];
}

- (MKQuantity *)area_square_yard {
    return [MKQuantity area_square_yardWithAmount:self];
}

- (MKQuantity *)area_acre {
    return [MKQuantity area_acreWithAmount:self];
}

- (MKQuantity *)area_square_mile {
    return [MKQuantity area_square_mileWithAmount:self];
}

@end

