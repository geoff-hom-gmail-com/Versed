import SwiftUI

// A question-answer pair. If a user gets stuck reciting a verse, they can see a clue.
// Could use a tuple, but official Swift Programming Language book advises not to (https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics#Tuples). See note at end: "Tuples are useful for simple groups …"
// (Hashable) (required by Verse to be Hashable)
// (Identifiable) (required by ForEach)
struct Clue: Hashable, Identifiable {
    let id = UUID()
    var q: String
    var a: String
}
