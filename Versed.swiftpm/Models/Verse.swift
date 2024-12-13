import SwiftUI
import SwiftData

// (Goal) The user can memorize a custom verse/text. She can edit the verse's text, layout, prompts, and clues. Each verse is due for recitation at a custom date, as determined by spaced repetition.
// (@Observable?) (todo) (Model would replace)
// (final) (inheritance not considered)
// (class) (SwiftData)
// (Identifiable) (required by ForEach)
// (Hashable) (required by NavigationLink(_:value:))
@Model
//@Observable
final class Verse: Identifiable, Hashable {
    // todo comment (can't use let in Swift 6 and SwiftData or compiler warning)
    private(set) var id = UUID()
    
    //testing
//    var testEnum: TestEnum
    
    // (Goal) The user can see example verses, to learn the app. But, she can't edit them.
    var isExample: Bool
    
    // (Goal) The user sees verses in a list in the same order. She can also reorder them.
    // SwiftData does not store array order for model objects. 
    var order: Int
    
    var text: String
    
    // (MVP-post) Currently, the user can set only one prompt per verse. But one can imagine multiple prompts. 
    var prompts: [Prompt]
    var clues: [Clue]
    
    // (Goal) The user recites a verse according to its due date. The date is first set, after the prompt is set. The date is updated by spaced repetition. 
    // Example verses have no due date. 
    var dueDate: Date?
    
    init(_ text: String, isExample: Bool = false, order: Int = 0, prompts: [Prompt] = [], clues: [Clue] = [], dueDate: Date? = nil) {
        self.text = text
        self.isExample = isExample
        self.order = order
        self.prompts = prompts
        self.clues = clues
        self.dueDate = dueDate
        
//        self.testEnum = testEnum
    }
    
    // (Goal) The user sees a one-line reference to a verse. The reference is in line with how she will associate that verse in real life. She knows which verse it refers to.
    // We could simply use the verse's text. But, we hope the user will benefit more in the long run, via practice of seeing first the prompt.
    // If no prompt, show the verse's text. E.g., when a verse is first added.
    var rowTitle: String {
        var title: String;
        if let firstPrompt = prompts.first {
            title = firstPrompt.fullPrompt
        } else {
            title = text
        }
        return title
    }
    
    // MARK: VerseCategory
    // (Codable) (why?) (I think SwiftData needs it)
    // (String) (need rawValue for predicate hack)
//    enum VerseCategory: String, Codable {
//        case example
//        case user
//    }
//    
//    enum TestEnum: Codable {
//        case test1
//        case test2
//    }
    
    // MARK: Hashable
    // Avoiding extensions, thanks to this discussion (https://www.reddit.com/r/iOSProgramming/comments/1dz99la/comment/lcea4zo/).
    static func == (lhs: Verse, rhs: Verse) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

//extension Verse {
//    enum TestEnum: Codable {
//        case test1
//        case test2
//    }
//}
