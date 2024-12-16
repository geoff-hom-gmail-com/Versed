import SwiftUI
import SwiftData

// (Goal) The user can memorize a custom verse/text. She can edit the verse's text, layout, prompts, and clues. Each verse is due for recitation at a custom date, as determined by spaced repetition.
// (final) (inheritance not considered)
// (class) (SwiftData)
// (Identifiable) (required by ForEach)
// (Hashable) (required by NavigationLink(_:value:))
@Model
final class Verse: Identifiable, Hashable {
    // (Goal) Remove compiler warning. Was "let." Apparently bad in SwiftData with Swift 6.
    private(set) var id = UUID()
    
    // (Goal) The user can see example verses, to learn the app. But, she can't edit them.
    // This was an enum/category. E.g., .example, .user. But, enums don't work well with SwiftData Predicates. (as of Xcode 16.1)
    var isExample: Bool
    
    // (Goal) The user sees verses in a list in the same order. She can also reorder them.
    // SwiftData does not store array order for model objects. 
    var order: Int
    
    var text: String
    
    // (MVP-post) Currently, the user can set only one prompt per verse. But one can imagine multiple prompts.
    @Relationship(deleteRule: .cascade)
    var prompts: [Prompt]
    
    @Relationship(deleteRule: .cascade)
    var clues: [Clue]
    
    // (Goal) The user recites a verse according to its due date. The date is first set, after the prompt is set. The date is updated by spaced repetition. 
    // Example verses have no due date. 
    var dueDate: Date?
    
    // (Goal) The user adds a verse. It includes an empty prompt and clue x4. (4: chunking)
    init(_ text: String, isExample: Bool = false, order: Int = 0,
         prompts: [Prompt] = [Prompt()],
         clues: [Clue] = [Clue(), Clue(), Clue(), Clue()],
         dueDate: Date? = nil) {
        self.text = text
        self.isExample = isExample
        self.order = order
        self.prompts = prompts
        self.clues = clues
        self.dueDate = dueDate
    }
    
    // (Goal) The user sees a one-line prompt to a verse. She knows which verse it refers to.
    // We could use the verse text. But, we hope the user will benefit more in the long run, via practicing with the prompt.
    // If no prompt, show the verse's text. E.g., when a verse is first added.
    var rowTitle: String {
        var title: String;
        if ((prompts.first?.text.isEmpty) != nil) {
            
        }
        if let firstPrompt = prompts.first,
           !firstPrompt.text.isEmpty {
            title = firstPrompt.fullPrompt
        } else {
            title = text
        }
        return title
    }
    
    // MARK: Hashable
    // Avoiding extensions, thanks to this discussion (https://www.reddit.com/r/iOSProgramming/comments/1dz99la/comment/lcea4zo/).
    static func == (lhs: Verse, rhs: Verse) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
