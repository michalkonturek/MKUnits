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
    // 4.5359237 kg
    
    id milligrams = [@100 mass_milligram];
    id result = [[[kilograms add:grams] add:pounds] subtract:milligrams];
    NSLog(@"%@", result);
    // 6.5358237 kg
    
    id ounces = [[@0.5358237 mass_kilogram] convertTo:[MKMassUnit ounce]];
    NSLog(@"%@", ounces);
    // 18.900624805483390296005199558361177 oz
    
    result = [result subtract:ounces];
    NSLog(@"%@", result);
    // 6.00000000000000000000000000000000003 kg
    
    result = [result convertTo:[MKMassUnit stone]];
    NSLog(@"%@", result);
    // 0.94483873964811055873038869091017890993 st
    
    id stone_quantity = [result quantityWithPrecision:3];
    NSLog(@"%@", stone_quantity);
    // 0.945 st
    
    id amount_in_stones_1 = [result amountWithPrecision:3];
    NSLog(@"%@", amount_in_stones_1);
    // 0.945
    
    id amount_in_stones_2 = [[result amount] mk_roundedWithPrecision:3];
    NSLog(@"%@", amount_in_stones_2);
    // 0.945
    
    id cal = [@2689.4 energy_calorie];
    id kcal = [cal convertTo:[MKEnergyUnit kiloCalorie]];
    id joules = [cal convertTo:[MKEnergyUnit joule]];
    NSLog(@"%@%@ == %@%@", [[kcal amount] mk_roundedWithPrecision:4], [kcal unit], [[joules amount] mk_roundedWithPrecision:2], [joules unit]);
    // 2.6894kcal == 11259.98J
}

@end

