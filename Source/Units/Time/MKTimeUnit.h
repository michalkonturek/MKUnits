//
//  MKTimeUnit.h
//  MKUnits
//
//  Created by Michal Konturek on 30/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
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
