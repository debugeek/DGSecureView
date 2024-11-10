// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "DGSecureView",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(name: "DGSecureView", targets: ["DGSecureView"])
    ],
    targets: [
        .target(name: "DGSecureView")
    ]
)
