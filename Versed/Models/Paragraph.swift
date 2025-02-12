import Foundation
import SwiftData

// MARK: - (Paragraph)
@Model
final class Paragraph {
// (goal) (user can be quizzed on each paragraph in a text) (independently)
// (final) (inheritance not considered)
// (class) (SwiftData)
    // MARK: - (properties)

    var text: String
    
    var dueDate = Date.now
    // (goal) (user can be quizzed on her paragraph immediately)

    // MARK: - (init(_:))
    init(_ text: String) {
        self.text = text
    }
}
