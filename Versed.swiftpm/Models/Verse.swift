import SwiftUI
import SwiftData

// (Goal) The user can memorize a custom verse/text. She can edit the verse's text, layout, prompts, and clues. Each verse is due for recitation at a custom date, as determined by spaced repetition.
// (final) (inheritance not considered)
// (class) (SwiftData)
// (Identifiable) (required by ForEach)
// (Hashable) (required by NavigationLink(_:value:))
//@Model
@Observable
final class Verse: Identifiable, Hashable {
    let id = UUID()
    var text: String
    
    // (MVP-post) Currently, the user can set only one prompt per verse. But one can imagine multiple prompts. 
    var prompts: [Prompt]
    var clues: [Clue]
    
    // (Goal) The user recites a verse according to its due date. The date is first set, after the prompt is set. The date is updated by spaced repetition. 
    // Example verses have no due date. 
    var dueDate: Date?
    
    init(_ text: String, prompts: [Prompt] = [], clues: [Clue] = [], dueDate: Date? = nil) {
        self.text = text
        self.prompts = prompts
        self.clues = clues
        self.dueDate = dueDate
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
    
    // MARK: Hashable
    // Avoiding extensions, thanks to this discussion (https://www.reddit.com/r/iOSProgramming/comments/1dz99la/comment/lcea4zo/).
    static func == (lhs: Verse, rhs: Verse) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
