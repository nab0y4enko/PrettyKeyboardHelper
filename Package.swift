// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PrettyKeyboardHelper",
    products: [
        .library(
            name: "PrettyKeyboardHelper",
            targets: [
                "PrettyKeyboardHelper"
            ]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/nab0y4enko/PrettyUtils", from: "0.2.1"),
    ],
    targets: [
        .target(
            name: "PrettyKeyboardHelper",
            path: "PrettyKeyboardHelper",
            exclude: [
                "PrettyKeyboardHelper.h",
                "Info.plist"
            ]
        )
    ]
)