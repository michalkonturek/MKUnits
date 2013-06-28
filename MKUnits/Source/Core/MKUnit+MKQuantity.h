//
//  MKUnit+MKQuantity.h
//  MKUnits
//
//  Created by Michal Konturek on 27/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKUnit.h"

@class MKQuantity;

@interface MKUnit (MKQuantity)

- (MKQuantity *)quantityWithAmount:(NSNumber *)amount;

@end
