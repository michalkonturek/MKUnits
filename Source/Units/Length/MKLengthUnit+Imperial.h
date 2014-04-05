//
//  MKLengthUnit+Imperial.h
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

#import "MKLengthUnit.h"

@interface MKLengthUnit (Imperial)

+ (instancetype)inch;
+ (instancetype)foot;
+ (instancetype)yard;
+ (instancetype)chain;
+ (instancetype)furlong;
+ (instancetype)mile;
+ (instancetype)nautical_mile;

@end

@interface MKQuantity (MKLengthUnit_Imperial)

+ (instancetype)length_inchWithAmount:(NSNumber *)amount;
+ (instancetype)length_footWithAmount:(NSNumber *)amount;
+ (instancetype)length_yardWithAmount:(NSNumber *)amount;
+ (instancetype)length_chainWithAmount:(NSNumber *)amount;
+ (instancetype)length_furlongWithAmount:(NSNumber *)amount;
+ (instancetype)length_mileWithAmount:(NSNumber *)amount;
+ (instancetype)length_nautical_mileWithAmount:(NSNumber *)amount;

@end

@interface NSNumber (MKLengthUnit_Imperial)

- (MKQuantity *)length_inch;
- (MKQuantity *)length_foot;
- (MKQuantity *)length_yard;
- (MKQuantity *)length_chain;
- (MKQuantity *)length_furlong;
- (MKQuantity *)length_mile;
- (MKQuantity *)length_nautical_mile;

@end
