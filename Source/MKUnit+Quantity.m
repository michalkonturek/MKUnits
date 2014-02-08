//
//  MKUnit+Quantity.m
//  MKUnits
//
//  Created by Michal Konturek on 27/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKUnit+Quantity.h"

#import "MKQuantity.h"

@implementation MKUnit (Quantity)

- (MKQuantity *)quantityWithAmount:(NSNumber *)amount {
    return [MKQuantity createWithAmount:amount withUnit:self];
}

@end
