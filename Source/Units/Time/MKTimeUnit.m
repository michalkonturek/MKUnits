//
//  MKTimeUnit.m
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

#import "MKTimeUnit.h"

@implementation MKTimeUnit

+ (instancetype)nanosecond {
    static NSString *name   = @"nanosecond";
    static NSString *symbol = @"ns";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:-9 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)microsecond {
    static NSString *name   = @"microsecond";
    static NSString *symbol = @"μs";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:-6 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)millisecond {
    static NSString *name   = @"millisecond";
    static NSString *symbol = @"ms";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:-3 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)second {
    static NSString *name   = @"second";
    static NSString *symbol = @"s";
    id ratio = [NSDecimalNumber one];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)minute {
    static NSString *name   = @"minute";
    static NSString *symbol = @"m";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:60 exponent:0 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)hour {
    static NSString *name   = @"hour";
    static NSString *symbol = @"h";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:3600 exponent:0 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)day {
    static NSString *name   = @"day";
    static NSString *symbol = @"d";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:86400 exponent:0 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)week {
    static NSString *name   = @"week";
    static NSString *symbol = @"wk";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:604800 exponent:0 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)month {
    static NSString *name   = @"month";
    static NSString *symbol = @"mo";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:2592000 exponent:0 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)year {
    static NSString *name   = @"year";
    static NSString *symbol = @"y";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:31557600 exponent:0 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)decade {
    static NSString *name   = @"decade";
    static NSString *symbol = @"dec";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:31557600 exponent:1 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)century {
    static NSString *name   = @"century";
    static NSString *symbol = @"c";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:31557600 exponent:2 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

@end

@implementation MKQuantity (MKTimeUnit)

+ (instancetype)time_nanosecondWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKTimeUnit nanosecond]];
}

+ (instancetype)time_microsecondWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKTimeUnit microsecond]];
}

+ (instancetype)time_millisecondWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKTimeUnit millisecond]];
}

+ (instancetype)time_secondWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKTimeUnit second]];
}

+ (instancetype)time_minuteWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKTimeUnit minute]];
}

+ (instancetype)time_hourWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKTimeUnit hour]];
}

+ (instancetype)time_dayWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKTimeUnit day]];
}

+ (instancetype)time_weekWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKTimeUnit week]];
}

+ (instancetype)time_monthWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKTimeUnit month]];
}

+ (instancetype)time_yearWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKTimeUnit year]];
}

+ (instancetype)time_decadeWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKTimeUnit decade]];
}

+ (instancetype)time_centuryWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKTimeUnit century]];
}

@end

@implementation NSNumber (MKTimeUnit)

- (MKQuantity *)time_nanosecond {
    return [MKQuantity time_nanosecondWithAmount:self];
}

- (MKQuantity *)time_microsecond {
    return [MKQuantity time_microsecondWithAmount:self];
}

- (MKQuantity *)time_millisecond {
    return [MKQuantity time_millisecondWithAmount:self];
}

- (MKQuantity *)time_second {
    return [MKQuantity time_secondWithAmount:self];
}

- (MKQuantity *)time_minute {
    return [MKQuantity time_minuteWithAmount:self];
}

- (MKQuantity *)time_hour {
    return [MKQuantity time_hourWithAmount:self];
}

- (MKQuantity *)time_day {
    return [MKQuantity time_dayWithAmount:self];
}

- (MKQuantity *)time_week {
    return [MKQuantity time_weekWithAmount:self];
}

- (MKQuantity *)time_month {
    return [MKQuantity time_monthWithAmount:self];
}

- (MKQuantity *)time_year {
    return [MKQuantity time_yearWithAmount:self];
}

- (MKQuantity *)time_decade {
    return [MKQuantity time_decadeWithAmount:self];
}

- (MKQuantity *)time_century {
    return [MKQuantity time_centuryWithAmount:self];
}

@end
