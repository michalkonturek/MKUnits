//
//  MKEnergyUnit.m
//  MKUnitConverter
//
//  Copyright (c) 2014 Natalia Osiecka
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "MKEnergyUnit.h"

@implementation MKEnergyUnit : MKUnit

+ (instancetype)calorie {
    static NSString *name   = @"calorie";
    static NSString *symbol = @"cal";
    id ratio = [NSDecimalNumber one];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)kilocalorie {
    static NSString *name   = @"kiloCalorie";
    static NSString *symbol = @"kcal";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:3 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)joule {
    static NSString *name   = @"joule";
    static NSString *symbol = @"J";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:2388459 exponent:-7 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)kilojoule {
    static NSString *name   = @"kiloJoule";
    static NSString *symbol = @"kJ";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:2388459 exponent:-4 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)megajoule {
    static NSString *name   = @"megaJoule";
    static NSString *symbol = @"MJ";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:2388459 exponent:-1 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)gigajoule {
    static NSString *name   = @"gigaJoule";
    static NSString *symbol = @"GJ";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:2388459 exponent:2 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

@end

@implementation MKQuantity (EnergyUnit)

+ (instancetype)energy_calorieWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKEnergyUnit calorie]];
}
    
+ (instancetype)energy_kilocalorieWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKEnergyUnit kilocalorie]];
}

+ (instancetype)energy_jouleWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKEnergyUnit joule]];
}

+ (instancetype)energy_kilojouleWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKEnergyUnit kilojoule]];
}

+ (instancetype)energy_megajouleWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKEnergyUnit megajoule]];
}

+ (instancetype)energy_gigajouleWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKEnergyUnit gigajoule]];
}

@end

@implementation NSNumber (EnergyUnit)

- (MKQuantity *)energy_calorie {
    return [MKQuantity energy_calorieWithAmount:self];
}

- (MKQuantity *)energy_kilocalorie {
    return [MKQuantity energy_kilocalorieWithAmount:self];
}

- (MKQuantity *)energy_joule {
    return [MKQuantity energy_jouleWithAmount:self];
}

- (MKQuantity *)energy_kilojoule {
    return [MKQuantity energy_kilojouleWithAmount:self];
}

- (MKQuantity *)energy_megajoule {
    return [MKQuantity energy_megajouleWithAmount:self];
}

- (MKQuantity *)energy_gigajoule {
    return [MKQuantity energy_gigajouleWithAmount:self];
}

@end
