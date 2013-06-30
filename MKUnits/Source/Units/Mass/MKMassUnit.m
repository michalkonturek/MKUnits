//
//  MKMassUnit.m
//  MKUnits
//
//  Created by Michal Konturek on 28/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKMassUnit.h"

@implementation MKMassUnit

+ (instancetype)milligram {
    static NSString *name   = @"milligram";
    static NSString *symbol = @"mg";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:-6 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)gram {
    static NSString *name   = @"gram";
    static NSString *symbol = @"g";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:-3 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)decagram {
    static NSString *name   = @"decagram";
    static NSString *symbol = @"dag";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:-2 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)kilogram {
    static NSString *name   = @"kilogram";
    static NSString *symbol = @"kg";
    id ratio = [NSDecimalNumber one];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)megagram {
    static NSString *name   = @"megagram";
    static NSString *symbol = @"Mg";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:3 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)tonne {
    static NSString *name   = @"tonne";
    
    /*
     NOTE:
     There is a collision of symbols between tonne and imperial ton.
     As tonne is a different name for megagram, use Mg istead of t.
     */
    
    static NSString *symbol = @"Mg";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:3 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

@end

@implementation MKQuantity (MKMassUnit)

+ (instancetype)mass_milligramWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKMassUnit milligram]];
}

+ (instancetype)mass_gramWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKMassUnit gram]];
}

+ (instancetype)mass_decagramWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKMassUnit decagram]];
}

+ (instancetype)mass_kilogramWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKMassUnit kilogram]];
}

+ (instancetype)mass_megagramWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKMassUnit megagram]];
}

+ (instancetype)mass_tonneWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKMassUnit tonne]];
}

- (instancetype)mass_convertToGram {
    return [self convertTo:[MKMassUnit gram]];
}

- (instancetype)mass_convertToKilogram {
    return [self convertTo:[MKMassUnit kilogram]];
}

@end

