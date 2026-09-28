#if Tagged
@_exported public import Tagged

extension Tagged where Tag: ~Copyable & ~Escapable {
    public init<Scalar>(x: Scalar)
    where Underlying == Coordinate<1, Scalar> {
        self.init(_unchecked: Coordinate(x: x))
    }

    public init<Scalar>(x: Scalar, y: Scalar)
    where Underlying == Coordinate<2, Scalar> {
        self.init(_unchecked: Coordinate(x: x, y: y))
    }

    public init<Scalar>(x: Scalar, y: Scalar, z: Scalar)
    where Underlying == Coordinate<3, Scalar> {
        self.init(_unchecked: Coordinate(x: x, y: y, z: z))
    }
}
#endif
