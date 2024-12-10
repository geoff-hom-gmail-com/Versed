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
    
    // (Goal) The user sees a one-line reference to a verse. The reference is in line with how she will associate that verse in real life. She knows which verse it refers to.
    // We could simply use the verse's text. But, we hope the user will benefit more in the long run, via practice of seeing first the prompt.
    // Current implementation: "prompt (clarifier)." 
    var fullPrompt: String {
        var fullPrompt = text
        if let clarifier = clarifier {
            fullPrompt += " (\(clarifier))"
        }
        
        return fullPrompt
    }
    
    // MARK: Hashable
    static func == (lhs: Prompt, rhs: Prompt) -> Bool {
        return (lhs.text == rhs.text) && 
        (lhs.clarifier == rhs.clarifier)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(text)
        hasher.combine(clarifier)
    }
}
