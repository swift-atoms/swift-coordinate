import Coordinate
import Testing

@Suite struct `Coordinates preserve dimension and scalar representation` {
    private func dimension<let N: Int>(_ type: Vector<N, Int>.Type) {
        let value = Coordinate(components: Vector<N, Int>(InlineArray { $0 }))
        for i in 0..<N { #expect(value[i] == i) }
        #expect(Set([value, value]).count == 1)
    }
    @Test func `Coordinates preserve components in one two three and eight dimensions`() {
        dimension(Vector<1, Int>.self)
        dimension(Vector<2, Int>.self)
        dimension(Vector<3, Int>.self)
        dimension(Vector<8, Int>.self)
    }
}
