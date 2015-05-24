# MKUnits

[![Twitter](https://img.shields.io/badge/contact-@MichalKonturek-blue.svg?style=flat)](http://twitter.com/michalkonturek)
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/michalkonturek/MKUnits/blob/master/LICENSE)
[![CocoaPods](https://img.shields.io/cocoapods/v/MKUnits.svg?style=flat)](https://github.com/michalkonturek/MKUnits)
[![Build Status](http://img.shields.io/travis/michalkonturek/MKUnits.svg?style=flat)](https://travis-ci.org/michalkonturek/MKUnits)

<!--[![License MIT](https://go-shields.herokuapp.com/license-MIT-blue.png)](https://github.com/michalkonturek/MKUnits/blob/master/LICENSE)
[![Build Platform](https://cocoapod-badges.herokuapp.com/p/MKUnits/badge.png)](https://github.com/michalkonturek/MKUnits)
[![Build Version](https://cocoapod-badges.herokuapp.com/v/MKUnits/badge.png)](https://github.com/michalkonturek/MKUnits)
[![Build Status](https://travis-ci.org/michalkonturek/MKUnits.png?branch=master)](https://travis-ci.org/michalkonturek/MKUnits)-->

MKUnits is extremely precise unit conversion library for Objective-C. It provides units of measurement of physical quantities and simplifies manipulation of them.


## License

Source code of this project is available under the standard MIT license. Please see [the license file][LICENSE].

[PODS]:http://cocoapods.org/
[LICENSE]:https://github.com/michalkonturek/MKUnits/blob/master/LICENSE


## Example

Let's create 1.5 kilograms **[kg]**,

```objc
id kilograms = [@1.5 mass_kilogram];
```

0.5 **[kg]** in grams **[g]** 

```objc
id grams = [@500 mass_gram];
```

and 10 pounds **[lb]** (which is 4.5359237 **[kg]**)
<!--and 4.5359237 **[kg]** in pounds **[lb]**.-->

```objc
id pounds = [@10 mass_pound];
```

Then we add all of the above togehter and subtract 0.0001 **[kg]** in milligrams **[mg]**.

```objc
id milligrams = [@100 mass_milligram];
id result = [[[kilograms add:grams] add:pounds] subtract:milligrams];
```

The result amount is 6.5358237 **[kg]**.

Now we subtract 0.5358237 **[kg]** in ounces **[oz]**, which is 18.900624805 **[oz]** according to Google converter, but as MKUnits is very precise, it is in fact 18.900624805483390296005199558361177 **[oz]**.

```objc
id ounces = [[@0.5358237 mass_kilogram] convertTo:[MKMassUnit ounce]];
result = [result subtract:ounces];
```

The result amount is ~6 **[kg]**; 6.00000000000000000000000000000000003 **[kg]** to be exact.

Now we want the result to be in stones **[st]**, so:

```objc
result = [result convertTo:[MKMassUnit stone]];
// 0.94483873964811055873038869091017890993 st
```

As the result is too precise for our needs, we want to round it.

We can do that by either creating new `MKQuantity` object with rounded amount,

```objc
id stone_quantity = [result quantityWithPrecision:3];
// 0.945 st
```

or by rounding the amount of existing `MKQuantity`.

```objc
id amount_in_stones_1 = [result amountWithPrecision:3];
// 0.945

id amount_in_stones_2 = [[result amount] mk_roundedWithPrecision:3];;
// 0.945
```

## Swift Integration

MKUnits works with Swift. 

```swift
let kilograms = NSNumber.mass_kilogram(2)()
let pounds = NSNumber.mass_pound(10)()
let result = kilograms.add(pounds)
println(result)
```

You can also integrate imported Objective-C classes with Swift types. For example, by creating an extension for `Int`:

```swift
extension Int {

    func mass_kilogram() -> MKQuantity {
        return MKQuantity.mass_kilogramWithAmount(self)
    }

    func mass_pound() -> MKQuantity {
        return MKQuantity.mass_poundWithAmount(self)
    }
}
```

and then you can do something like that:

```swift
let kilograms = 2.mass_kilogram()
let pounds = 10.mass_pound()
let result = kilograms.add(pounds)
println(result)
```

For Cocoapods Integration with Swift please refer to the my blog post [Integrating Cocoapods with a Swift project][blog].

[blog]:http://michal.codes/integrating-cocoapods-with-a-swift-project/


## Supported Quantities 

At the moment MKUnits supports the following quantities:

* Area (base unit: square meter)
* Bytes (base unit: bit) 
* Mass (base unit: kilogram)
* Length (base unit: meter)
* Time (base unit: second)
* Volume (base unit: litre)

You can easily extend MKUnits by adding new [quantities](#new-quantity) or [units](#new-unit).


## Quick Conversion

MKUnits supports quick number conversion between different units 
without the need of instantiating `MKQuantity` objects.

Converting amount of 1 **[kg]** to 1000 **[g]** can be achieved in the following ways:

```objc
id amount = [MKUnit convertAmount:@1 from:[MKMassUnit kilogram] to:[MKMassUnit gram]];

id amount = [[MKMassUnit kilogram] convertAmount:@1 to:[MKMassUnit gram]];

id amount = [[MKMassUnit gram] convertAmount:@1 from:[MKMassUnit kilogram]];
```


## Precision and Rounding

MKUnits uses `NSDecimalNumber` for all operations, therefore, it is extremely precise. 

To round a number to a desired decimal place, simply use `mk_roundedWithPrecision:` method of `NSNumber+MK_Precision` category. 

**Example:** Rounding 1.123456789 to 5 decimal places:

```objc
[@1.123456789 mk_roundedWithPrecision:5]; // results in 1.12346.
```

Alternatively you can take advantage of `MKQuantity+Precision` category which offers
the following methods:

```objc
- (instancetype)quantityWithPrecision:(short)precision;
- (NSNumber *)amountWithPrecision:(short)precision;

- (BOOL)isTheSame:(MKQuantity *)other withPrecision:(short)precision;
- (BOOL)isGreaterThan:(MKQuantity *)other withPrecision:(short)precision;
- (BOOL)isLessThan:(MKQuantity *)other withPrecision:(short)precision;

- (NSComparisonResult)compare:(MKQuantity *)other withPrecision:(short)precision;
```


## Extending MKUnits

### <a name="new-quantity"></a>Adding new Quantity

In order to add new Quantity simply create a class that extends `MKUnit` and follow the convention below.

Please make sure that `unit symbols` are unique across your Quantity.


Example **.h** file:

```objc
@interface QuantityUnit : MKUnit

+ (instancetype)unit_one;
+ (instancetype)unit_two;

@end

@interface MKQuantity (QuantityUnit)

+ (instancetype)quantity_unitoneWithAmount:(NSNumber *)amount;
+ (instancetype)quantity_unittwoWithAmount:(NSNumber *)amount;

@end

@interface NSNumber (QuantityUnit)

- (MKQuantity *)quantity_unitone;
- (MKQuantity *)quantity_unittwo;

@end
```

Example **.m** file:

```objc
@implementation QuantityUnit : MKUnit

+ (instancetype)unit_one {
    static NSString *name   = @"unit_one";
    static NSString *symbol = @"u1";
    id ratio = [NSDecimalNumber one]; // as it is a base unit
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)unit_two {
    static NSString *name   = @"unit_two";
    static NSString *symbol = @"u2";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:2 exponent:0 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

@end

@implementation MKQuantity (QuantityUnit)

+ (instancetype)quantity_unitoneWithAmount:(NSNumber *)amount {
	return [self createWithAmount:amount withUnit:[QuantityUnit unit_one]];
}

+ (instancetype)quantity_unittwoWithAmount:(NSNumber *)amount {
	return [self createWithAmount:amount withUnit:[QuantityUnit unit_two]];
}

@end

@implementation NSNumber (QuantityUnit)

- (MKQuantity *)quantity_unitone {
	return [MKQuantity quantity_unitoneWithAmount:self];
}

- (MKQuantity *)quantity_unittwo {
	return [MKQuantity quantity_unittwoWithAmount:self];
}

@end
```


### <a name="new-unit"></a>Adding new Unit to existing Quantity

To add additional units to existing Quantity simply create a category for that Quantity.

Do not sublcass as units are only interconvertible with units belonging to the same Quantity.

Example **.h** file:

```objc
@interface GroupUnit (Extension)

+ (instancetype)unit_one;
+ (instancetype)unit_two;

@end

@interface MKQuantity (GroupUnit_Extension)

+ (instancetype)group_unitoneWithAmount:(NSNumber *)amount;
+ (instancetype)group_unittwoWithAmount:(NSNumber *)amount;

@end

@interface NSNumber (GroupUnit_Extension)

- (MKQuantity *)quantity_unitone;
- (MKQuantity *)quantity_unittwo;

@end
```


## Contributing

1. Fork it.
2. Create your feature branch (`git checkout -b new-feature`).
3. Commit your changes (`git commit -am 'Added new-feature'`).
4. Push to the branch (`git push origin new-feature`).
5. Create new Pull Request.


<!--
- - - 

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/michalkonturek/mkunits/trend.png)](https://bitdeli.com/free "Bitdeli Badge")
-->

