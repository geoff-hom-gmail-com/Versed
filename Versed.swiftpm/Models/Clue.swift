import SwiftUI
import SwiftData

// (Goal) The user knows which verse to recite. But, she has trouble getting started. Or, she gets stuck in the middle. She uses specific clues to help her.
// (final) (inheritance not considered)
// (class) (SwiftData)
// (Hashable) (required by Verse to be Hashable)
// (Identifiable) (required by ForEach)
@Model
final class Clue: Hashable, Identifiable {
    // todo comment (can't use let in Swift 6 and SwiftData or compiler warning)
    private(set) var id = UUID()
    
    // Ideally, a clue helps not only when using the app, but also in real life. Perhaps because the clue strengthened the verse's encoding.
    // Research has shown that memory is strengthened by testing, but not by review. (See FAQ.) For that reason, each Clue is not a single statement, but a question-answer pair. 
    // E.g., not "Clue: Jesus said this when tempted by Satan." 
    // Rather, "Q: To whom did Jesus say this?" 
    //             "A: Satan."
    var q: String
    var a: String
    
    init(q: String, a: String) {
        self.q = q
        self.a = a
    }
    
    // MARK: Hashable
    // Avoiding extensions, thanks to this discussion (https://www.reddit.com/r/iOSProgramming/comments/1dz99la/comment/lcea4zo/).
    static func == (lhs: Clue, rhs: Clue) -> Bool {
        return (lhs.q == rhs.q) && 
        (lhs.a == rhs.a)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(q)
        hasher.combine(a)
    }
}
