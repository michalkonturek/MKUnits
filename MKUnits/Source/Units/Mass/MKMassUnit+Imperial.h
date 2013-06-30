//
//  MKMassUnit+Imperial.h
//  MKUnits
//
//  Created by Michal Konturek on 30/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKMassUnit.h"

@interface MKMassUnit (Imperial)

+ (instancetype)grain;
+ (instancetype)drachm;
+ (instancetype)ounce;
+ (instancetype)pound;
+ (instancetype)stone;
+ (instancetype)quarter;
+ (instancetype)hundredweight;
+ (instancetype)ton;

@end

@interface MKQuantity (MKMassUnit_Imperial)

+ (instancetype)mass_grainWithAmount:(NSNumber *)amount;
+ (instancetype)mass_drachmWithAmount:(NSNumber *)amount;
+ (instancetype)mass_ounceWithAmount:(NSNumber *)amount;
+ (instancetype)mass_poundWithAmount:(NSNumber *)amount;
+ (instancetype)mass_stoneWithAmount:(NSNumber *)amount;
+ (instancetype)mass_quarterWithAmount:(NSNumber *)amount;
+ (instancetype)mass_hundredweightWithAmount:(NSNumber *)amount;
+ (instancetype)mass_tonWithAmount:(NSNumber *)amount;

@end
