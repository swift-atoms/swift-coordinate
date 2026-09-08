extension Coordinate {
    /// A coordinate system maps independently owned points to/from coordinates.
    /// The mapping may capture a runtime reference and need not be affine.
    /// Its owner must supply mutually inverse mappings on their supported domain.
    public struct System<Point, Failure: Swift.Error> {
        private let encode: (Point) throws(Failure) -> Coordinate
        private let decode: (Coordinate) throws(Failure) -> Point

        public init(
            coordinates: @escaping (Point) throws(Failure) -> Coordinate,
            point: @escaping (Coordinate) throws(Failure) -> Point
        ) {
            self.encode = coordinates
            self.decode = point
        }

        public func coordinates(of point: Point) throws(Failure) -> Coordinate {
            try encode(point)
        }
        public func point(at coordinates: Coordinate) throws(Failure) -> Point {
            try decode(coordinates)
        }
    }
}
