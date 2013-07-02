//
//  MKUnit+Conversion.h
//  MKUnits
//
//  Created by Michal Konturek on 02/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKUnit.h"

FOUNDATION_EXPORT NSString * const UNITS_NOT_CONVERTIBLE;

@interface MKUnit (Conversion)

+ (NSNumber *)convertAmount:(NSNumber *)amount from:(MKUnit *)from to:(MKUnit *)to;

- (NSNumber *)convertAmount:(NSNumber *)amount from:(MKUnit *)unit;
- (NSNumber *)convertAmount:(NSNumber *)amount to:(MKUnit *)unit;
- (NSNumber *)convertAmount:(NSNumber *)amount from:(MKUnit *)from to:(MKUnit *)to;

- (BOOL)isConvertibleWith:(MKUnit *)unit;

@end
