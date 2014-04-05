//
//  MKAreaUnit+Imperial.h
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

#import "MKAreaUnit.h"

@interface MKAreaUnit (Imperial)

+ (instancetype)square_inch;
+ (instancetype)square_foot;
+ (instancetype)square_yard;
+ (instancetype)acre;
+ (instancetype)square_mile;

@end

@interface MKQuantity (MKAreaUnit_Imperial)

+ (instancetype)area_square_inchWithAmount:(NSNumber *)amount;
+ (instancetype)area_square_footWithAmount:(NSNumber *)amount;
+ (instancetype)area_square_yardWithAmount:(NSNumber *)amount;
+ (instancetype)area_acreWithAmount:(NSNumber *)amount;
+ (instancetype)area_square_mileWithAmount:(NSNumber *)amount;

@end

@interface NSNumber (MKAreaUnit_Imperial)

- (MKQuantity *)area_square_inch;
- (MKQuantity *)area_square_foot;
- (MKQuantity *)area_square_yard;
- (MKQuantity *)area_acre;
- (MKQuantity *)area_square_mile;

@end
