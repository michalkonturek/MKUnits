//
//  MKVolumeUnit.m
//  MKUnits
//
//  Created by Michal Konturek on 02/06/2014.
//  Copyright (c) 2014 Michal Konturek. All rights reserved.
//

#import "MKVolumeUnit.h"

@implementation MKVolumeUnit

+ (instancetype)microlitre {
    static NSString *name   = @"microlitre";
    static NSString *symbol = @"µl";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:-6 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)millilitre {
    static NSString *name   = @"millilitre";
    static NSString *symbol = @"ml";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:-3 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)centilitre {
    static NSString *name   = @"centilitre";
    static NSString *symbol = @"cl";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:-2 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)decilitre {
    static NSString *name   = @"decilitre";
    static NSString *symbol = @"dl";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:-1 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)litre {
    static NSString *name   = @"litre";
    static NSString *symbol = @"l";
    id ratio = [NSDecimalNumber one];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)hectolitre {
    static NSString *name   = @"hectolitre";
    static NSString *symbol = @"hl";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:2 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

@end

@implementation MKQuantity (MKVolumeUnit)

+ (instancetype)volume_microlitreWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKVolumeUnit microlitre]];
}

+ (instancetype)volume_millilitreWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKVolumeUnit millilitre]];
}

+ (instancetype)volume_centilitreWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKVolumeUnit centilitre]];
}

+ (instancetype)volume_decilitreWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKVolumeUnit decilitre]];
}

+ (instancetype)volume_litreWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKVolumeUnit litre]];
}

+ (instancetype)volume_hectolitreWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKVolumeUnit hectolitre]];
}

@end

@implementation NSNumber (MKVolumeUnit)

- (MKQuantity *)volume_microlitre {
    return [MKQuantity volume_microlitreWithAmount:self];
}

- (MKQuantity *)volume_millilitre {
    return [MKQuantity volume_millilitreWithAmount:self];
}

- (MKQuantity *)volume_centilitre {
    return [MKQuantity volume_centilitreWithAmount:self];
}

- (MKQuantity *)volume_decilitre {
    return [MKQuantity volume_decilitreWithAmount:self];
}

- (MKQuantity *)volume_litre {
    return [MKQuantity volume_litreWithAmount:self];
}

- (MKQuantity *)volume_hectolitre {
    return [MKQuantity volume_hectolitreWithAmount:self];
}

@end
