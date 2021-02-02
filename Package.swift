// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "JarMVVMC",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "JarMVVMC",
            targets: ["JarMVVMC"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "JarMVVMC",
            dependencies: []),
        .testTarget(
            name: "JarMVVMCTests",
            dependencies: ["JarMVVMC"]),
    ]
)
