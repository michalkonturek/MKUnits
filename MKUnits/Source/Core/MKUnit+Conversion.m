//
//  MKUnit+Conversion.m
//  MKUnits
//
//  Created by Michal Konturek on 02/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKUnit+Conversion.h"

NSString * const UNITS_NOT_CONVERTIBLE = @"Units not convertible.";

@implementation MKUnit (Conversion)

+ (NSNumber *)convertAmount:(NSNumber *)amount from:(MKUnit *)from to:(MKUnit *)to {
    return [[self _default] convertAmount:amount from:from to:to];
}

+ (instancetype)_default {
    return [self createWithName:@"Unit"
                     withSymbol:@"u"
                      withRatio:[NSDecimalNumber one]];
}

- (NSNumber *)convertAmount:(NSNumber *)amount from:(MKUnit *)unit {
    return [self convertAmount:amount from:unit to:self];
}

- (NSNumber *)convertAmount:(NSNumber *)amount to:(MKUnit *)unit {
    return [self convertAmount:amount from:self to:unit];
}

- (NSNumber *)convertAmount:(NSNumber *)amount from:(MKUnit *)from to:(MKUnit *)to {
    NSAssert([from isConvertibleWith:to], UNITS_NOT_CONVERTIBLE);
    
    id baseAmount = [from convertToBaseUnit:amount];
    id converted = [to convertFromBaseUnit:baseAmount];
    return converted;
}

- (BOOL)isConvertibleWith:(MKUnit *)unit {
    return [unit isMemberOfClass:[self class]];
}

@end
