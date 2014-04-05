//
//  MKMassUnit+Imperial.h
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

#import "MKMassUnit.h"

@interface MKMassUnit (Imperial)

+ (instancetype)grain;
+ (instancetype)drachm;
+ (instancetype)ounce;
+ (instancetype)pound;
+ (instancetype)stone;
+ (instancetype)quarter;
+ (instancetype)hundredweight;
+ (instancetype)ton;

@end

@interface MKQuantity (MKMassUnit_Imperial)

+ (instancetype)mass_grainWithAmount:(NSNumber *)amount;
+ (instancetype)mass_drachmWithAmount:(NSNumber *)amount;
+ (instancetype)mass_ounceWithAmount:(NSNumber *)amount;
+ (instancetype)mass_poundWithAmount:(NSNumber *)amount;
+ (instancetype)mass_stoneWithAmount:(NSNumber *)amount;
+ (instancetype)mass_quarterWithAmount:(NSNumber *)amount;
+ (instancetype)mass_hundredweightWithAmount:(NSNumber *)amount;
+ (instancetype)mass_tonWithAmount:(NSNumber *)amount;

@end

@interface NSNumber (MKMassUnit_Imperial)

- (MKQuantity *)mass_grain;
- (MKQuantity *)mass_drachm;
- (MKQuantity *)mass_ounce;
- (MKQuantity *)mass_pound;
- (MKQuantity *)mass_stone;
- (MKQuantity *)mass_quarter;
- (MKQuantity *)mass_hundredweight;
- (MKQuantity *)mass_ton;

@end
