//
//  NSNumber+MK_Manipulation.m
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

#import "NSNumber+MK_Manipulation.h"

#import "NSNumber+MK_Creation.h"

@implementation NSNumber (MK_Manipulation)

- (instancetype)mk_add:(NSNumber *)other {
    if (!other) return self;
    return [[self mk_decimalNumber] decimalNumberByAdding:[other mk_decimalNumber]];
}

- (instancetype)mk_subtract:(NSNumber *)other {
    if (!other) return self;
    return [[self mk_decimalNumber] decimalNumberBySubtracting:[other mk_decimalNumber]];
}

- (instancetype)mk_multiplyBy:(NSNumber *)other {
    if (!other) return self;
    return [[self mk_decimalNumber] decimalNumberByMultiplyingBy:[other mk_decimalNumber]];
}

- (instancetype)mk_divideBy:(NSNumber *)other {
    if (!other) return self;
    return [[self mk_decimalNumber] decimalNumberByDividingBy:[other mk_decimalNumber]];
}

- (instancetype)mk_raiseToPower:(NSInteger)power {
    if (power < 0) return [self _raiseToNegativePower:power];
    return [[self mk_decimalNumber] decimalNumberByRaisingToPower:power];
}

- (instancetype)_raiseToNegativePower:(NSInteger)power {

    /*
     source:
     http://stackoverflow.com/questions/3596060/raise-an-nsdecimalnumber-to-a-negative-power
     
     a^(-b) == 1 / (a^b)
     */
    
    power = power * (-1);
    
    id result = [self mk_raiseToPower:power];
    return [[NSDecimalNumber one] mk_divideBy:result];
}

@end
