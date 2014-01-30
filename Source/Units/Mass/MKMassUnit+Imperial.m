//
//  MKMassUnit+Imperial.m
//  MKUnits
//
//  Created by Michal Konturek on 30/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKMassUnit+Imperial.h"

@implementation MKMassUnit (Imperial)

// source: http://en.wikipedia.org/wiki/Imperial_units


+ (instancetype)grain {
    static NSString *name   = @"grain";
    static NSString *symbol = @"gr";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:6479891 exponent:-11 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)drachm {
    static NSString *name   = @"drachm";
    static NSString *symbol = @"dr";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:17718451953125 exponent:-16 isNegative:NO];
    
//    1.7718451953125 g
//    0.0017718451953125 kg
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)ounce {
    static NSString *name   = @"ounce";
    static NSString *symbol = @"oz";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:28349523125 exponent:-12 isNegative:NO];

//    28.349523125 g
//    0.028349523125 kg
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)pound {
    static NSString *name   = @"pound";
    static NSString *symbol = @"lb";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:45359237 exponent:-8 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)stone {
    static NSString *name   = @"stone";
    static NSString *symbol = @"st";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:635029 exponent:-5 isNegative:NO];
        
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)quarter {
    static NSString *name   = @"quarter";
    static NSString *symbol = @"qtr";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1270058636 exponent:-8 isNegative:NO];
    
//    12.70058636 kg
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)hundredweight {
    static NSString *name   = @"hundredweight";
    static NSString *symbol = @"cwt";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:5080234544 exponent:-8 isNegative:NO];
    
//    50.80234544 kg
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)ton {
    static NSString *name   = @"ton";
    static NSString *symbol = @"t";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:10160469088 exponent:-7 isNegative:NO];
    
//    1,016.0469088 kg
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}


@end

@implementation MKQuantity (MKMassUnit_Imperial)

+ (instancetype)mass_grainWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKMassUnit grain]];
}

+ (instancetype)mass_drachmWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKMassUnit drachm]];
}

+ (instancetype)mass_ounceWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKMassUnit ounce]];
}

+ (instancetype)mass_poundWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKMassUnit pound]];
}

+ (instancetype)mass_stoneWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKMassUnit stone]];
}

+ (instancetype)mass_quarterWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKMassUnit quarter]];
}

+ (instancetype)mass_hundredweightWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKMassUnit hundredweight]];
}

+ (instancetype)mass_tonWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKMassUnit ton]];
}

@end
