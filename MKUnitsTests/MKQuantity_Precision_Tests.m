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

- (void)test_precision_5 {
    [self _test_precision:5 shouldPass:YES];
}

- (void)test_precision_6 {
    [self _test_precision:6 shouldPass:YES];
}

- (void)test_precision_7 {
    [self _test_precision:7 shouldPass:NO];
}

- (void)test_precision_10 {
    [self _test_precision:10 shouldPass:NO];
}

- (void)_test_precision:(short)precision shouldPass:(BOOL)pass {
    BOOL result = [self.quantity_1 isTheSame:self.quantity_2 withPrecision:precision];
    assertThatBool(result, equalToBool(pass));
}

@end
