# MKUnits

[![Version](https://img.shields.io/cocoapods/v/MKUnits.svg)](http://cocoapods.org/pods/MKUnits)
[![Build Status](https://travis-ci.org/michalkonturek/MKUnits.svg?branch=master)](https://travis-ci.org/michalkonturek/MKUnits)
[![Swift](https://img.shields.io/badge/%20compatible-swift%203.0-orange.svg)](http://swift.org)
[![License](https://img.shields.io/cocoapods/l/MKUnits.svg)](http://cocoapods.org/pods/MKUnits)
[![Twitter](https://img.shields.io/badge/contact-@MichalKonturek-blue.svg)](http://twitter.com/michalkonturek)

MKUnits is extremely precise unit conversion library for `Swift`. It provides units of measurement of physical quantities and simplifies manipulation of them.

**NB** For `Objective-C` implementation, please refer to MKUnits pod 2.2.1 or visit [archived branch][archive-branch].
[archive-branch]:https://github.com/michalkonturek/MKUnits/tree/archive-objc

## License

MKUnits is available under the MIT license. See the [LICENSE][LICENSE] file for more info.

[LICENSE]:https://github.com/michalkonturek/MKUnits/blob/master/LICENSE


## Installation

MKUnits is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "MKUnits"
```

## Example

Let's create 1.5 kilograms **[kg]**,

```swift
let kilograms = 1.5.kilogram()
```

0.5 **[kg]** in grams **[g]** 

```swift
let grams = 500.gram()
```

and 10 pounds **[lb]** (which is 4.5359237 **[kg]**)
<!--and 4.5359237 **[kg]** in pounds **[lb]**.-->

```swift
let pounds = 10.pound()
```

Then we add all of the above togehter and subtract 0.0001 **[kg]** in milligrams **[mg]**.

```swift
let milligrams = 100.milligram()
var result = kilograms + grams + pounds - milligrams
```

The result amount is 6.5358237 **[kg]**.

Now we subtract 0.5358237 **[kg]** in ounces **[oz]**, which is 18.900624805 **[oz]** according to Google converter, but as MKUnits is very precise, it is in fact 18.900624805483390296005199558361177 **[oz]**.

```swift
let ounces = 0.5358237.kilogram().converted(MassUnit.ounce)
result = result - ounces
```

The result amount is ~6 **[kg]**; 6.00000000000000000000000000000000003 **[kg]** to be exact.

Now we want the result to be in stones **[st]**, so:

```swift
result = result.converted(MassUnit.stone)
// 0.94483873964811055873038869091017890993 st
```

As the result is too precise for our needs, we want to round it.

<!--We can do that by either creating new `MKQuantity` object with rounded amount,-->

```swift
let rounded = result.rounded(3)
// 0.945 st
```

<!--or by rounding the amount of existing `MKQuantity`.-->

<!--```swift-->
<!--id amount_in_stones_1 = [result amountWithPrecision:3];-->
<!--// 0.945-->

<!--id amount_in_stones_2 = [[result amount] mk_roundedWithPrecision:3];;-->
<!--// 0.945-->
<!--```-->


## Supported Units 

At the moment MKUnits supports the following `group units`:

* Area (base unit: square meter)
* Mass (base unit: kilogram)
* Length (base unit: meter)
* Time (base unit: second)
* Volume (base unit: litre)

You can easily extend MKUnits by adding new [`group units`](#new-group-unit) or [`units`](#new-unit).


## Extending MKUnits

### <a name="new-group-unit"></a>Adding a new `group unit`

To add a new `group unit`, simply create a class that extends `Unit` and follow the convention below.

Please make sure that `unit symbols` are unique across your new `group unit`.

```swift

public final class NewUnit: Unit {

    public static var unitA: NewUnit {
        return NewUnit(
            name: "unit A",
            symbol: "uA",
            ratio: NSDecimalNumber.one() // as it is a base unit
        )
    }
    
    public static var unitB: NewUnit {
        return NewUnit(
            name: "unit B",
            symbol: "uB",
            ratio: NSDecimalNumber(mantissa: 2, exponent: 0, isNegative: false)
        )
    }
}

extension NSNumber {

    public func unitA() -> Quantity {
        return Quantity(amount: self, unit: NewUnit.unitA)
    }
    
    public func unitB() -> Quantity {
        return Quantity(amount: self, unit: NewUnit.unitB)
    }
}
```


### <a name="new-unit"></a>Adding new units to existing `group unit`

To add additional units to existing `group unit` simply create a category for that `group unit`.

Do not sublcass as units are only interconvertible with units belonging to the same `group unit`.

```swift

extension NewUnit {
    public static var unitC: NewUnit {
        return NewUnit(
            name: "unit C",
            symbol: "uC",
            ratio: NSDecimalNumber(mantissa: 4, exponent: 0, isNegative: false)
        )
    }
}

extension NSNumber {
    public func unitC() -> Quantity {
        return Quantity(amount: self, unit: NewUnit.unitC)
    }
}
```


## Contributing

1. Fork it.
2. Create your feature branch (`git checkout -b new-feature`).
3. Commit your changes (`git commit -am 'Added new-feature'`).
4. Push to the branch (`git push origin new-feature`).
5. Create new Pull Request.
