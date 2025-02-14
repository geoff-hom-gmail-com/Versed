import SwiftUI
import SwiftData

// MARK: - (Passage)
@Model
final class Passage: TextModel {
// (goal) (user can know a custom text)
// (note) (was going to name Text) (but that overwrites Text view) ("Passage" is also a nod to Jason Rohrer)
// (final) (inheritance not considered)
// (class) (SwiftData)
    // MARK: - (properties)
    
    var isNew = true
    // (goal) (user can easily find the text she just added)
    
    var index: Int
    // (goal) (user sees listed texts in consistent order) (she can also reorder)
    // (note) (SwiftData does not store array order for model objects)
        
    var beforeCue: String
    var goal: String
    var afterCue: String
    var notes: String
    
    @Relationship(deleteRule: .cascade)
    var paragraphs: [Paragraph]
    // (goal) (user can be quizzed on each paragraph in a text) (independently)

    // MARK: - (init())
    init(
    // (note) (text fields may be empty) (user can edit later)
        index: Int = 0,
        beforeCue: String = String(),
        goal: String = String(),
        afterCue: String = String(),
        notes: String = String()
    ) {
        self.index = index
        self.beforeCue = beforeCue
        self.goal = goal
        self.afterCue = afterCue
        self.notes = notes
        
        let rawParagraphs = goal.components(separatedBy: "\n\n")
//        print("(Passage) (rawParagraphs) \(rawParagraphs.count) \(rawParagraphs)")
        self.paragraphs = rawParagraphs.map { Paragraph($0) }
    }
}
