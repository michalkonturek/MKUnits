//
//  MKMassUnit.m
//  MKUnits
//
//  Created by Michal Konturek on 28/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKMassUnit.h"

@implementation MKMassUnit

+ (instancetype)tonne {
    return [self megagram];
}

+ (instancetype)megagram {
    static NSString *name   = @"megagram";
    static NSString *symbol = @"Mg";
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

+ (instancetype)decagram {
    static NSString *name   = @"decagram";
    static NSString *symbol = @"dag";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:-2 isNegative:NO];
    
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

+ (instancetype)miligram {
    static NSString *name   = @"miligram";
    static NSString *symbol = @"mg";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:-6 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

@end

@implementation MKQuantity (MKMassUnit)

+ (instancetype)mass_gramWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKMassUnit gram]];
}

+ (instancetype)mass_kilogramWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKMassUnit kilogram]];
}

- (instancetype)mass_convertToGram {
    return [self convertTo:[MKMassUnit gram]];
}

- (instancetype)mass_convertToKilogram {
    return [self convertTo:[MKMassUnit kilogram]];
}

@end

