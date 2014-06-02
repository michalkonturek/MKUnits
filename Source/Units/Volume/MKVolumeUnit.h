//
//  MKVolumeUnit.h
//  MKUnits
//
//  Copyright (c) 2013 Michal Konturek
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "MKUnit.h"
#import "MKQuantity.h"

//METRIC VOLUME MEASUREMENTS - created by Roz

@interface MKVolumeUnit : MKUnit

+ (instancetype)gallon;
+ (instancetype)quart;
+ (instancetype)pint;
+ (instancetype)cup;
+ (instancetype)tablespoon;
+ (instancetype)teaspoon;
+ (instancetype)fluidounce;

@end

@interface MKQuantity (MKVolumeUnit)

+ (instancetype)volume_gallonWithAmount:(NSNumber *)amount;
+ (instancetype)volume_quartWithAmount:(NSNumber *)amount;
+ (instancetype)volume_pintWithAmount:(NSNumber *)amount;
+ (instancetype)volume_cupWithAmount:(NSNumber *)amount;
+ (instancetype)volume_tablespoonWithAmount:(NSNumber *)amount;
+ (instancetype)volume_teaspoonWithAmount:(NSNumber *)amount;
+ (instancetype)volume_fluidounceWithAmount:(NSNumber *)amount;

- (instancetype)volume_convertToCup;
- (instancetype)volume_convertToFluidOunce;

@end

@interface NSNumber (MKVolumeUnit)

- (MKQuantity *)volume_gallon;
- (MKQuantity *)volume_quart;
- (MKQuantity *)volume_pint;
- (MKQuantity *)volume_cup;
- (MKQuantity *)volume_tablespoon;
- (MKQuantity *)volume_teaspoon;
- (MKQuantity *)volume_fluidounce;

@end
