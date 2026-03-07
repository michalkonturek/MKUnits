// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "MKUnits",
  platforms: [
    .iOS(.v16),
    .macOS(.v13),
    .tvOS(.v16),
    .watchOS(.v9),
    .visionOS(.v1),
  ],
  products: [
    .library(
      name: "MKUnits",
      targets: ["MKUnits"]
    )
  ],
  targets: [
    .target(
      name: "MKUnits"
    ),
    .executableTarget(
      name: "Demo",
      dependencies: ["MKUnits"]
    ),
    .testTarget(
      name: "MKUnitsTests",
      dependencies: ["MKUnits"]
    ),
  ]
)
