import SwiftUI

// (Goal) The user can get the given clue, according to the given sense.
// (.hear) She can hear the question by tapping a button. For the answer, another button.
// (.see) She can show/hide the question by tapping a button. For the answer, another button.
// (MVP-post) (ToDo?) (Could start with just Q) (Tap to reveal question, and show A icon) (Tap Q again to hide both) (could have disclosure/animation, or not) (That way, you can't see an answer before a question)
struct ClueView: View {
    let clue: Clue
    let sense: Sense
    
    // By default, both question and answer are hidden. (Less noise.)
    @State private var shouldShowQuestion = false
    @State private var shouldShowAnswer = false

    let questionImage = Image(systemName: SFSymbols.question)
    var answerImage: some View {
        Image(systemName: SFSymbols.answer)
            .environment(\.layoutDirection, .rightToLeft)
    }
    
    var body: some View {
        switch sense {
        case .hear:
            HearButton(image: questionImage, text: clue.q)
            HearButton(image: answerImage, text: clue.a)
                .padding(.leading)
        case .see:
            // (ToDo) (when doing see route) (DRY) (SeeButton(image:text:)?)
            HStack {
                Button() {
                    shouldShowQuestion.toggle()
                } label: {
                    questionImage
                }
                
                if shouldShowQuestion {
                    Text(clue.q)
                }
            }
            HStack {
                Button() {
                    shouldShowAnswer.toggle()
                } label: {
                    answerImage
                }
                
                if shouldShowAnswer {
                    Text(clue.a)
                }
            }
            .padding(.leading)
        }
    }
}
