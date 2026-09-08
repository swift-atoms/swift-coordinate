@_exported public import Vector

/// An N-dimensional coordinate representation in a caller-established frame.
/// Coordinates alone do not identify the frame. Use Tagged or an explicit frame
/// value when values from different references must remain distinct.
public struct Coordinate<let N: Int, Scalar> {
    public let components: Vector<N, Scalar>

    public init(components: Vector<N, Scalar>) { self.components = components }
    public subscript(index: Int) -> Scalar { components[index] }
}

extension Coordinate: Equatable where Scalar: Equatable {}
extension Coordinate: Hashable where Scalar: Hashable {}
extension Coordinate: Sendable where Scalar: Sendable {}

extension Coordinate where N == 1 {
    public init(rawValue: Scalar) { self.init(components: Vector(repeating: rawValue)) }
    public var rawValue: Scalar { self[0] }
}

extension Coordinate: Comparable where N == 1, Scalar: Comparable {
    public static func < (lhs: Self, rhs: Self) -> Bool { lhs[0] < rhs[0] }
}
