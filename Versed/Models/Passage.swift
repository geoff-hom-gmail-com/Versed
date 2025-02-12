import SwiftUI
import SwiftData

// MARK: - (Passage)
@Model
final class Passage {
// (Note) Was going to name Text, but that overwrites Text view. "Passage" is also a nod to Jason Rohrer's game.
// (final) (inheritance not considered)
// (class) (SwiftData)
// TODO: - comment class?
    // MARK: - (init())
    // (Note) Text fields may be empty, as user can edit them later.
    init(
        isExample: Bool = false,
        index: Int = 0,
        before: String = String(),
        goal: String = String(),
        after: String = String(),
        reference: String = String()
    ) {
        self.isExample = isExample
        self.index = index
        self.beforeCue = before
        self.goal = goal
        self.afterCue = after
        self.notes = reference
        
        let rawParagraphs = goal.components(separatedBy: "\n\n")
//        print(rawParagraphs)
        self.paragraphs = rawParagraphs.map { Paragraph($0) }
    }
    
    // MARK: - (properties)
    
    // (Goal) The user can see examples, to learn the app. But, she can't edit them.
    var isExample: Bool
    
    var isNew = true
    // (Goal) The user can easily find the text she just added.
    
    // (Goal) The user sees listed texts in the same order. She can also reorder.
    // (Note) SwiftData does not store array order for model objects.
    var index: Int
    
    // (Goal) The user can see a cue: what's before her text.
    var beforeCue: String
    
    // TODO: - (user can style text to help learn)
    // (e.g., bold, italic) (any part, not just all or none)
    // (Goal) The user can learn a text of arbitrary length. With arbitrary formatting / line breaks.
    var goal: String
    
    // (Goal) The user can see a cue: what's after her text.
    var afterCue: String
    
    // (Goal) The user can make notes about her text. Including the source/reference.
    var notes: String
    
    // (Goal) The user can be quizzed on each paragraph in a text, independently.
    @Relationship(deleteRule: .cascade)
    var paragraphs: [Paragraph]
}
