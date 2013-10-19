//
//  NSDecimalNumber+Negative.h
//
//  Created by Michal Konturek on 25/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDecimalNumber (Negative)

+ (NSDecimalNumber *)createFrom:(NSNumber *)number;
+ (NSDecimalNumber *)minusOne;

- (NSDecimalNumber *)negate;

@end
