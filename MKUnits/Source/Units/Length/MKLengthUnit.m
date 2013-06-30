//
//  MKLengthUnit.m
//  MKUnitConverter
//
//  Created by Michal Konturek on 27/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKLengthUnit.h"

@implementation MKLengthUnit

+ (instancetype)millimeter {
    static NSString *name   = @"millimeter";
    static NSString *symbol = @"mm";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:-3 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)centimeter {
    static NSString *name   = @"centimeter";
    static NSString *symbol = @"cm";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:-2 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)meter {
    static NSString *name   = @"meter";
    static NSString *symbol = @"m";
    id ratio = [NSDecimalNumber one];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)kilometer {
    static NSString *name   = @"kilometer";
    static NSString *symbol = @"km";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:3 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

@end


@implementation MKQuantity (MKLengthUnit)

+ (instancetype)length_centimeterWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKLengthUnit centimeter]];
}

+ (instancetype)length_kilometerWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKLengthUnit kilometer]];
}

+ (instancetype)length_meterWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKLengthUnit meter]];
}

+ (instancetype)length_millimeterWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKLengthUnit millimeter]];
}

- (instancetype)length_convertToKilometer {
    return [self convertTo:[MKLengthUnit kilometer]];
}

- (instancetype)length_convertToMeter {
    return [self convertTo:[MKLengthUnit meter]];
}

- (instancetype)length_convertToCentimeter {
    return [self convertTo:[MKLengthUnit centimeter]];
}

- (instancetype)length_convertToMilimeter {
    return [self convertTo:[MKLengthUnit millimeter]];
}

@end
