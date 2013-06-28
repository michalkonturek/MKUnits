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

- (NSUInteger)hash {
    return [self.name hash];
}

- (BOOL)isEqual:(id)object {
    return ([self.name isEqualToString:[object name]]);
}


@end
