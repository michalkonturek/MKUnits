//
//  MKVolumeUnit+US.m
//  MKUnits
//
//  Created by Michal Konturek on 05/06/2014.
//  Copyright (c) 2014 Michal Konturek. All rights reserved.
//

#import "MKVolumeUnit+US.h"

@implementation MKVolumeUnit (US)

+ (instancetype)us_minim {
    static NSString *name   = @"minim";
    static NSString *symbol = @"min";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:61611519921875 exponent:-18 isNegative:NO];
    
//    61.611519921875 μL
//    61611519921875 μL
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)us_fluidram {
    static NSString *name   = @"US fluidram";
    static NSString *symbol = @"US fl dr";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:36966911953125 exponent:-16 isNegative:NO];
    
//    3.6966911953125 mL
//    36966911953125 mL
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)us_teaspoon {
    static NSString *name   = @"US teaspoon";
    static NSString *symbol = @"US tsp";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:492892159375 exponent:-14 isNegative:NO];
    
//    4.92892159375 mL
//    492892159375 mL
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)us_tablespoon {
    static NSString *name   = @"US tablespoon";
    static NSString *symbol = @"US tbsp";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1478676478125 exponent:-14 isNegative:NO];
    
//    14.78676478125 mL
//    1478676478125 mL
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)us_fluidounce {
    static NSString *name   = @"US fluid ounce";
    static NSString *symbol = @"US fl oz";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:295735295625 exponent:-13 isNegative:NO];
    
//    29.5735295625 mL
//    295735295625 mL
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)us_gill {
    static NSString *name   = @"US gill";
    static NSString *symbol = @"US gi";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:11829411825 exponent:-11 isNegative:NO];
    
//    118.29411825 mL
//    11829411825 mL
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)us_cup {
    static NSString *name   = @"US cup";
    static NSString *symbol = @"US cp";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:2365882365 exponent:-10 isNegative:NO];
    
//    236.5882365 mL
//    2365882365 mL
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)us_pint {
    static NSString *name   = @"US pint";
    static NSString *symbol = @"US pt";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:473176473 exponent:-9 isNegative:NO];
    
//    473.176473 mL
//    473176473 mL
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)us_quart {
    static NSString *name   = @"US quart";
    static NSString *symbol = @"US qt";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:946352946 exponent:-9 isNegative:NO];
    
//    0.946352946 L
//    946352946 L
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)us_gallon {
    static NSString *name   = @"US gallon";
    static NSString *symbol = @"US gal";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:3785411784 exponent:-9 isNegative:NO];
    
//    3.785411784 L
//    3785411784 L
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)us_barrel {
    static NSString *name   = @"barrel";
    static NSString *symbol = @"bbl";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:119240471196 exponent:-9 isNegative:NO];
    
//    119.240471196 L
//    119240471196 L
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)us_hogshead {
    static NSString *name   = @"hogshead";
    static NSString *symbol = @"hogshead";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:238480942392 exponent:-9 isNegative:NO];
    
//    238.480942392 L
//    238480942392 L
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

@end

@implementation MKQuantity (MKVolumeUnit_US)

+ (instancetype)volume_us_minimWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKVolumeUnit us_minim]];
}

+ (instancetype)volume_us_fluidramWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKVolumeUnit us_fluidram]];
}

+ (instancetype)volume_us_teaspoonWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKVolumeUnit us_teaspoon]];
}

+ (instancetype)volume_us_tablespoonWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKVolumeUnit us_tablespoon]];
}

+ (instancetype)volume_us_fluidounceWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKVolumeUnit us_fluidounce]];
}

+ (instancetype)volume_us_gillWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKVolumeUnit us_gill]];
}

+ (instancetype)volume_us_cupWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKVolumeUnit us_cup]];
}

+ (instancetype)volume_us_pintWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKVolumeUnit us_pint]];
}

+ (instancetype)volume_us_quartWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKVolumeUnit us_quart]];
}

+ (instancetype)volume_us_gallonWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKVolumeUnit us_gallon]];
}

+ (instancetype)volume_us_barrelWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKVolumeUnit us_barrel]];
}

+ (instancetype)volume_us_hogsheadWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKVolumeUnit us_hogshead]];
}

@end

@implementation NSNumber (MKVolumeUnit_US)

- (MKQuantity *)volume_us_minim {
    return [MKQuantity volume_us_minimWithAmount:self];
}

- (MKQuantity *)volume_us_fluidram {
    return [MKQuantity volume_us_fluidramWithAmount:self];
}

- (MKQuantity *)volume_us_teaspoon {
    return [MKQuantity volume_us_teaspoonWithAmount:self];
}

- (MKQuantity *)volume_us_tablespoon {
    return [MKQuantity volume_us_tablespoonWithAmount:self];
}

- (MKQuantity *)volume_us_fluidounce {
    return [MKQuantity volume_us_fluidounceWithAmount:self];
}

- (MKQuantity *)volume_us_gill {
    return [MKQuantity volume_us_gillWithAmount:self];
}

- (MKQuantity *)volume_us_cup {
    return [MKQuantity volume_us_cupWithAmount:self];
}

- (MKQuantity *)volume_us_pint {
    return [MKQuantity volume_us_pintWithAmount:self];
}

- (MKQuantity *)volume_us_quart {
    return [MKQuantity volume_us_quartWithAmount:self];
}

- (MKQuantity *)volume_us_gallon {
    return [MKQuantity volume_us_gallonWithAmount:self];
}

- (MKQuantity *)volume_us_barrel {
    return [MKQuantity volume_us_barrelWithAmount:self];
}

- (MKQuantity *)volume_us_hogshead {
    return [MKQuantity volume_us_hogsheadWithAmount:self];
}

@end
