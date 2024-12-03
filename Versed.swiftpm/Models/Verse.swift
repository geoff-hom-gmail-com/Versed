import SwiftUI

// The text to be recited. 
// (Identifiable) (required by ForEach)
// (Hashable) (required by NavigationLink(_:value:))
struct Verse: Identifiable, Hashable {
    let id = UUID()
    var text: String
    var prompts: [Prompt] = []
    var clues: [Clue] = []
    
    // Nil reasons: 1) No prompt set. 2) Example verses.
    var dueDate: Date?
    
//    init() {}
    
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
}