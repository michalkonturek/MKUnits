//
//  NSNumber+Fraction.h
//  MKUnits
//
//  Created by Michal Konturek on 30/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Fraction)

+ (NSDecimalNumberHandler *)decimalNumberHandlerWithScale:(short)scale;

- (NSNumber *)integerPart;
- (NSNumber *)fractionPart;

- (NSDecimalNumber *)decimalNumberWithPrecision:(short)precision;
- (NSDecimalNumber *)decimalNumber;

@end
