// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "GetcarvizCapacitorMicrophone",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "GetcarvizCapacitorMicrophone",
            targets: ["MicrophonePlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", from: "8.0.0")
    ],
    targets: [
        .target(
            name: "MicrophonePlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/MicrophonePlugin")
    ]
)
