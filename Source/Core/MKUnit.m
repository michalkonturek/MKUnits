//
//  MKUnit.m
//  MKUnits
//
//  Created by Michal Konturek on 27/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKUnit.h"
#import "MKMacros.h"

#import "NSDecimalNumber+Negative.h"

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
    id value = [NSDecimalNumber createFrom:amount];
    return [value decimalNumberByDividingBy:self.ratio];
}

- (NSNumber *)convertToBaseUnit:(NSNumber *)amount {
    id value = [NSDecimalNumber createFrom:amount];
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
