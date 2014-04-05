//
//  MKMassUnit.h
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

@interface MKMassUnit : MKUnit

+ (instancetype)milligram;
+ (instancetype)gram;
+ (instancetype)decagram;
+ (instancetype)kilogram;
+ (instancetype)megagram;
+ (instancetype)tonne;

@end

@interface MKQuantity (MKMassUnit)

+ (instancetype)mass_milligramWithAmount:(NSNumber *)amount;
+ (instancetype)mass_gramWithAmount:(NSNumber *)amount;
+ (instancetype)mass_decagramWithAmount:(NSNumber *)amount;
+ (instancetype)mass_kilogramWithAmount:(NSNumber *)amount;
+ (instancetype)mass_megagramWithAmount:(NSNumber *)amount;
+ (instancetype)mass_tonneWithAmount:(NSNumber *)amount;

- (instancetype)mass_convertToGram;
- (instancetype)mass_convertToKilogram;

@end

@interface NSNumber (MKMassUnit)

- (MKQuantity *)mass_milligram;
- (MKQuantity *)mass_gram;
- (MKQuantity *)mass_decagram;
- (MKQuantity *)mass_kilogram;
- (MKQuantity *)mass_megagram;
- (MKQuantity *)mass_tonne;

@end
