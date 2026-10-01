import Vector

extension Coordinate {

    public init(_ components: consuming InlineArray<N, Scalar>) {
        self.init(components: Vector(components))
    }

    public init(repeating value: Scalar) {
        self.init(components: Vector(repeating: value))
    }
}
