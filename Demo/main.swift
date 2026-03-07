import MKUnits

print("=== MKUnits Demo ===\n")

// MARK: - Mass

print("-- Mass --")
let mass = 2.kilogram()
print("2 kg in grams: \(mass.converted(MassUnit.gram))")
print("2 kg in milligrams: \(mass.converted(MassUnit.milligram))")
print("2 kg + 500 g = \(2.kilogram() + 500.gram())")
print()

// MARK: - Length

print("-- Length --")
let marathon = 42195.meter()
print("Marathon: \(marathon.converted(LengthUnit.kilometer))")
print("1 mile in meters: \(1.mile().converted(LengthUnit.meter))")
print("1 foot in inches: \(1.foot().converted(LengthUnit.inch))")
print()

// MARK: - Temperature

print("-- Temperature --")
print("100 °C in Kelvin: \(100.celsius().converted(TemperatureUnit.kelvin))")
print("100 °C in °F: \(100.celsius().converted(TemperatureUnit.fahrenheit))")
print("32 °F in °C: \(32.fahrenheit().converted(TemperatureUnit.celsius))")
print("0 K in °C: \(0.kelvin().converted(TemperatureUnit.celsius))")
print("0 K in °F: \(0.kelvin().converted(TemperatureUnit.fahrenheit))")
print()

// MARK: - Time

print("-- Time --")
let hours = 2.hour()
print("2 hours in minutes: \(hours.converted(TimeUnit.minute))")
print("2 hours in seconds: \(hours.converted(TimeUnit.second))")
print("1 day in hours: \(1.day().converted(TimeUnit.hour))")
print()

// MARK: - Volume

print("-- Volume --")
print("1 litre in millilitres: \(1.litre().converted(VolumeUnit.millilitre))")
print("1 gallon (imp) in litres: \(1.gallon().converted(VolumeUnit.litre))")
print()

// MARK: - Digital Storage

print("-- Digital Storage --")
print("1 GB in MB: \(1.gigabyte().converted(ByteUnit.megabyte))")
print("1 GB in KB: \(1.gigabyte().converted(ByteUnit.kilobyte))")
print("1 TB in GB: \(1.terabyte().converted(ByteUnit.gigabyte))")
print()

// MARK: - Energy

print("-- Energy --")
print("1 kJ in joules: \(1.kilojoule().converted(EnergyUnit.joule))")
print("1 kcal in joules: \(1.kilocalorie().converted(EnergyUnit.joule))")
print()

// MARK: - Cross-Unit Arithmetic

print("-- Cross-Unit Arithmetic --")
print("Result is always in the unit of the left operand:")
print("  5 kg + 3000 g = \(5.kilogram() + 3000.gram())")
print("  5 kg - 3000 g = \(5.kilogram() - 3000.gram())")
print("  1 km + 500 m = \(1.kilometer() + 500.meter())")
print("  1 mile - 1 km = \(1.mile() - 1.kilometer())")
print("  1 hour + 1800 s = \(1.hour() + 1800.second())")
print("  1 day - 2 h = \(1.day() - 2.hour())")
print("  1 litre + 250 ml = \(1.litre() + 250.millilitre())")
print("  1 GB - 512 MB = \(1.gigabyte() - 512.megabyte())")
print()

// MARK: - Metric ↔ Imperial

print("-- Metric + Imperial --")
print("  5 lb + 1 kg = \(5.pound() + 1.kilogram())")
print("  1 kg - 8 oz = \(1.kilogram() - 8.ounce())")
print("  10 stone + 5 kg = \(10.stone() + 5.kilogram())")
print("  3 ft + 50 cm = \(3.foot() + 50.centimeter())")
print("  1 yard - 0.5 m = \(1.yard() - 0.5.meter())")
print("  1 mile + 1 km = \(1.mile() + 1.kilometer())")
print()

// MARK: - Scalar Arithmetic

print("-- Scalar Arithmetic --")
print("  5 kg × 3 = \(5.kilogram() * 3)")
print("  2 × 100 m = \(2 * 100.meter())")
print()

// MARK: - Comparison

print("-- Comparison --")
print("  1 kg == 1000 g? \(1.kilogram() == 1000.gram())")
print("  1 kg > 500 g? \(1.kilogram() > 500.gram())")
print("  100 °C == 212 °F? \(100.celsius() == 212.fahrenheit())")
print("  1 mile > 1 km? \(1.mile() > 1.kilometer())")

print("\n=== Done ===")
