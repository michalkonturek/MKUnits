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

+ (instancetype)tonne;
+ (instancetype)megagram;
+ (instancetype)kilogram;
+ (instancetype)decagram;
+ (instancetype)gram;
+ (instancetype)miligram;

@end

@interface MKQuantity (MKMassUnit)

+ (instancetype)mass_gramWithAmount:(NSNumber *)amount;
+ (instancetype)mass_kilogramWithAmount:(NSNumber *)amount;

- (instancetype)mass_convertToGram;
- (instancetype)mass_convertToKilogram;

@end
