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
        switch status {
        case .sprout:
            switch feedback {
            case .good:
                let interval = dueDate.timeIntervalSinceNow * -1
                if interval < AppConstant.Date.daySeconds {
                    dueDate.addTimeInterval(AppConstant.Date.daySeconds)
                } else {
                    status = .rooted
                    let newInterval = interval * 2.5
                    dueDate.addTimeInterval(newInterval)
                }
                // (goal)
                // (if interval was day < 1) (next interval is day x1)
                // (if interval was day x1+) (upgrade status) (increase interval)
            case .retry:
                dueDate = Date.now
            }
        case .rooted:
            switch feedback {
            case .good:
                let interval = dueDate.timeIntervalSinceNow * -1
                let newInterval = interval * 2.5
                // todo: what's the appconstant call? srs? date? alg? quiz
                // TODO: - (tidy)
                dueDate.addTimeInterval(newInterval)
                // (goal)
                // (increase interval)
            case .retry:
                status = .sprout
                dueDate = Date.now
                // (goal)
                // (lower status) (due now)
            }
        }
    }
    
    // MARK: - (properties)

    @Relationship
    var passage: Passage
    // (note) (if optional) (SwiftData will set this automatically) (no need in init())
    // (but prefer non-optional)
    
    var text: String
        
    var dueDate = Date.now
    // (goal) (user can be quizzed on her paragraph immediately)

    var status: LearningStatus

    
    
    // MARK: - (init())

    init(passage: Passage, text: String) {
        self.passage = passage
        self.text = text
        self.status = .sprout
    }
    
    //    init(text: String) {
    //        self.text = text
    //    }
        // (note) (keep) (if passage optional)
}

// MARK: - (LearningStatus)
enum LearningStatus: Codable {
// (goal) (user has different experience for quiz of paragraph that is not consolidated)
// (Codable) (required by SwiftData)
    case sprout
    // (goal) (if rooted paragraph is failed) (user's experience is like a sprout again, just in case)
    // (note) (no re-sprouted status yet) (but user can always manually increase due date)
    // TODO: - (add above lol)
    
    case rooted
}
