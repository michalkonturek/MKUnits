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

// MARK: - Arithmetic

print("-- Arithmetic --")
let a = 5.kilogram()
let b = 3000.gram()
print("\(a) + \(b) = \(a + b)")
print("\(a) - \(b) = \(a - b)")
print("\(a) × 3 = \(a * 3)")
print()

// MARK: - Comparison

print("-- Comparison --")
print("1 kg == 1000 g? \(1.kilogram() == 1000.gram())")
print("1 kg > 500 g? \(1.kilogram() > 500.gram())")
print("100 °C == 212 °F? \(100.celsius() == 212.fahrenheit())")

print("\n=== Done ===")
