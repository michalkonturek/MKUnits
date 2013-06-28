//
//  MKUnit+Test.m
//  MKUnits
//
//  Created by Michal Konturek on 28/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKUnit+Test.h"

@implementation MKUnit (Test)

+ (instancetype)unit_A {
    static NSString *name   = @"Unit A";
    static NSString *symbol = @"unit-a";
    id ratio = [NSDecimalNumber one];
    
    return [[self alloc] initWithName:name
                           withSymbol:symbol
                            withRatio:ratio];
}

+ (instancetype)unit_B {
    static NSString *name   = @"Unit B";
    static NSString *symbol = @"unit-b";
    id ratio = [[NSDecimalNumber one] decimalNumberByAdding:[NSDecimalNumber one]];
    
    return [[self alloc] initWithName:name
                           withSymbol:symbol
                            withRatio:ratio];
}

@end
