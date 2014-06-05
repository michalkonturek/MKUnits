//
//  MKVolumeUnit+US.h
//  MKUnits
//
//  Created by Michal Konturek on 05/06/2014.
//  Copyright (c) 2014 Michal Konturek. All rights reserved.
//

/*
 Contributor: Roslyn Cyrus (rozmichelle)
 */

#import "MKVolumeUnit.h"

@interface MKVolumeUnit (US)

+ (instancetype)us_minim;
+ (instancetype)us_fluidram;
+ (instancetype)us_teaspoon;
+ (instancetype)us_tablespoon;
+ (instancetype)us_fluidounce;
+ (instancetype)us_gill;
+ (instancetype)us_cup;
+ (instancetype)us_pint;
+ (instancetype)us_quart;
+ (instancetype)us_gallon;
+ (instancetype)us_barrel;
+ (instancetype)us_hogshead;

@end

@interface MKQuantity (MKVolumeUnit_US)

+ (instancetype)volume_us_minimWithAmount:(NSNumber *)amount;
+ (instancetype)volume_us_fluidramWithAmount:(NSNumber *)amount;
+ (instancetype)volume_us_teaspoonWithAmount:(NSNumber *)amount;
+ (instancetype)volume_us_tablespoonWithAmount:(NSNumber *)amount;
+ (instancetype)volume_us_fluidounceWithAmount:(NSNumber *)amount;
+ (instancetype)volume_us_gillWithAmount:(NSNumber *)amount;
+ (instancetype)volume_us_cupWithAmount:(NSNumber *)amount;
+ (instancetype)volume_us_pintWithAmount:(NSNumber *)amount;
+ (instancetype)volume_us_quartWithAmount:(NSNumber *)amount;
+ (instancetype)volume_us_gallonWithAmount:(NSNumber *)amount;
+ (instancetype)volume_us_barrelWithAmount:(NSNumber *)amount;
+ (instancetype)volume_us_hogsheadWithAmount:(NSNumber *)amount;

@end

@interface NSNumber (MKVolumeUnit_US)

- (MKQuantity *)volume_us_minim;
- (MKQuantity *)volume_us_fluidram;
- (MKQuantity *)volume_us_teaspoon;
- (MKQuantity *)volume_us_tablespoon;
- (MKQuantity *)volume_us_fluidounce;
- (MKQuantity *)volume_us_gill;
- (MKQuantity *)volume_us_cup;
- (MKQuantity *)volume_us_pint;
- (MKQuantity *)volume_us_quart;
- (MKQuantity *)volume_us_gallon;
- (MKQuantity *)volume_us_barrel;
- (MKQuantity *)volume_us_hogshead;

@end