import Foundation
import SwiftData

// MARK: - (Paragraph)
@Model
final class Paragraph {
// (goal) (user can be quizzed on each paragraph in a text) (independently)
// (final) (inheritance not considered)
// (class) (SwiftData)
    // MARK: - (functions)
    
    func updateDueDate(feedback: QuizFeedback) {
    // (goal) (user can give feedback) (to update her paragraph's next due date)
    }
    
    // MARK: - (properties)

    @Relationship
    var passage: Passage
    // (note) (if optional) (SwiftData will set this automatically) (no need in init())
    // (but prefer non-optional)
    
    var text: String
        
    var dueDate = Date.now
    // (goal) (user can be quizzed on her paragraph immediately)

    //    var status: LearningStatus

    // MARK: - (LearningStatus)
    enum LearningStatus {
        case sprout
        // (goal) (the user's experience is different when learning a paragraph that is not consolidated)
        // (goal) (if a rooted paragraph is failed) (the user's experience is like a sprout again, just in case)
        // (goal) (if a paragraph is re-sprouted) (the user can manually increase its due date)
        
        case rooted
    }
    
    // MARK: - (init())

    init(passage: Passage, text: String) {
        self.passage = passage
        self.text = text
    }
    
    //    init(text: String) {
    //        self.text = text
    //    }
        // (note) (keep) (if passage optional)
}
