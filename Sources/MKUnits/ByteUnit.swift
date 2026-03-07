//
//  ByteUnit.swift
//  MKUnits
//
//  Copyright (c) 2016 Michal Konturek <michal.konturek@gmail.com>
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

import Foundation

public final class ByteUnit: Unit, @unchecked Sendable {

  /// Returns petabyte `[PB]` byte unit.
  public static let petabyte = ByteUnit(
    name: "petabyte",
    symbol: "PB",
    ratio: 1_125_899_906_842_624
  )

  /// Returns terabyte `[TB]` byte unit.
  public static let terabyte = ByteUnit(
    name: "terabyte",
    symbol: "TB",
    ratio: 1_099_511_627_776
  )

  /// Returns gigabyte `[GB]` byte unit.
  public static let gigabyte = ByteUnit(
    name: "gigabyte",
    symbol: "GB",
    ratio: 1_073_741_824
  )

  /// Returns megabyte `[MB]` byte unit.
  public static let megabyte = ByteUnit(
    name: "megabyte",
    symbol: "MB",
    ratio: 1_048_576
  )

  /// Returns kilobyte `[KB]` byte unit.
  public static let kilobyte = ByteUnit(
    name: "kilobyte",
    symbol: "KB",
    ratio: 1_024
  )

  /// Returns byte `[B]` byte unit.
  ///
  /// This is a base unit.
  public static let byte = ByteUnit(
    name: "byte",
    symbol: "B",
    ratio: 1
  )
}

extension Int {
  /// Returns instance converted as petabyte quantity.
  public func petabyte() -> Quantity {
    Quantity(amount: Decimal(self), unit: ByteUnit.petabyte)
  }
  /// Returns instance converted as terabyte quantity.
  public func terabyte() -> Quantity {
    Quantity(amount: Decimal(self), unit: ByteUnit.terabyte)
  }
  /// Returns instance converted as gigabyte quantity.
  public func gigabyte() -> Quantity {
    Quantity(amount: Decimal(self), unit: ByteUnit.gigabyte)
  }
  /// Returns instance converted as megabyte quantity.
  public func megabyte() -> Quantity {
    Quantity(amount: Decimal(self), unit: ByteUnit.megabyte)
  }
  /// Returns instance converted as kilobyte quantity.
  public func kilobyte() -> Quantity {
    Quantity(amount: Decimal(self), unit: ByteUnit.kilobyte)
  }
  /// Returns instance converted as byte quantity.
  public func byte() -> Quantity {
    Quantity(amount: Decimal(self), unit: ByteUnit.byte)
  }
}

extension Double {
  /// Returns instance converted as petabyte quantity.
  public func petabyte() -> Quantity {
    Quantity(amount: Decimal(self), unit: ByteUnit.petabyte)
  }
  /// Returns instance converted as terabyte quantity.
  public func terabyte() -> Quantity {
    Quantity(amount: Decimal(self), unit: ByteUnit.terabyte)
  }
  /// Returns instance converted as gigabyte quantity.
  public func gigabyte() -> Quantity {
    Quantity(amount: Decimal(self), unit: ByteUnit.gigabyte)
  }
  /// Returns instance converted as megabyte quantity.
  public func megabyte() -> Quantity {
    Quantity(amount: Decimal(self), unit: ByteUnit.megabyte)
  }
  /// Returns instance converted as kilobyte quantity.
  public func kilobyte() -> Quantity {
    Quantity(amount: Decimal(self), unit: ByteUnit.kilobyte)
  }
  /// Returns instance converted as byte quantity.
  public func byte() -> Quantity {
    Quantity(amount: Decimal(self), unit: ByteUnit.byte)
  }
}
