import Foundation

/// Safely access Array, Dictionary by any idx, instead of checking each time
extension Collection {
    subscript(safeIdx index: Index) -> Element? {
        get { return self.indices.contains(index) ? self[index] : nil }
    }
}
