//
//  NSNumber+MK_Fraction.m
//  MKFoundationKit
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

#import "NSNumber+MK_Fraction.h"

#import "NSNumber+MK_Creation.h"

@implementation NSNumber (MK_Fraction)

- (instancetype)mk_integralPart {
    if ([self isMemberOfClass:[NSNumber class]])
        return [NSNumber numberWithInteger:[self integerValue]];
    
    return [[NSDecimalNumber numberWithInteger:[self integerValue]] mk_decimalNumber];
//    return [self decimalNumberWithPrecision:0];   // do not use as it rounds the number
}

- (instancetype)mk_fractionalPart {
    NSDecimalNumber *integerPart = [[self mk_integralPart] mk_decimalNumber];
    return [[self mk_decimalNumber] decimalNumberBySubtracting:integerPart];
}

- (BOOL)mk_isInteger {
    return ([[self mk_fractionalPart] isEqualToNumber:@0]);
}

- (BOOL)mk_isFraction {
    return (![self mk_isInteger]);
}

@end
