//
//  MKUnit+Conversion.m
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

#import "MKUnit+Conversion.h"

NSString * const UNITS_NOT_CONVERTIBLE = @"Units not convertible.";

@implementation MKUnit (Conversion)

+ (NSNumber *)convertAmount:(NSNumber *)amount from:(MKUnit *)from to:(MKUnit *)to {
    return [[self _default] convertAmount:amount from:from to:to];
}

+ (instancetype)_default {
    return [self createWithName:@"Unit"
                     withSymbol:@"u"
                      withRatio:[NSDecimalNumber one]];
}

- (NSNumber *)convertAmount:(NSNumber *)amount from:(MKUnit *)unit {
    return [self convertAmount:amount from:unit to:self];
}

- (NSNumber *)convertAmount:(NSNumber *)amount to:(MKUnit *)unit {
    return [self convertAmount:amount from:self to:unit];
}

- (NSNumber *)convertAmount:(NSNumber *)amount from:(MKUnit *)from to:(MKUnit *)to {
    NSAssert([from isConvertibleWith:to], UNITS_NOT_CONVERTIBLE);
    
    id baseAmount = [from convertToBaseUnit:amount];
    id converted = [to convertFromBaseUnit:baseAmount];
    return converted;
}

- (BOOL)isConvertibleWith:(MKUnit *)unit {
    return [unit isMemberOfClass:[self class]];
}

@end
