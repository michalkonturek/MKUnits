//
//  MKVolumeUnit.h
//  MKUnits
//
//  Created by Michal Konturek on 02/06/2014.
//  Copyright (c) 2014 Michal Konturek. All rights reserved.
//

#import "MKUnit.h"
#import "MKQuantity.h"

@interface MKVolumeUnit : MKUnit

+ (instancetype)microlitre;
+ (instancetype)millilitre;
+ (instancetype)centilitre;
+ (instancetype)decilitre;
+ (instancetype)litre;
+ (instancetype)hectolitre;

@end

@interface MKQuantity (MKVolumeUnit)

+ (instancetype)volume_microlitreWithAmount:(NSNumber *)amount;
+ (instancetype)volume_millilitreWithAmount:(NSNumber *)amount;
+ (instancetype)volume_centilitreWithAmount:(NSNumber *)amount;
+ (instancetype)volume_decilitreWithAmount:(NSNumber *)amount;
+ (instancetype)volume_litreWithAmount:(NSNumber *)amount;
+ (instancetype)volume_hectolitreWithAmount:(NSNumber *)amount;

@end

@interface NSNumber (MKVolumeUnit)

- (MKQuantity *)volume_microlitre;
- (MKQuantity *)volume_millilitre;
- (MKQuantity *)volume_centilitre;
- (MKQuantity *)volume_decilitre;
- (MKQuantity *)volume_litre;
- (MKQuantity *)volume_hectolitre;

@end