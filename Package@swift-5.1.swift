// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "QuickConstraint",
    platforms: [
        .macOS(.v10_14),
        .iOS(.v9),
        .tvOS(.v9)
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
