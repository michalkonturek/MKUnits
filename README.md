# MKUnits

[![Swift](https://img.shields.io/badge/%20compatible-swift%206.0-orange.svg)](http://swift.org)
[![License](https://img.shields.io/cocoapods/l/MKUnits.svg)](http://cocoapods.org/pods/MKUnits)
[![Twitter](https://img.shields.io/badge/contact-@MichalKonturek-blue.svg)](http://twitter.com/michalkonturek)

MKUnits is a precise unit conversion library for Swift. It provides units of measurement of physical quantities and simplifies manipulation of them.

## License

MKUnits is available under the MIT license. See the [LICENSE][LICENSE] file for more info.

[LICENSE]:https://github.com/michalkonturek/MKUnits/blob/master/LICENSE


## Installation

### Swift Package Manager (Recommended)

Add the following to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/michalkonturek/MKUnits.git", from: "6.0.0")
]
```

### CocoaPods

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

```swift
let pounds = 10.pound()
```

Then we add all of the above together and subtract 0.0001 **[kg]** in milligrams **[mg]**.

```swift
let milligrams = 100.milligram()
var result = kilograms + grams + pounds - milligrams
```

The result amount is 6.5358237 **[kg]**.

Now we subtract 0.5358237 **[kg]** in ounces **[oz]**:

```swift
let ounces = 0.5358237.kilogram().converted(MassUnit.ounce)
result = result - ounces
```

Now we want the result to be in stones **[st]**, so:

```swift
result = result.converted(MassUnit.stone)
```

As the result is too precise for our needs, we want to round it.

```swift
let rounded = result.rounded(3)
// 0.945 st
```


## Supported Units 

MKUnits supports the following unit groups:

* Area (base unit: square meter)
* Energy (base unit: calorie)
* Mass (base unit: kilogram)
* Length (base unit: meter)
* Time (base unit: second)
* Volume (base unit: litre)

You can easily extend MKUnits by adding new [group units](#new-group-unit) or [units](#new-unit).


## Extending MKUnits

### <a name="new-group-unit"></a>Adding a new group unit

Create a class that extends `Unit` and follow the convention below. Make sure that unit symbols are unique across your new group unit.

```swift
public final class NewUnit: Unit, @unchecked Sendable {

    public static var unitA: NewUnit {
        return NewUnit(
            name: "unit A",
            symbol: "uA",
            ratio: Decimal(1) // base unit
        )
    }
    
    public static var unitB: NewUnit {
        return NewUnit(
            name: "unit B",
            symbol: "uB",
            ratio: Decimal(2)
        )
    }
}

extension Int {
    public func unitA() -> Quantity {
        return Quantity(amount: Decimal(self), unit: NewUnit.unitA)
    }
    public func unitB() -> Quantity {
        return Quantity(amount: Decimal(self), unit: NewUnit.unitB)
    }
}

extension Double {
    public func unitA() -> Quantity {
        return Quantity(amount: Decimal(self), unit: NewUnit.unitA)
    }
    public func unitB() -> Quantity {
        return Quantity(amount: Decimal(self), unit: NewUnit.unitB)
    }
}
```


### <a name="new-unit"></a>Adding new units to existing group unit

To add additional units to an existing group unit, create an extension. Do not subclass — units are only interconvertible with units belonging to the same group unit.

```swift
extension NewUnit {
    public static var unitC: NewUnit {
        return NewUnit(
            name: "unit C",
            symbol: "uC",
            ratio: Decimal(4)
        )
    }
}

extension Int {
    public func unitC() -> Quantity {
        return Quantity(amount: Decimal(self), unit: NewUnit.unitC)
    }
}

extension Double {
    public func unitC() -> Quantity {
        return Quantity(amount: Decimal(self), unit: NewUnit.unitC)
    }
}
```


## Contributing

1. Fork it.
2. Create your feature branch (`git checkout -b new-feature`).
3. Commit your changes (`git commit -am 'Added new-feature'`).
4. Push to the branch (`git push origin new-feature`).
5. Create new Pull Request.
