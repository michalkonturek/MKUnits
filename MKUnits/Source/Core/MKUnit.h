//
//  MKUnit.h
//  MKUnits
//
//  Created by Michal Konturek on 27/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MKUnit : NSObject<NSCopying>

+ (instancetype)createWithName:(NSString *)name
                    withSymbol:(NSString *)symbol withRatio:(NSDecimalNumber *)ratio;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *symbol;
@property (nonatomic, strong) NSDecimalNumber *ratio;

- (id)initWithName:(NSString *)name
        withSymbol:(NSString *)symbol withRatio:(NSDecimalNumber *)ratio;

- (NSNumber *)convertToBaseUnit:(NSNumber *)amount;
- (NSNumber *)convertFromBaseUnit:(NSNumber *)amount;

@end
