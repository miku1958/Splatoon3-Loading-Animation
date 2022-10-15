// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Splatoon3 Loading Animation",
	platforms: [
		.macOS(.v12),
		.iOS(.v15)
	],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Splatoon3 Loading Animation",
            targets: ["Splatoon3 Loading Animation"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
         .package(url: "https://github.com/miku1958/Swift-Extension", from: "0.2.0"),
    ],
    targets: [
        .target(
            name: "Splatoon3 Loading Animation",
            dependencies: [
				.product(name: "Extension", package: "Swift-Extension")
			]
		),
    ]
)
