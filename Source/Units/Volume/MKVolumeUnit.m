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
    static NSString *symbol = @"mg";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:-6 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)millilitre {
    static NSString *name   = @"millilitre";
    static NSString *symbol = @"mg";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:-6 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)centilitre {
    static NSString *name   = @"milligram";
    static NSString *symbol = @"mg";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:-6 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)decilitre {
    static NSString *name   = @"milligram";
    static NSString *symbol = @"mg";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:-6 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)litre {
    static NSString *name   = @"milligram";
    static NSString *symbol = @"mg";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:-6 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)hectolitre {
    static NSString *name   = @"milligram";
    static NSString *symbol = @"mg";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:-6 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

@end
