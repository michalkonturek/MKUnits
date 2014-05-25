//
//  NSNumber+MK_Negative.m
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

#import "NSNumber+MK_Negative.h"

#import "NSNumber+MK_Creation.h"

@implementation NSNumber (MK_Negative)

+ (instancetype)mk_minusOne {
    return [[NSDecimalNumber zero] decimalNumberBySubtracting:[NSDecimalNumber one]];
}

- (instancetype)mk_negative {
    return ([self mk_isNegative]) ? self : [self mk_negate];
}

- (instancetype)mk_positive {
    return ([self mk_isPositive]) ? self : [self mk_negate];
}

- (instancetype)mk_negate {    
    return [[self mk_decimalNumber] decimalNumberByMultiplyingBy:[NSDecimalNumber mk_minusOne]];
}

- (BOOL)mk_isPositive {
    return (![self mk_isNegative]);
}

- (BOOL)mk_isNegative {
    return ([self doubleValue] < 0);
}

@end
