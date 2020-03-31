// swift-tools-version:5.0
import PackageDescription

let package = Package(name: "MKUnits",
                      platforms: [.iOS(.v10)],
                      products: [.library(name: "MKUnits",
                                          targets: ["MKUnits"])],
                      targets: [.target(name: "MKUnits",
                                        path: "MKUnits/Classes")],
                      swiftLanguageVersions: [.v5])
