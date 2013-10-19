# MKUnits

[![License MIT](https://go-shields.herokuapp.com/license-MIT-blue.png)](https://github.com/michalkonturek/MKUnits/blob/master/LICENSE)
[![Build Platform](https://cocoapod-badges.herokuapp.com/p/MKUnits/badge.png)](https://github.com/michalkonturek/MKUnits)
[![Build Version](https://cocoapod-badges.herokuapp.com/v/MKUnits/badge.png)](https://github.com/michalkonturek/MKUnits)
[![Build Status](https://travis-ci.org/michalkonturek/MKUnits.png?branch=master)](https://travis-ci.org/michalkonturek/MKUnits)


Provides units of measurement of physical quantities and simplifies manipulation of them.


## Supported Quantities 

At the moment MKUnits supports the following quantities:

* Area (base unit: square meter)
* Bytes (base unit: bit) 
* Mass (base unit: kilogram)
* Length (base unit: meter)
* Time (base unit: second)

You can easily extend MKUnits by adding new [quantities](#new-quantity) or [units](#new-unit).



## Usage

Let's create 1.5 kilograms **[kg]**,

```objc
id kilograms = [MKQuantity mass_kilogramWithAmount:@1.5];
```

0.5 **[kg]** in grams **[g]** 

```objc
id grams = [MKQuantity mass_gramWithAmount:@500];
```

and 10 pounds **[lb]** (which is 4.5359237 **[kg]**)
<!--and 4.5359237 **[kg]** in pounds **[lb]**.-->

```objc
id pounds = [MKQuantity mass_poundWithAmount:@10];
```

Then we add all of the above togehter and subtract 0.0001 **[kg]** in milligrams **[mg]**.

```objc
id milligrams = [MKQuantity mass_milligramWithAmount:@100];
id result = [[[kilograms add:grams] add:pounds] subtract:milligrams];
```

The result amount is 6.5358237 **[kg]**.

Now we subtract 0.5358237 **[kg]** in ounces **[oz]**, which is 18.900624805 **[oz]** according to Google converter, but as MKUnits is very precise, it is in fact 18.900624805483390296005199558361177 **[oz]**.

```objc
id ounces = [[MKQuantity mass_kilogramWithAmount:@0.5358237]
	             convertTo:[MKMassUnit ounce]];
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

or rounding the amount of existing `MKQuantity`.

```objc
id amount_in_stones = [result amountWithPrecision:3];
// 0.945

id amount_in_stones = [result.amount decimalNumberWithPrecision:3];
// 0.945
```

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

MKUnits uses `NSDecimalNumber` for all conversions, therefore, it is extremely precise. 

To round a number to a desired decimal place, use `decimalNumberWithPrecision:` method of `NSNumber+Fraction` category. 

**Example:** Rounding 1.123456789 to 5 decimal places:

```objc
[@1.123456789 decimalNumberWithPrecision:5]; // results in 1.12346.
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
```





