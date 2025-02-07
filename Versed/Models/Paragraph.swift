import Foundation
import SwiftData

// MARK: - (Paragraph)
// (Goal) The user can be quizzed on each paragraph in a text, independently.
// (final) (inheritance not considered)
// (class) (SwiftData)
@Model
final class Paragraph {
    // MARK: - (init(_:))
    init(_ text: String) {
        self.text = text
    }
    
    // MARK: - (properties)

    var text: String
    
    // (Goal) The user can be quizzed on her paragraph immediately.
    var dueDate = Date.now
}
