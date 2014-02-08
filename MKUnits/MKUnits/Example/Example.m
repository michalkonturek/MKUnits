//
//  Example.m
//  MKUnits
//
//  Created by Michal Konturek on 08/02/2014.
//  Copyright (c) 2014 Michal Konturek. All rights reserved.
//

#import "Example.h"

#import "MKUnits.h"

@implementation Example

+ (void)run {
    id kilograms = [@1.5 mass_kilogram];
    id grams = [@500 mass_gram];
    
    id pounds = [@10 mass_pound];
    NSLog(@"%@", [pounds convertTo:[MKMassUnit kilogram]]);
    
    id milligrams = [@100 mass_milligram];
    id result = [[[kilograms add:grams] add:pounds] subtract:milligrams];
    NSLog(@"%@", result);
    
    id ounces = [[@0.5358237 mass_kilogram] convertTo:[MKMassUnit ounce]];
    NSLog(@"%@", ounces);
    
    result = [result subtract:ounces];
    NSLog(@"%@", result);
    
    result = [result convertTo:[MKMassUnit stone]];
    NSLog(@"%@", result);
    
    id stone_quantity = [result quantityWithPrecision:3];
    NSLog(@"%@", stone_quantity);
    
    id amount_in_stones_1 = [result amountWithPrecision:3];
    NSLog(@"%@", amount_in_stones_1);
    
    id amount_in_stones_2 = [[result amount] mk_roundedWithPrecision:3];
    NSLog(@"%@", amount_in_stones_2);
}

@end
