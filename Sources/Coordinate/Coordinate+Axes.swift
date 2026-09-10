public import Vector

extension Coordinate where N == 1 {
    public init(x: Scalar) {
        self.init(components: Vector(x: x))
    }

    public var x: Scalar { components.x }
}

extension Coordinate where N == 2 {
    public init(x: Scalar, y: Scalar) {
        self.init(components: Vector(x: x, y: y))
    }

    public var x: Scalar { components.x }

    public var y: Scalar { components.y }
}

extension Coordinate where N == 3 {
    public init(x: Scalar, y: Scalar, z: Scalar) {
        self.init(components: Vector(x: x, y: y, z: z))
    }

    public var x: Scalar { components.x }

    public var y: Scalar { components.y }

    public var z: Scalar { components.z }
}
