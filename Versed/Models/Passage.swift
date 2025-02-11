import SwiftUI
import SwiftData

// MARK: - (Passage)
// (Note) Was going to name Text, but that overwrites Text view. "Passage" is also a nod to Jason Rohrer's game.
// (final) (inheritance not considered)
// (class) (SwiftData)
@Model
final class Passage {
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
        self.beforeText = before
        self.goalText = goal
        self.afterText = after
        self.referenceText = reference
        
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
    var beforeText: String
    
    // TODO: - (user can style text to help learn)
    // (e.g., bold, italic) (any part, not just all or none)
    // (Goal) The user can learn a text of arbitrary length. With arbitrary formatting / line breaks.
    var goalText: String
    
    // (Goal) The user can see a cue: what's after her text.
    var afterText: String
    
    // (Goal) The user can make notes about her text. Including the source/reference.
    var referenceText: String
    
    // (Goal) The user can be quizzed on each paragraph in a text, independently.
    @Relationship(deleteRule: .cascade)
    var paragraphs: [Paragraph]
    
    // MARK: - (insertExamples(modelContext:))
    // (Goal) The user can see example texts, in learning order.
    static func insertExamples(modelContext: ModelContext) {
        // TODO: - add remaining examples, in order
        // (also) (explain learning order here) (it's about learning how to use the app) (what to put in what field)
        let examples = [
            AppConstant.ExampleText.multiverse,
//            AppConstant.ExampleText.universe,
            AppConstant.ExampleText.start,
            AppConstant.ExampleText.end
        ]
        
        // Assign indices automatically.
        for (index, example) in examples.enumerated() {
            example.index = index
        }
        
        examples.forEach {
            modelContext.insert($0)
        }
        
        // (Note) Not sure if needed on device. But, in Xcode preview, helps?
        do {
            try modelContext.save()
        } catch {
            print("Failed to save: \(error)")
        }
    }
}
