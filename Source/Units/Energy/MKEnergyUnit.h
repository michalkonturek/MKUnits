//
//  MKEnergyUnit.h
//  MKUnitConverter
//
//  Copyright (c) 2014 Natalia Osiecka
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

@interface MKEnergyUnit : MKUnit

+ (instancetype)calorie;
+ (instancetype)kilocalorie;

+ (instancetype)joule;
+ (instancetype)kilojoule;
+ (instancetype)megajoule;
+ (instancetype)gigajoule;

@end

@interface MKQuantity (EnergyUnit)

+ (instancetype)energy_calorieWithAmount:(NSNumber *)amount;
+ (instancetype)energy_kilocalorieWithAmount:(NSNumber *)amount;

+ (instancetype)energy_jouleWithAmount:(NSNumber *)amount;
+ (instancetype)energy_kilojouleWithAmount:(NSNumber *)amount;
+ (instancetype)energy_megajouleWithAmount:(NSNumber *)amount;
+ (instancetype)energy_gigajouleWithAmount:(NSNumber *)amount;

@end

@interface NSNumber (EnergyUnit)

- (MKQuantity *)energy_calorie;
- (MKQuantity *)energy_kilocalorie;

- (MKQuantity *)energy_joule;
- (MKQuantity *)energy_kilojoule;
- (MKQuantity *)energy_megajoule;
- (MKQuantity *)energy_gigajoule;

@end
