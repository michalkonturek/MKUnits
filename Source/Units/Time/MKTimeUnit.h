//
//  MKTimeUnit.h
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

#import "MKUnit.h"
#import "MKQuantity.h"

@interface MKTimeUnit : MKUnit

+ (instancetype)nanosecond;
+ (instancetype)microsecond;
+ (instancetype)millisecond;
+ (instancetype)second;
+ (instancetype)minute;
+ (instancetype)hour;
+ (instancetype)day;
+ (instancetype)week;
+ (instancetype)month;
+ (instancetype)year;
+ (instancetype)decade;
+ (instancetype)century;

@end

@interface MKQuantity (MKTimeUnit)

+ (instancetype)time_nanosecondWithAmount:(NSNumber *)amount;
+ (instancetype)time_microsecondWithAmount:(NSNumber *)amount;
+ (instancetype)time_millisecondWithAmount:(NSNumber *)amount;
+ (instancetype)time_secondWithAmount:(NSNumber *)amount;
+ (instancetype)time_minuteWithAmount:(NSNumber *)amount;
+ (instancetype)time_hourWithAmount:(NSNumber *)amount;
+ (instancetype)time_dayWithAmount:(NSNumber *)amount;
+ (instancetype)time_weekWithAmount:(NSNumber *)amount;
+ (instancetype)time_monthWithAmount:(NSNumber *)amount;
+ (instancetype)time_yearWithAmount:(NSNumber *)amount;
+ (instancetype)time_decadeWithAmount:(NSNumber *)amount;
+ (instancetype)time_centuryWithAmount:(NSNumber *)amount;

@end

@interface NSNumber (MKTimeUnit)

- (MKQuantity *)time_nanosecond;
- (MKQuantity *)time_microsecond;
- (MKQuantity *)time_millisecond;
- (MKQuantity *)time_second;
- (MKQuantity *)time_minute;
- (MKQuantity *)time_hour;
- (MKQuantity *)time_day;
- (MKQuantity *)time_week;
- (MKQuantity *)time_month;
- (MKQuantity *)time_year;
- (MKQuantity *)time_decade;
- (MKQuantity *)time_century;

@end
