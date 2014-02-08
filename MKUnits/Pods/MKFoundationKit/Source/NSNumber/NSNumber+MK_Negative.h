//
//  NSNumber+MK_Negative.h
//  MKFoundationKit
//
//  Created by Michal Konturek on 02/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (MK_Negative)

+ (instancetype)mk_minusOne;

- (instancetype)mk_negative;
- (instancetype)mk_positive;;

- (instancetype)mk_negate;

- (BOOL)mk_isPositive;
- (BOOL)mk_isNegative;

@end
