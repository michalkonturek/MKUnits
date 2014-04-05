//
//  MKUnit.m
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
#import "MKMacros.h"

#import <MKFoundationKit/NSNumber+MK.h>

@implementation MKUnit

+ (instancetype)createWithName:(NSString *)name
                    withSymbol:(NSString *)symbol
                     withRatio:(NSDecimalNumber *)ratio {
    return [[self alloc] initWithName:name withSymbol:symbol withRatio:ratio];
}

- (id)initWithName:(NSString *)name
        withSymbol:(NSString *)symbol withRatio:(NSDecimalNumber *)ratio {
    if (self = [super init]) {
        self.name = name;
        self.symbol = symbol;
        self.ratio = ratio;
    }
    return self;
}

- (id)init {
    METHOD_USE_DESIGNATED_INIT
}

- (id)copyWithZone:(NSZone *)zone {
    return [[self class] createWithName:[self.name copyWithZone:zone]
                             withSymbol:[self.symbol copyWithZone:zone]
                              withRatio:[self.ratio copyWithZone:zone]];
}

- (NSNumber *)convertFromBaseUnit:(NSNumber *)amount {
    id value = [NSDecimalNumber mk_createFrom:amount];
    return [value decimalNumberByDividingBy:self.ratio];
}

- (NSNumber *)convertToBaseUnit:(NSNumber *)amount {
    id value = [NSDecimalNumber mk_createFrom:amount];
    return [value decimalNumberByMultiplyingBy:self.ratio];
}

- (NSString *)description {
    return self.symbol;
}

- (BOOL)isEqual:(id)object {
    if (![object isMemberOfClass:[self class]]) return NO;
    return ([self.symbol isEqualToString:[object symbol]]);
}

- (NSUInteger)hash {
    return [[NSString stringWithFormat:@"%@%@", [self class], self.symbol] hash];
}

@end
