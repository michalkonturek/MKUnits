//
//  MKLengthUnit.h
//  MKUnitConverter
//
//  Created by Michal Konturek on 27/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKUnit.h"
#import "MKQuantity.h"

@interface MKLengthUnit : MKUnit

+ (instancetype)millimeter;
+ (instancetype)centimeter;
+ (instancetype)meter;
+ (instancetype)kilometer;

@end

@interface MKQuantity (Length)

+ (instancetype)length_millimeterWithAmount:(NSNumber *)amount;
+ (instancetype)length_centimeterWithAmount:(NSNumber *)amount;
+ (instancetype)length_meterWithAmount:(NSNumber *)amount;
+ (instancetype)length_kilometerWithAmount:(NSNumber *)amount;

- (instancetype)length_convertToMilimeter;
- (instancetype)length_convertToCentimeter;
- (instancetype)length_convertToMeter;
- (instancetype)length_convertToKilometer;
- (instancetype)length_convertTo:(MKLengthUnit *)other;

@end
