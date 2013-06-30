//
//  MKAreaUnit.h
//  MKUnits
//
//  Created by Michal Konturek on 30/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKUnit.h"
#import "MKQuantity.h"

@interface MKAreaUnit : MKUnit

+ (instancetype)square_millimeter;
+ (instancetype)square_centimeter;
+ (instancetype)square_decimeter;
+ (instancetype)square_meter;
+ (instancetype)are;
+ (instancetype)hectare;
+ (instancetype)square_kilometer;

@end

@interface MKQuantity (MKAreaUnit)

+ (instancetype)area_square_millimeterWithAmount:(NSNumber *)amount;
+ (instancetype)area_square_centimeterWithAmount:(NSNumber *)amount;
+ (instancetype)area_square_decimeterWithAmount:(NSNumber *)amount;
+ (instancetype)area_square_meterWithAmount:(NSNumber *)amount;
+ (instancetype)area_areWithAmount:(NSNumber *)amount;
+ (instancetype)area_hectareWithAmount:(NSNumber *)amount;
+ (instancetype)area_square_kilometerWithAmount:(NSNumber *)amount;

@end
