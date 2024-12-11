import SwiftUI

// (Goal) In the future, life happens to the user. Her brain has already associated that context/prompt with a verse she has memorized. She can recite the verse as needed.
// (final) (inheritance not considered)
// (class) (SwiftData)
// (Hashable) (required by Verse to be Hashable)
final class Prompt: Hashable {
    var text: String
    
    // (Goal) The user envisions a situation where multiple verses apply. For memorization (spaced repetition), she knows which verse to recite. 
    var clarifier: String?
    
    init(text: String, clarifier: String? = nil) {
        self.text = text
        self.clarifier = clarifier
    }
    
    // (Goal) The user sees a one-line version of the prompt + clarifier. She knows which verse it refers to.
    // Current implementation: "prompt (clarifier)." 
    var fullPrompt: String {
        var fullPrompt = text
        if let clarifier = clarifier {
            fullPrompt += " (\(clarifier))"
        }
        
        return fullPrompt
    }
    
    // MARK: Hashable
    // Avoiding extensions, thanks to this discussion (https://www.reddit.com/r/iOSProgramming/comments/1dz99la/comment/lcea4zo/).
    static func == (lhs: Prompt, rhs: Prompt) -> Bool {
        return (lhs.text == rhs.text) && 
        (lhs.clarifier == rhs.clarifier)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(text)
        hasher.combine(clarifier)
    }
}
