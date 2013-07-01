//
//  MKQuantity_Precision_Tests.m
//  MKUnits
//
//  Created by Michal Konturek on 30/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "Base_Tests.h"

@interface MKQuantity_Precision_Tests : SenTestCase

@property (nonatomic, strong) MKQuantity *quantity_1;
@property (nonatomic, strong) MKQuantity *quantity_2;

@end

@implementation MKQuantity_Precision_Tests

- (void)setUp {
    self.quantity_1 = [MKQuantity createWithAmount:@1.00001 withUnit:[MKMassUnit gram]];
    self.quantity_2 = [MKQuantity createWithAmount:@1.0000101 withUnit:[MKMassUnit gram]];
}

- (void)tearDown {
    self.quantity_1 = nil;
    self.quantity_2 = nil;
}

- (void)test_precision_05 {
    short precision = 5;
    BOOL shouldPass = YES;
    [self _perform_tests_with_precision:precision shouldPass:shouldPass];
}

- (void)test_precision_06 {
    short precision = 6;
    BOOL shouldPass = YES;
    [self _perform_tests_with_precision:precision shouldPass:shouldPass];
}

- (void)test_precision_07 {
    short precision = 7;
    BOOL shouldPass = NO;
    [self _perform_tests_with_precision:precision shouldPass:shouldPass];
}

- (void)test_precision_10 {
    short precision = 10;
    BOOL shouldPass = NO;
    [self _perform_tests_with_precision:precision shouldPass:shouldPass];
}

- (void)_perform_tests_with_precision:(short)precision shouldPass:(BOOL)shouldPass {
    [self _test_precision:precision shouldPass:shouldPass];
    [self _test_amountWithPrecision:precision shouldPass:shouldPass];
    [self _test_quantityWithPrecision:precision shouldPass:shouldPass];
    [self _test_returns_same_units_quantityWithPrecision:precision];
}

- (void)_test_precision:(short)precision shouldPass:(BOOL)pass {
    BOOL result = [self.quantity_1 isTheSame:self.quantity_2 withPrecision:precision];
    assertThatBool(result, equalToBool(pass));
}

- (void)_test_amountWithPrecision:(short)precision shouldPass:(BOOL)pass {
    id rounded = [self.quantity_2 amountWithPrecision:precision];
    BOOL result = ([self.quantity_1.amount compare:rounded] == NSOrderedSame);
    assertThatBool(result, equalToBool(pass));
}

- (void)_test_quantityWithPrecision:(short)precision shouldPass:(BOOL)pass {
    id rounded = [self.quantity_2 quantityWithPrecision:precision];
    BOOL result = [self.quantity_1 isTheSame:rounded];
    assertThatBool(result, equalToBool(pass));
}

- (void)_test_returns_same_units_quantityWithPrecision:(short)precision {
    id rounded = [self.quantity_2 quantityWithPrecision:precision];
    BOOL same_unit = ([self.quantity_1.unit isEqual:[rounded unit]]);
    assertThatBool(same_unit, equalToBool(YES));
    
}


@end
