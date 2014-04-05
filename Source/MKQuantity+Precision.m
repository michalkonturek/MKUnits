//
//  MKQuantity+Precision.m
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

#import "MKQuantity+Precision.h"

#import "MKUnit.h"
#import "MKUnit+Conversion.h"

#import <MKFoundationKit/NSNumber+MK.h>

@implementation MKQuantity (Precision)

- (instancetype)quantityWithPrecision:(short)precision {
    id rounded = [self amountWithPrecision:precision];
    return [[self class] createWithAmount:rounded withUnit:[self.unit copy]];
}

- (NSNumber *)amountWithPrecision:(short)precision {
    return [self.amount mk_roundedWithPrecision:precision];
}

- (BOOL)isTheSame:(MKQuantity *)other withPrecision:(short)precision {
    return ([self compare:other withPrecision:precision] == NSOrderedSame);
}

- (BOOL)isGreaterThan:(MKQuantity *)other withPrecision:(short)precision {
    return ([self compare:other withPrecision:precision] == NSOrderedDescending);
}

- (BOOL)isLessThan:(MKQuantity *)other withPrecision:(short)precision {
    return ([self compare:other withPrecision:precision] == NSOrderedAscending);
}

- (NSComparisonResult)compare:(MKQuantity *)other withPrecision:(short)precision {
    NSAssert([self.unit isConvertibleWith:other.unit], UNITS_NOT_CONVERTIBLE);
    MKQuantity *converted = [other convertTo:self.unit];
    return ([[self.amount mk_roundedWithPrecision:precision]
             compare:[converted.amount mk_roundedWithPrecision:precision]]);
}

@end
