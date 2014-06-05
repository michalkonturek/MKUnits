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

#import "MKVolumeUnit.h"

@interface MKVolumeUnit (Imperial)

+ (instancetype)fluidram;
+ (instancetype)teaspoon;
+ (instancetype)tablespoon;
+ (instancetype)fluidounce;
+ (instancetype)cup;
+ (instancetype)pint;
+ (instancetype)quart;
+ (instancetype)gallon;

@end

@interface MKQuantity (MKVolumeUnit_Imperial)

+ (instancetype)volume_fluidramWithAmount:(NSNumber *)amount;
+ (instancetype)volume_teaspoonWithAmount:(NSNumber *)amount;
+ (instancetype)volume_tablespoonWithAmount:(NSNumber *)amount;
+ (instancetype)volume_fluidounceWithAmount:(NSNumber *)amount;
+ (instancetype)volume_cupWithAmount:(NSNumber *)amount;
+ (instancetype)volume_pintWithAmount:(NSNumber *)amount;
+ (instancetype)volume_quartWithAmount:(NSNumber *)amount;
+ (instancetype)volume_gallonWithAmount:(NSNumber *)amount;

@end

@interface NSNumber (MKVolumeUnit_Imperial)

- (MKQuantity *)volume_fluidram;
- (MKQuantity *)volume_teaspoon;
- (MKQuantity *)volume_tablespoon;
- (MKQuantity *)volume_fluidounce;
- (MKQuantity *)volume_cup;
- (MKQuantity *)volume_pint;
- (MKQuantity *)volume_quart;
- (MKQuantity *)volume_gallon;

@end
