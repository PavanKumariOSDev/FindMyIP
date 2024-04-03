// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FindMyIp",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "FindMyIp",
            targets: ["FindMyIp"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire",.upToNextMajor(from: "5.7.1"))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "FindMyIp",
            dependencies: [
                "Alamofire"
            ],
            path: "Sources"
        ),
        .testTarget(
            name: "FindMyIpTests",
            dependencies: ["FindMyIp"]),
    ],
    swiftLanguageVersions: [.v5]
)
