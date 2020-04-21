// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "QuickConstraint",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(name: "QuickConstraint", targets: ["QuickConstraint"])
    ],
    targets: [
        .target(name: "QuickConstraint",
                path: ".",
                sources: ["Sources"])
    ]
)
