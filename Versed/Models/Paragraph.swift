import Foundation
import SwiftData

// MARK: - (Paragraph)
@Model
final class Paragraph {
// (goal) (user can be quizzed on each paragraph in a text) (independently)
// (final) (inheritance not considered)
// (class) (SwiftData)
    // MARK: - (static functions)
    
    static func arrayFrom(_ text: String) -> [Paragraph] {
    // (goal) (returns the given text as Paragraphs)
        let rawParagraphs = text.components(separatedBy: AppConstant.Text.paragraphBreak)
        let paragraphs = rawParagraphs.enumerated().map { index, text in
            Paragraph(index: index, text: text) }
        return paragraphs
    }
    
    static func abbr(from interval: TimeInterval) -> String {
    // (goal) (user sees interval value, abbreviated)
        let formatter = DateComponentsFormatter()
        formatter.maximumUnitCount = 1
        
        formatter.allowsFractionalUnits = true
        // (bug) (doesn't work) (Xcode 16.1) (seems that way for years)

        formatter.allowedUnits = [.minute, .hour, .day, .month, .year]
        // (goal) (user not stressed by seeing seconds)
        
        formatter.unitsStyle = .short
        // (goal) (user sees like "4 hr" not "4hr")
        
        let string = formatter.string(from: interval)
        return string ?? String()
    }
    
    static func newInterval(from current: TimeInterval) -> TimeInterval {
    // (goal) (user can manually increase quiz interval)
    // (note) (similar to paragraph.update(feedback:)) (without randomness)
        let oneDay = AppConstant.Date.daySeconds
        switch current {
        case ..<oneDay:
            return oneDay
        default:
            return current * AppConstant.Date.spacing
        }
    }
    
    static func oldInterval(from current: TimeInterval) -> TimeInterval {
    // (goal) (user can manually decrease quiz interval)
    // (note) (similar to paragraph.update(feedback:)) (without randomness)
        let oneDay = AppConstant.Date.daySeconds
        switch current {
        case ...oneDay:
            return 0
        case oneDay..<oneDay * AppConstant.Date.spacing:
            return oneDay
        default:
            return current / AppConstant.Date.spacing
        }
    }
    
    // MARK: - (instance functions)
    
    func update(feedback: QuizFeedback) {
    // (goal) (user can give quiz feedback) (to update her paragraph)
        let oldInterval = priorQuizDate.timeIntervalSinceNow * -1
        priorQuizDate = Date.now
        
        var newInterval = oldInterval * AppConstant.Date.spacing * AppConstant.Date.orderMixer
        // (goal) (user sees next quiz spaced out) (and not always in same order)
        
        switch status {
        case .sprout:
            switch feedback {
            case .good:
                if oldInterval < AppConstant.Date.daySeconds {
                    newInterval = AppConstant.Date.daySeconds * AppConstant.Date.orderMixer
                } else {
                    status = .rooted
                }
                readyDate = priorQuizDate + newInterval
                // (goal)
                // (if old interval: < day x1) (next interval: day x1)
                // (to sleep/consolidate)
                // (else) (status: upgrade) (next interval: default spacing)
            case .retry:
                readyDate = Date.now
                // temp test (adding 5")
//                readyDate = Date.now.addingTimeInterval(5)
            }
        case .rooted:
            switch feedback {
            case .good:
                readyDate = priorQuizDate + newInterval
            case .retry:
                status = .sprout
                readyDate = Date.now
                // (goal)
                // (status: downgrade) (ready: now)
                
                // TODO: - (MVP-post)
                // (consider adding re-sprouted status or whatever name)
                // (since it should have been consolidated, so that is a key improvement)
                // (like buying a bigger tree that you still have to plant) (what do they call that?)
            }
        }
    }
    
    // MARK: - (properties)
    
    @Relationship
    var passage: Passage?
    // (note) (SwiftData one-to-many relationships) (best practice is as optional)  (https://developer.apple.com/forums/thread/772885?answerId=822395022#822395022)
    // (tried non-optional) (but then issues deleting paragraphs)
    
    var index: Int
    // (goal) (user can see paragraph before/after this one) (e.g., cues)
    // (note) (SwiftData does not preserve array order for objects) (Xcode 16.1)
    
    var text: String
    
    var interval: TimeInterval {
        readyDate.timeIntervalSince(priorQuizDate)
    }
    
//    var intervalAbbr: String {
//    // (goal) (user sees interval value, abbreviated)
//        let formatter = DateComponentsFormatter()
//        formatter.maximumUnitCount = 1
//        formatter.allowsFractionalUnits = true
//        // TODO: - (see if this actually works?) (fractional) (hopefully just one decimal)
//        
//        formatter.allowedUnits = [.minute, .hour, .day, .month, .year]
//        // (goal) (user not stressed by seeing seconds)
//        
//        formatter.unitsStyle = .short
//        // (goal) (user sees like "4 hr" not "4hr")
//        
////        let string = formatter.string(from: priorQuizDate, to: readyDate)
//        let string = formatter.string(from: interval)
//        return string ?? String()
//    }
    
    var readyDate = Date.now
    // (goal) (user can be quizzed on her paragraph immediately)
    // (note) (was due date) (but that implies a deadline, a due by) (where earlier is bonus)
    // (for quizzing, the "deadline" is actually the earliest time you should quiz) (and later can be bonus)
    
    var priorQuizDate = Date.now

    var status: LearningStatus
    
    // MARK: - (init())

    init(index: Int = 0, text: String) {
        self.index = index
        self.text = text
        self.status = .sprout
    }
}

// MARK: - (LearningStatus)
enum LearningStatus: Codable {
// (goal) (user has different experience for quiz of paragraph that is not consolidated)
// (Codable) (required by SwiftData)
    case sprout
    // (goal) (if rooted paragraph is failed) (user's experience is like a sprout again, just in case)
    // (note) (no re-sprouted status yet) (but user can always manually increase ready date)
    // TODO: - (add above function to quiz/edit lol)
    
    case rooted
}
