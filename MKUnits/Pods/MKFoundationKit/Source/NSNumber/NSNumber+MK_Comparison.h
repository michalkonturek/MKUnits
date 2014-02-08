//
//  NSNumber+MK_Comparison.h
//  MKFoundationKit
//
//  Created by Michal Konturek on 06/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (MK_Comparison)

- (BOOL)mk_isTheSame:(NSNumber *)other;

- (BOOL)mk_isGreaterThan:(NSNumber *)other;

- (BOOL)mk_isLessThan:(NSNumber *)other;

- (BOOL)mk_isEven;

- (BOOL)mk_isOdd;

@end
