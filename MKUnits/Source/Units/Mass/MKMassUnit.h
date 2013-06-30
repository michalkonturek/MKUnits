//
//  MKMassUnit.h
//  MKUnits
//
//  Created by Michal Konturek on 28/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKUnit.h"
#import "MKQuantity.h"

@interface MKMassUnit : MKUnit

+ (instancetype)milligram;
+ (instancetype)gram;
+ (instancetype)decagram;
+ (instancetype)kilogram;
+ (instancetype)megagram;
+ (instancetype)tonne;

@end

@interface MKQuantity (MKMassUnit)

+ (instancetype)mass_milligramWithAmount:(NSNumber *)amount;
+ (instancetype)mass_gramWithAmount:(NSNumber *)amount;
+ (instancetype)mass_decagramWithAmount:(NSNumber *)amount;
+ (instancetype)mass_kilogramWithAmount:(NSNumber *)amount;
+ (instancetype)mass_megagramWithAmount:(NSNumber *)amount;
+ (instancetype)mass_tonneWithAmount:(NSNumber *)amount;

- (instancetype)mass_convertToGram;
- (instancetype)mass_convertToKilogram;

@end
