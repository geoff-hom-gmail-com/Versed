import SwiftUI
import SwiftData

// (Note) Was going to name Text, but that overwrites Text view. "Passage" is also a nod to Jason Rohrer's game.
// (final) (inheritance not considered)
// (class) (SwiftData)
@Model
final class Passage {
    // (Goal) The user can see examples, to learn the app. But, she can't edit them.
    // This was an enum/category. E.g., .example, .user. But, enums don't work well with SwiftData Predicates. (as of Xcode 16.1)
    var isExample: Bool
    
    // (Goal) The user can easily find the text they just added. And know which examples they haven't seen.
    var isNew = true
    
    // (Goal) The user sees listed texts in the same order. She can also reorder.
    // (Note) SwiftData does not store array order for model objects.
    var index: Int
    
    var beforeText: String
    var goalText: String
    var afterText: String
    var referenceText: String
    
    @Relationship(deleteRule: .cascade)
    var paragraphs: [Paragraph]
    
    // (Goal) The user adds a text. Fields may be empty, as she can edit them later.
    init(
        isExample: Bool = false,
        index: Int = 0,
        before: String = String(),
        goal: String = String(),
        after: String = String(),
        reference: String = String(),
        paragraphs: [Paragraph] = [Paragraph()],
        
        // (todo) not used yet; maybe in Know tab?
        dueDate: Date? = nil
    ) {
        self.isExample = isExample
        self.index = index
        self.beforeText = before
        self.goalText = goal
        self.afterText = after
        self.referenceText = reference
        self.paragraphs = paragraphs

//        self.dueDate = dueDate
    }
    
    // (Goal) The user sees a one-line cue to a text. She knows which verse it refers to.
    // We could use the goal text. But, we hope the user will benefit more in the long run, via practicing with the cue.
    // If no prompt, show the verse's text. E.g., when a verse is first added.
//    var rowTitle: String {
//        var title: String;
//        if ((prompts.first?.text.isEmpty) != nil) {
//            
//        }
//        if let firstPrompt = prompts.first,
//           !firstPrompt.text.isEmpty {
//            title = firstPrompt.fullPrompt
//        } else {
//            title = text
//        }
//        return title
//    }
    
    // (Goal) The user sees examples for how to update her texts before quizzing.
    static func insertExamples(modelContext: ModelContext) {
        let examples = [
            AppConstant.ExampleText.multiverse,
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
    }
}
