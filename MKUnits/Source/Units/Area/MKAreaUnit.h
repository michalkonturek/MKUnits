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

+ (instancetype)area_square_millimeterWithQuantity:(NSNumber *)amount;
+ (instancetype)area_square_centimeterWithQuantity:(NSNumber *)amount;
+ (instancetype)area_square_decimeterWithQuantity:(NSNumber *)amount;
+ (instancetype)area_square_meterWithQuantity:(NSNumber *)amount;
+ (instancetype)area_areWithQuantity:(NSNumber *)amount;
+ (instancetype)area_hectareWithQuantity:(NSNumber *)amount;
+ (instancetype)area_square_kilometerWithQuantity:(NSNumber *)amount;

@end
