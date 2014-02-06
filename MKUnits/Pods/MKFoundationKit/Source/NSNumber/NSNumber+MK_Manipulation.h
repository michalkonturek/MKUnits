//
//  NSNumber+MK_Manipulation.h
//  MKFoundationKit
//
//  Created by Michal Konturek on 02/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (MK_Manipulation)

- (instancetype)mk_add:(NSNumber *)other;

- (instancetype)mk_subtract:(NSNumber *)other;

- (instancetype)mk_multiplyBy:(NSNumber *)other;

- (instancetype)mk_divideBy:(NSNumber *)other;

- (instancetype)mk_raiseToPower:(NSInteger)power;

@end
