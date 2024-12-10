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
    var prompts: [Prompt]
    var clues: [Clue]
    
    // (Goal) ??
    // Nil reasons: 1) No prompt set. 2) Example verses.
    var dueDate: Date?
    
//    init(text: String) {
//        self.text = text
//    }
    
    init(text: String, prompts: [Prompt] = [], clues: [Clue] = [], dueDate: Date? = nil) {
        self.text = text
        self.prompts = prompts
        self.clues = clues
        self.dueDate = dueDate
    }
    
    // A summary of the verse, in one row. 
    // Preference is prompts, because that's how they're recalled. Else, text. 
    var rowTitle: String {
        var title: String;
        if let firstPrompt = prompts.first {
            title = firstPrompt.text
            if let clarifier = firstPrompt.clarifier {
                title += " (\(clarifier))"
            }
        } else {
            title = text
        }
        return title
    }
    
    // MARK: Hashable
    static func == (lhs: Verse, rhs: Verse) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// Was going to remove argument label for "text." But, it seems like we'd need an init for every combo of variables. Not worth the trouble.
//extension Verse {
//    init(_ text: String) {
//        self.text = text
//    }
//}
