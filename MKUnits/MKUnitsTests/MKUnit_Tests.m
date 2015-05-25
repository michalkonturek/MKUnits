//
//  MKUnit_Tests.m
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

@interface MKUnit_Tests : XCTestCase

@property (nonatomic, strong) MKMassUnit *kilogram;
@property (nonatomic, strong) MKMassUnit *gram;

@end

@implementation MKUnit_Tests

- (void)setUp {
    self.kilogram = [MKMassUnit kilogram];
    self.gram = [MKMassUnit gram];
}

- (void)tearDown {
    self.kilogram = nil;
    self.gram = nil;
}

- (void)test_create {
    assertThat(self.kilogram, notNilValue());
    assertThat(self.kilogram.name, equalToIgnoringCase(@"kilogram"));
    assertThat(self.kilogram.symbol, equalToIgnoringCase(@"kg"));
    assertThat(self.kilogram.ratio, equalTo(@1));
}

- (void)test_convertAmountFromTo_no_exception_when_same_group {
    XCTAssertNoThrow([self.kilogram convertAmount:@1 to:[MKMassUnit pound]], @"");
}

- (void)test_convertAmountFromTo_throws_exception_when_diff_groups {
    XCTAssertThrows([self.kilogram convertAmount:@1 to:[MKLengthUnit meter]], @"");
}

- (void)test_convertAmountFromTo_class_method {
    id result = [MKUnit convertAmount:@1 from:[MKMassUnit kilogram] to:[MKMassUnit gram]];
    assertThat(result, equalTo(@1000));    
}

- (void)test_convertFromBaseUnit {
    id result = [self.gram convertToBaseUnit:@600];
    assertThat(result, equalTo(@0.6));
}

- (void)test_convertToBaseUnit {
    id result = [self.gram convertFromBaseUnit:@0.2];
    assertThat(result, equalTo(@200));
}

- (void)test_description {
    id result = [self.kilogram description];
    assertThat(result, equalTo(@"kg"));
}

- (void)test_isEqual_returns_true {
    BOOL result = [self.kilogram isEqual:[MKMassUnit kilogram]];
    assertThatBool(result, isTrue());
}

- (void)test_isEqual_returns_false_when_diff_units_but_same_group {
    BOOL result = [self.kilogram isEqual:[MKMassUnit gram]];
    assertThatBool(result, isFalse());
}

- (void)test_isEqual_returns_false_when_diff_units_and_diff_group {
    BOOL result = [self.kilogram isEqual:[MKLengthUnit centimeter]];
    assertThatBool(result, isFalse());
}

- (void)test_hash {
    BOOL result = ([[MKMassUnit kilogram] hash] == [[MKMassUnit grain] hash]);
    assertThatBool(result, isFalse());
    
    result = ([[MKMassUnit megagram] hash] == [[MKMassUnit milligram] hash]);
    assertThatBool(result, isFalse());
}

@end
