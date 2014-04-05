//
//  MKAreaUnit.h
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

@interface MKAreaUnit : MKUnit

+ (instancetype)square_millimeter;
+ (instancetype)square_centimeter;
+ (instancetype)square_decimeter;
+ (instancetype)square_meter;
+ (instancetype)are;
+ (instancetype)hectare;
+ (instancetype)square_kilometer;

@end

@interface MKQuantity (MKAreaUnit)

+ (instancetype)area_square_millimeterWithAmount:(NSNumber *)amount;
+ (instancetype)area_square_centimeterWithAmount:(NSNumber *)amount;
+ (instancetype)area_square_decimeterWithAmount:(NSNumber *)amount;
+ (instancetype)area_square_meterWithAmount:(NSNumber *)amount;
+ (instancetype)area_areWithAmount:(NSNumber *)amount;
+ (instancetype)area_hectareWithAmount:(NSNumber *)amount;
+ (instancetype)area_square_kilometerWithAmount:(NSNumber *)amount;

@end

@interface NSNumber (MKAreaUnit)

- (MKQuantity *)area_square_millimeter;
- (MKQuantity *)area_square_centimeter;
- (MKQuantity *)area_square_decimeter;
- (MKQuantity *)area_square_meter;
- (MKQuantity *)area_are;
- (MKQuantity *)area_hectare;
- (MKQuantity *)area_square_kilometer;

@end
