//
//  Package.swift
//  PrettyKeyboardHelper
//
//  Created by Oleksii Naboichenko on 10/28/21.
//  Copyright © 2021 Oleksii Naboichenko. All rights reserved.
//

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
