// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DocumentEditor",
    platforms: [
        .macOS(.v14)  // Required for SwiftUI and SwiftData
    ],
    targets: [
        .executableTarget(
            name: "DocumentEditor"),
    ]
)
