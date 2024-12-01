import SwiftUI

// The text to be recited. 
// (Identifiable) (required by ForEach)
// (Hashable) (required by NavigationLink(_:value:))
struct Verse: Identifiable, Hashable {
    let id = UUID()
    var text: String
    var prompts: [Prompt] = []
    var clues: [Clue] = []
    
    // How to summarize the verse in one row. 
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
