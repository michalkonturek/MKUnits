//
//  MKAreaUnit.m
//  MKUnits
//
//  Created by Michal Konturek on 30/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKAreaUnit.h"

@implementation MKAreaUnit

+ (instancetype)square_millimeter {
    static NSString *name   = @"square millimeter";
    static NSString *symbol = @"mm2";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:-6 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)square_centimeter {
    static NSString *name   = @"centimeter";
    static NSString *symbol = @"cm";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:-4 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)square_decimeter {
    static NSString *name   = @"square decimeter";
    static NSString *symbol = @"dm2";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:-2 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)square_meter {
    static NSString *name   = @"square meter";
    static NSString *symbol = @"m2";
    id ratio = [NSDecimalNumber one];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)are {
    static NSString *name   = @"are";
    static NSString *symbol = @"dam2";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:2 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)hectare {
    static NSString *name   = @"hectare";
    static NSString *symbol = @"hm2";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:4 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)square_kilometer {
    static NSString *name   = @"square kilometer";
    static NSString *symbol = @"km2";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:6 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

@end

@implementation MKQuantity (MKAreaUnit)

+ (instancetype)area_square_millimeterWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKAreaUnit square_millimeter]];
}

+ (instancetype)area_square_centimeterWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKAreaUnit square_centimeter]];
}

+ (instancetype)area_square_decimeterWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKAreaUnit square_decimeter]];
}

+ (instancetype)area_square_meterWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKAreaUnit square_meter]];
}

+ (instancetype)area_areWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKAreaUnit are]];
}

+ (instancetype)area_hectareWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKAreaUnit hectare]];
}

+ (instancetype)area_square_kilometerWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKAreaUnit square_kilometer]];
}

@end
