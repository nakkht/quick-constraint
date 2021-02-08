// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "QuickConstraint",
    platforms: [
        .macOS(.v10_14),
        .iOS(.v10),
        .tvOS(.v10)
    ],
    products: [
        .library(name: "QuickConstraint",
                 targets: ["QuickConstraint"])
    ],
    targets: [
        .target(name: "QuickConstraint")
    ],
    swiftLanguageVersions: [.v5]
)
