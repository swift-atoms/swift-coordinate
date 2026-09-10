extension Coordinate {

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
