//
//  MKQuantity_Tests.m
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

#import "Base_Tests.h"

@interface MKQuantity_Tests : SenTestCase

@property (nonatomic, strong) MKQuantity *kilogram_2;
@property (nonatomic, strong) MKQuantity *gram_300;

@end

@implementation MKQuantity_Tests

- (void)setUp{
    self.kilogram_2 = [MKQuantity mass_kilogramWithAmount:@2];
    self.gram_300 = [MKQuantity mass_gramWithAmount:@300];
}

- (void)tearDown {
    self.kilogram_2 = nil;
    self.gram_300 = nil;
}

- (void)test_adds_when_same_group_and_units {
    MKQuantity *result = [self.kilogram_2 add:[MKQuantity mass_kilogramWithAmount:@10]];
    
    assertThat(result.amount, equalTo(@12));
    assertThat(result.unit, equalTo([MKMassUnit kilogram]));
}

- (void)test_adds_when_same_group_and_diff_units {
    MKQuantity *result = [self.kilogram_2 add:[MKQuantity mass_gramWithAmount:@100]];
    
    assertThat(result.amount, equalTo(@2.1));
    assertThat(result.unit, equalTo([MKMassUnit kilogram]));
}

- (void)test_throws_exception_when_adding_diff_group_and_diff_units {
    STAssertThrows([self.kilogram_2 add:[MKQuantity length_meterWithAmount:@1]], @"");
}

- (void)test_divides {
    id expected = [@1 mass_kilogram];
    id result = [[@3 mass_kilogram] divideBy:@3];
    assertThatBool([result isTheSame:expected], equalToBool(YES));
}

- (void)test_multiply {
    id expected = [@3 mass_kilogram];
    id result = [[@1 mass_kilogram] multiplyBy:@3];
    assertThatBool([result isTheSame:expected], equalToBool(YES));
}

- (void)test_negate {
    MKQuantity *result = [self.kilogram_2 negate];
    assertThat([result amount], equalTo(@-2));
}

- (void)test_subtracts_when_same_group_and_units {
    MKQuantity *result = [self.kilogram_2 subtract:[MKQuantity mass_kilogramWithAmount:@1]];

    assertThat(result.amount, equalTo(@1));
    assertThat(result.unit, equalTo([MKMassUnit kilogram]));
}

- (void)test_subtracts_when_same_group_and_diff_units {
    MKQuantity *result = [self.kilogram_2 subtract:[MKQuantity mass_gramWithAmount:@750]];
    
    assertThat(result.amount, equalTo(@1.250));
    assertThat(result.unit, equalTo([MKMassUnit kilogram]));
}

- (void)test_throws_exception_when_subtracting_diff_group {
    STAssertThrows([self.gram_300 subtract:[MKQuantity length_millimeterWithAmount:@1]], @"");
}

- (void)test_convertTo_grams {
    MKQuantity *result = [self.kilogram_2 convertTo:[MKMassUnit gram]];
    assertThat(result.amount, equalTo(@2000));
    assertThat(result.unit, equalTo([MKMassUnit gram]));
}

- (void)test_convertTo_kilograms {
    MKQuantity *result = [self.gram_300 convertTo:[MKMassUnit kilogram]];
    assertThat(result.amount, equalTo(@0.3));
    assertThat(result.unit, equalTo([MKMassUnit kilogram]));
}

- (void)test_isTheSame_returns_true_same_group_and_units {
    BOOL result = [self.kilogram_2 isTheSame:[MKQuantity mass_kilogramWithAmount:@2]];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isTheSame_returns_true_same_group_diff_units {
    BOOL result = [self.kilogram_2 isTheSame:[MKQuantity mass_gramWithAmount:@2000]];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isTheSame_returns_false_same_group_and_units {
    BOOL result = [self.kilogram_2 isTheSame:[MKQuantity mass_kilogramWithAmount:@1]];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isTheSame_returns_false_same_group_diff_units {
    BOOL result = [self.kilogram_2 isTheSame:[MKQuantity mass_gramWithAmount:@1000]];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isTheSame_throws_exception_when_diff_group {
    STAssertThrows([self.gram_300 isTheSame:[MKQuantity length_millimeterWithAmount:@1]], @"");
}

- (void)test_isGreaterThan_returns_true_same_group_same_units {
    BOOL result = [self.kilogram_2 isGreaterThan:[MKQuantity mass_kilogramWithAmount:@1]];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isGreaterThan_returns_true_same_group_diff_units {
    BOOL result = [self.kilogram_2 isGreaterThan:[MKQuantity mass_gramWithAmount:@1]];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isGreaterThan_returns_false {
    BOOL result = [self.gram_300 isGreaterThan:self.kilogram_2];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isLessThan_returns_true {
    BOOL result = [self.gram_300 isLessThan:self.kilogram_2];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isLessThan_returns_false {
    BOOL result = [self.kilogram_2 isLessThan:self.gram_300];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_hash_returns_true {
    MKQuantity *kg1 = [MKQuantity mass_gramWithAmount:@1];
    MKQuantity *kg2 = [MKQuantity mass_gramWithAmount:@1];
    
    BOOL result = ([kg1 hash] == [kg2 hash]);
    assertThatBool(result, equalToBool(YES));
}

- (void)test_hash_returns_false_when_same_units_different_amounts {
    MKQuantity *q1 = [MKQuantity mass_gramWithAmount:@1];
    MKQuantity *q2 = [MKQuantity mass_gramWithAmount:@2];
    
    BOOL result = ([q1 hash] == [q2 hash]);
    assertThatBool(result, equalToBool(NO));
}

- (void)test_hash_returns_false_when_different_units_same_amounts {
    MKQuantity *q1 = [MKQuantity mass_megagramWithAmount:@1];
    MKQuantity *q2 = [MKQuantity mass_milligramWithAmount:@1];
    
    BOOL result = ([q1 hash] == [q2 hash]);
    assertThatBool(result, equalToBool(NO));
}

@end

