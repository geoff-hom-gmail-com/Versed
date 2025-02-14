import Foundation
import SwiftData

// MARK: - (Paragraph)
@Model
final class Paragraph {
// (goal) (user can be quizzed on each paragraph in a text) (independently)
// (final) (inheritance not considered)
// (class) (SwiftData)
    // MARK: - (properties)

    @Relationship
    var passage: Passage
    // (note) (if optional) (SwiftData will set this automatically) (no need in init())
    // (but prefer non-optional)
    
    var text: String
    
    var dueDate = Date.now
    // (goal) (user can be quizzed on her paragraph immediately)

    // MARK: - (init())

    init(passage: Passage, text: String) {
        self.passage = passage
        self.text = text
    }
    
    //    init(text: String) {
    //        self.text = text
    //    }
        // (note) (keep) (if passage optional)
}
