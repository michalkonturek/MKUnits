//
//  MKLengthUnit+Imperial.m
//  MKUnits
//
//  Created by Michal Konturek on 30/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKLengthUnit+Imperial.h"

@implementation MKLengthUnit (Imperial)

+ (instancetype)inch {
    static NSString *name   = @"inch";
    static NSString *symbol = @"in";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:254 exponent:-4 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)foot {
    static NSString *name   = @"foot";
    static NSString *symbol = @"ft";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:3048 exponent:-4 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)yard {
    static NSString *name   = @"yard";
    static NSString *symbol = @"yd";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:9144 exponent:-4 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)chain {
    static NSString *name   = @"chain";
    static NSString *symbol = @"ch";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:201168 exponent:-4 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)furlong {
    static NSString *name   = @"furlong";
    static NSString *symbol = @"fur";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:201168 exponent:-3 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)mile {
    static NSString *name   = @"mile";
    static NSString *symbol = @"mi";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1609344 exponent:-3 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)nautical_mile {
    static NSString *name   = @"nautical mile";
    static NSString *symbol = @"nmi";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1853184 exponent:-3 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

@end

@implementation MKQuantity (MKLengthUnit_Imperial)

+ (instancetype)length_inchWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKLengthUnit inch]];
}

+ (instancetype)length_footWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKLengthUnit foot]];
}

+ (instancetype)length_yardWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKLengthUnit yard]];
}

+ (instancetype)length_chainWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKLengthUnit chain]];
}

+ (instancetype)length_furlongWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKLengthUnit furlong]];
}

+ (instancetype)length_mileWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKLengthUnit mile]];
}

+ (instancetype)length_nautical_mileWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKLengthUnit nautical_mile]];
}

@end
