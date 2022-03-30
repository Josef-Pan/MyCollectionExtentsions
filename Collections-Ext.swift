import Foundation

/// Safely access Array, Dictionary by any idx, instead of checking each time
extension Collection {
    subscript(safeIdx index: Index) -> Element? {
        get { return self.indices.contains(index) ? self[index] : nil }
    }
    
    /// Do operations cocurrently for each element
    /// [ 1, 3, 5, 7, 9].forEachInParallel { item in
    ///     print(item)
    /// }
    func forEachInParallel(_ each: (Self.Element) -> Void) {
        DispatchQueue.concurrentPerform(iterations: count) {
            each(self[index(startIndex, offsetBy: $0)])
        }
    }
}
