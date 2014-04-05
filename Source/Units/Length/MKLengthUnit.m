//
//  MKLengthUnit.m
//  MKUnitConverter
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

#import "MKLengthUnit.h"

@implementation MKLengthUnit

+ (instancetype)millimeter {
    static NSString *name   = @"millimeter";
    static NSString *symbol = @"mm";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:-3 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)centimeter {
    static NSString *name   = @"centimeter";
    static NSString *symbol = @"cm";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:-2 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)meter {
    static NSString *name   = @"meter";
    static NSString *symbol = @"m";
    id ratio = [NSDecimalNumber one];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)kilometer {
    static NSString *name   = @"kilometer";
    static NSString *symbol = @"km";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:3 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

@end

@implementation MKQuantity (MKLengthUnit)

+ (instancetype)length_millimeterWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKLengthUnit millimeter]];
}

+ (instancetype)length_centimeterWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKLengthUnit centimeter]];
}

+ (instancetype)length_meterWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKLengthUnit meter]];
}

+ (instancetype)length_kilometerWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKLengthUnit kilometer]];
}

@end

@implementation NSNumber (MKLengthUnit)

- (MKQuantity *)length_millimeter {
    return [MKQuantity length_millimeterWithAmount:self];
}

- (MKQuantity *)length_centimeter {
    return [MKQuantity length_centimeterWithAmount:self];
}

- (MKQuantity *)length_meter {
    return [MKQuantity length_meterWithAmount:self];
}

- (MKQuantity *)length_kilometer {
    return [MKQuantity length_kilometerWithAmount:self];
}

@end
