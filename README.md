# swift-coordinate

Use this package when a fixed-dimension tuple of scalars means a position read relative to some origin and axes, and you need to convert between such readings and the points they name. Start from `Coordinate<N, Scalar>` for the reading itself and `Coordinate<N, Scalar>.System<Point, Failure>` for the conversion. Use swift-vector for a tuple with componentwise arithmetic and no positional meaning, swift-point for the position itself independent of any origin, and swift-displacement for the difference between two positions.

## Laws

- A one-dimensional `Coordinate<1, Scalar>` orders by its single component.
- `Coordinate<N, Scalar>.System<Point, Failure>` caches nothing: every `coordinates(of:)` and `point(at:)` calls the closure the system was built with, and that closure's error reaches the caller unchanged. The system does not check that the two closures are inverses; that is the builder's responsibility.
