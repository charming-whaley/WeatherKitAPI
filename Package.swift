// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WeatherKitAPI",
    platforms: [
        .iOS(.v17),
        .macOS(.v15),
        .watchOS(.v10),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "WeatherKitAPI",
            targets: ["WeatherKitAPI"]),
    ],
    targets: [
        .target(
            name: "WeatherKitAPI"),

    ]
)
