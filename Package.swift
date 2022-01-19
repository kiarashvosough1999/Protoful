// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Protoful",
    platforms: [
        .iOS(.v10),
        .macOS(.v10_10),
        .tvOS(.v9)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Protoful",
            targets: ["Protoful"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Protoful",
            dependencies: [],
            linkerSettings: [
                .linkedFramework("CoreGraphics",
                               .when(platforms: [
                                .iOS,
                                .macOS,
                                .tvOS,
                                .watchOS
                               ])),
                .linkedFramework("Foundation",
                               .when(platforms: [
                                .iOS,
                                .macOS,
                                .tvOS,
                                .watchOS
                               ]))
            ]),
        .testTarget(
            name: "ProtofulTests",
            dependencies: ["Protoful"]),
    ]
)
