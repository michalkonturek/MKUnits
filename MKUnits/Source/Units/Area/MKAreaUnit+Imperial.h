//
//  MKAreaUnit+Imperial.h
//  MKUnits
//
//  Created by Michal Konturek on 30/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKAreaUnit.h"

@interface MKAreaUnit (Imperial)

+ (instancetype)square_inch;
+ (instancetype)square_foot;
+ (instancetype)square_yard;
+ (instancetype)acre;
+ (instancetype)square_mile;

@end

@interface MKQuantity (MKAreaUnit_Imperial)

+ (instancetype)area_square_inchWithAmount:(NSNumber *)amount;
+ (instancetype)area_square_footWithAmount:(NSNumber *)amount;
+ (instancetype)area_square_yardWithAmount:(NSNumber *)amount;
+ (instancetype)area_acreWithAmount:(NSNumber *)amount;
+ (instancetype)area_square_mileWithAmount:(NSNumber *)amount;

@end
