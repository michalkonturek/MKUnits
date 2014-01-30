//
//  MKAreaUnit+Imperial.m
//  MKUnits
//
//  Created by Michal Konturek on 30/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKAreaUnit+Imperial.h"

@implementation MKAreaUnit (Imperial)

+ (instancetype)square_inch {
    static NSString *name   = @"square inch";
    static NSString *symbol = @"sq in";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:64516 exponent:-8 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)square_foot {
    static NSString *name   = @"square foot";
    static NSString *symbol = @"sq ft";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:9290304 exponent:-8 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)square_yard {
    static NSString *name   = @"square yard";
    static NSString *symbol = @"sq yd";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:83612736 exponent:-8 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)acre {
    static NSString *name   = @"acre";
    static NSString *symbol = @"ac";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:40468564224 exponent:-7 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)square_mile {
    static NSString *name   = @"square mile";
    static NSString *symbol = @"sq mi";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:258998811 exponent:-2 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

@end

@implementation MKQuantity (MKAreaUnit_Imperial)

+ (instancetype)area_square_inchWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKAreaUnit square_inch]];
}

+ (instancetype)area_square_footWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKAreaUnit square_foot]];
}

+ (instancetype)area_square_yardWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKAreaUnit square_yard]];
}

+ (instancetype)area_acreWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKAreaUnit acre]];
}

+ (instancetype)area_square_mileWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKAreaUnit square_mile]];
}

@end
