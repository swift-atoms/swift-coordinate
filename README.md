# Coordinate

Coordinate<N, Scalar> is a dimension-independent representation backed by Vector.
Equality, hashing, and sendability are conditional. One-dimensional comparable
scalars support representational ordering; no arbitrary multidimensional ordering
or inherent arithmetic is supplied.

Coordinate<N, Scalar>.System<Point, Failure> stores mappings between independently
supplied points and coordinates. A system can capture a runtime reference and need
not be affine. Its initializer requires inverse mappings as a contract; it cannot
prove that law.

A coordinate is not always an offset plus a static reference. That is one useful
affine representation. General coordinate systems may use nonlinear mappings and
runtime-selected frames. Bare coordinate components cannot establish frame identity;
use tags for static distinctions and retain the correct runtime system otherwise.

This package has no temporal interpretation or Swift.InstantProtocol conformance.
Time.Coordinate adds a Time tag, and Time.Instant aliases that coordinate.
Explicit affine interpretation lives in swift-time-affine. Swift clock protocol
integration is deferred to higher-level providers.

## Construction

Importing Coordinate also exports Vector; a separate Vector import is unnecessary.

```swift
import Coordinate

let value = Coordinate(x: 1, y: 2, z: 3)
let precise: Coordinate<3, Double> = .init(x: 1, y: 2, z: 3)
let many = Coordinate<8, Double>([1, 2, 3, 4, 5, 6, 7, 8])
let repeated = Coordinate<8, Double>(repeating: 2)
let stored = Coordinate(components: Vector(x: 1, y: 2, z: 3))

let first = value.x
```

Named components are available in one, two, and three dimensions. Fixed component
lists must match the dimension at compile time. The existing storage initializer
remains available. These conveniences do not select a frame or change arithmetic.
