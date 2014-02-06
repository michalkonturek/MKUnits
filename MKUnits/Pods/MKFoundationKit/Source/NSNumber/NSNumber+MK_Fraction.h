//
//  NSNumber+MK_Fraction.h
//  MKFoundationKit
//
//  Created by Michal Konturek on 30/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (MK_Fraction)

- (instancetype)mk_integralPart;
- (instancetype)mk_fractionalPart;

- (BOOL)mk_isInteger;
- (BOOL)mk_isFraction;

@end
