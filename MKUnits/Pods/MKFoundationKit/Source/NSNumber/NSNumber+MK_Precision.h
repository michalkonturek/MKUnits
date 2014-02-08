//
//  NSNumber+MK_Precision.h
//  MKFoundationKit
//
//  Created by Michal Konturek on 02/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (MK_Precision)

+ (NSDecimalNumberHandler *)mk_decimalNumberHandlerWithScale:(short)scale;

- (instancetype)mk_roundedAsMoney;
- (instancetype)mk_roundedWithPrecision:(short)precision;

@end
