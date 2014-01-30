//
//  MKTimeUnit_Tests.m
//  MKUnits
//
//  Created by Michal Konturek on 30/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "Base_Tests.h"

@interface MKTimeUnit_Tests : SenTestCase

@end

@implementation MKTimeUnit_Tests

- (void)test_one_microsecond_is_1000_nanoseconds {
    MKQuantity *expected = [MKQuantity time_nanosecondWithAmount:@1000];
    BOOL result = [[MKQuantity time_microsecondWithAmount:@1] isTheSame:expected];

    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_millisecond_is_1000_microseconds {
    MKQuantity *expected = [MKQuantity time_microsecondWithAmount:@1000];
    BOOL result = [[MKQuantity time_millisecondWithAmount:@1] isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_second_is_1000_milliseconds {
    MKQuantity *expected = [MKQuantity time_millisecondWithAmount:@1000];
    BOOL result = [[MKQuantity time_secondWithAmount:@1] isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_minute_is_60_seconds {
    MKQuantity *expected = [MKQuantity time_secondWithAmount:@60];
    BOOL result = [[MKQuantity time_minuteWithAmount:@1] isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_hour_is_60_minutes {
    MKQuantity *expected = [MKQuantity time_minuteWithAmount:@60];
    BOOL result = [[MKQuantity time_hourWithAmount:@1] isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_day_is_24_hours {
    MKQuantity *expected = [MKQuantity time_hourWithAmount:@24];
    BOOL result = [[MKQuantity time_dayWithAmount:@1] isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_week_is_7_days {
    MKQuantity *expected = [MKQuantity time_dayWithAmount:@7];
    BOOL result = [[MKQuantity time_weekWithAmount:@1] isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_month_is_30_days {
    MKQuantity *expected = [MKQuantity time_dayWithAmount:@30];
    BOOL result = [[MKQuantity time_monthWithAmount:@1] isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_year_is_365_coma_25_days {
    MKQuantity *expected = [MKQuantity time_dayWithAmount:@365.25];
    BOOL result = [[MKQuantity time_yearWithAmount:@1] isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_decade_is_10_years {
    MKQuantity *expected = [MKQuantity time_yearWithAmount:@10];
    BOOL result = [[MKQuantity time_decadeWithAmount:@1] isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_one_century_is_100_years {
    MKQuantity *expected = [MKQuantity time_yearWithAmount:@100];
    BOOL result = [[MKQuantity time_centuryWithAmount:@1] isTheSame:expected];
    
    assertThatBool(result, equalToBool(YES));
}


@end
