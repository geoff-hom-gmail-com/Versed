import SwiftUI

// Goal: The user can see a clue. Tap question and answer buttons to show/hide.
// (MVP-post) (ToDo?) (Could start with just Q icon) (Tap to reveal question, and show A icon) (Tap Q again to hide both) (could have disclosure/animation, or not) (That way, you can't see an answer before a question)
struct SeeClueView: View {
    var clue: Clue
    
    // By default, both question and answer are hidden. (Less noise.)
    @State private var shouldShowQuestion = false
    @State private var shouldShowAnswer = false
    
    init(clue: Clue) {
        self.clue = clue
    }
    
    // The question can start revealed. 
    init(clue: Clue, shouldShowQuestion: Bool) {
        self.clue = clue
        _shouldShowQuestion = State(initialValue: shouldShowQuestion)
    }
    
    var body: some View {
        // (Goal) The user should think "question/answer." Or, "conversation."
        HStack {
            Button() {
                shouldShowQuestion.toggle()
            } label: {
                Image(systemName: "questionmark.bubble")            
            }
            if shouldShowQuestion {
                Text(clue.q)
            }
        }
        HStack {
            Button() {
                shouldShowAnswer.toggle()
            } label: {
                // The SF Symbol below uses right-to-left layout, though we're still in English. If that becomes a localization issue, alt symbol: bubble.left.and.exclamationmark.bubble.right.
                Image(systemName: "exclamationmark.bubble")
                    .environment(\.layoutDirection, .rightToLeft)
                    .padding(.leading)
            }
            if shouldShowAnswer {
                Text(clue.a)
            }
        }
    }
}
