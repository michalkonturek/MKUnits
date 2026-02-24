// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "MKUnits",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "MKUnits",
            targets: ["MKUnits"]
        ),
    ],
    targets: [
        .target(
            name: "MKUnits",
            path: "MKUnits/Classes"
        ),
        .testTarget(
            name: "MKUnitsTests",
            dependencies: ["MKUnits"],
            path: "Example/Tests",
            exclude: ["Info.plist"]
        ),
    ]
)
