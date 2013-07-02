//
//  MKUnit.h
//  MKUnits
//
//  Created by Michal Konturek on 27/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

//FOUNDATION_EXPORT NSString * const UNITS_NOT_CONVERTIBLE;

@interface MKUnit : NSObject<NSCopying>

//+ (NSNumber *)convertAmount:(NSNumber *)amount from:(MKUnit *)from to:(MKUnit *)to;

+ (instancetype)createWithName:(NSString *)name
                    withSymbol:(NSString *)symbol withRatio:(NSDecimalNumber *)ratio;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *symbol;
@property (nonatomic, strong) NSDecimalNumber *ratio;

- (id)initWithName:(NSString *)name
        withSymbol:(NSString *)symbol withRatio:(NSDecimalNumber *)ratio;

//- (NSNumber *)convertAmount:(NSNumber *)amount from:(MKUnit *)unit;
//- (NSNumber *)convertAmount:(NSNumber *)amount to:(MKUnit *)unit;
//- (NSNumber *)convertAmount:(NSNumber *)amount from:(MKUnit *)from to:(MKUnit *)to;

//- (BOOL)isConvertibleWith:(MKUnit *)unit;

- (NSNumber *)convertToBaseUnit:(NSNumber *)amount;
- (NSNumber *)convertFromBaseUnit:(NSNumber *)amount;

@end
