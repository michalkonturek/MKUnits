# MKUnits

[![Build Status](https://travis-ci.org/michalkonturek/MKUnits.png)](https://travis-ci.org/michalkonturek/MKUnits)

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

and 4.5359237 **[kg]** in pounds **[lb]**.

```objc
id pounds = [MKQuantity mass_poundWithAmount:@10];
```

Then we add all of the above togehter and subtract 0.0001 **[kg]** in milligrams **[mg]**.

```objc
id milligrams = [MKQuantity mass_milligramWithAmount:@100];
id result = [[[kilograms add:grams] add:pounds] subtract:milligrams];
```

The result amount is 6.5358237 **[kg]**.

Now we subtract 0.5358237 **[kg]** in ounces **[oz]**, which is 18.900624805 **[oz]** according to Google converter, but MKUnits is mega precise, so in fact it is 18.900624805483390296005199558361177 **[oz]**.

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

id final_amount_in_stones = [result.amount decimalNumberWithPrecision:3];
// 0.945
```

## Precision and Rounding

MKUnits uses `NSDecimalNumber` for all conversions, therefore, it is extremely precise. 

To round a number to a desired decimal place, use `decimalNumberWithPrecision:` method of `NSNumber+Fraction` category. 

**Example:** Rounding 1.123456789 to 5 decimal places:

```objc
[@1.123456789 decimalNumberWithPrecision:5]; // results in 1.12346.
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





