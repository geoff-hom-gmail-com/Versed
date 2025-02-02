import Foundation
import SwiftData

// (Goal) The user can be quizzed on each paragraph in a text, independently.
// (final) (inheritance not considered)
// (class) (SwiftData)
@Model
final class Paragraph {
    var text: String
    
    // (Goal) The user can be quizzed on her paragraph immediately.
    var dueDate = Date.now
    
    init(text: String) {
        self.text = text
    }
}
