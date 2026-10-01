// swift-tools-version: 6.4
import PackageDescription

let package = Package(
    name: "swift-coordinate",
    platforms: [.macOS(.v27), .iOS(.v27), .tvOS(.v27), .watchOS(.v27), .visionOS(.v27)],
    products: [.library(name: "Coordinate", targets: ["Coordinate"])],
    traits: [
        .trait(name: "Tagged", description: "Tagged integration"),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-atoms/swift-vector.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-tagged.git", branch: "main"),
    ],
    targets: [
        .target(name: "Coordinate", dependencies: [
                .product(name: "Tagged", package: "swift-tagged", condition: .when(traits: ["Tagged"])),
            .product(name: "Vector", package: "swift-vector"),
        ]),
        .testTarget(name: "Coordinate Tests", dependencies: [
            .target(name: "Coordinate"),
            .product(name: "Tagged", package: "swift-tagged"),
        ]),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin].contains(target.type) {
    target.swiftSettings = (target.swiftSettings ?? []) + [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableExperimentalFeature("Lifetimes"),
        .treatAllWarnings(as: .error),
    ]
}
