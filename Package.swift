// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "ArduinoKit",
    products: [
        .library(name: "ArduinoKit", targets: [ "ArduinoKit" ])
    ],
    dependencies: [
        .package(url: "https://github.com/pdshelley/CoreAVR.git", branch: "bugfix/uart-access-modifiers"),
    ],
    targets: [
        .target(name: "ArduinoKit", dependencies: [
            .product(name: "CoreAVR", package: "CoreAVR")
        ])
    ]
)
