// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Mondrian",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "Mondrian",
            targets: ["Mondrian"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Mondrian",
            dependencies: []),
        .testTarget(
            name: "MondrianTests",
            dependencies: ["Mondrian"]),
    ]
)
