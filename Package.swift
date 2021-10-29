// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "PrettyKeyboardHelper",
    platforms: [
        .iOS(.v13)
    ],
    dependencies: [
        .package(
            url: "https://github.com/nab0y4enko/PrettyUtils",
            .from("0.2.1")
        ),
    ],
    products: [
        .library(
            name: "PrettyKeyboardHelper",
            targets: [
                "PrettyKeyboardHelper"
            ]
        )
    ],
    targets: [
        .target(
            name: "PrettyKeyboardHelper",
            dependencies: [],
            path: "PrettyKeyboardHelper",
            exclude: [
                "PrettyKeyboardHelper.h",
                "Info.plist"
            ]
        )
    ]
)
