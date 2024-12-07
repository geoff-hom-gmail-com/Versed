import SwiftUI

// How does a user know which verse to recite? Not by notation (e.g., Rev 12:2). Rather, by what might realistically prompt recitation. 

// (Hashable) (required by Verse to be Hashable)
struct Prompt: Hashable {
    var text: String
    
    // A situation may prompt multiple verses. But, the app tests a user only when a verse is due. To clarify which verse is intended, prompts can have a clarifier.
    var clarifier: String?
    
    // The prompt in "prompt (clarifier)" format. 
    var fullPrompt: String {
        var fullPrompt = text
        if let clarifier = clarifier {
            fullPrompt += " (\(clarifier))"
        }
        
        return fullPrompt
    }
}
