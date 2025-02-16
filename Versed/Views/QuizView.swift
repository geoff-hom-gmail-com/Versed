import SwiftUI
import SwiftData

// MARK: - (QuizView)
struct QuizView: View {
// (goal) (user can get quizzed on the paragraph most due)
    // MARK: - (body)
    var body: some View {
        Form {
            Section() {
                beforeCue
                answerHStack
                afterCue
                checkButton
            }
        }
    }
    
    // MARK: - (layout) (next level)
    
    @ViewBuilder
    private var beforeCue: some View {
        Text(paragraph.passage.beforeCue)
    }
    
    @ViewBuilder
    private var answerHStack: some View {
    // (goal) (user can input answer) (she can check answer)
        HStack {
            inputTextField
            if isCheckingAnswer {
                goal
                    .transition(.move(edge: .trailing))
            }
        }
        .listRowSeparator(.hidden)
        // (goal) (user associates row with adjacents) (visually)
    }
    
    
    @ViewBuilder
    private var afterCue: some View {
        Text(paragraph.passage.afterCue)
    }
    
    @ViewBuilder
    private var checkButton: some View {
    // (goal) (user can check her answer)
        Button("Check") {
            withAnimation {
                isCheckingAnswer.toggle()
            }
        }
        .frame(maxWidth: .infinity)
        // (goal) (user sees this in center)
        
        //        .alignmentGuide(.listRowSeparatorLeading) { $0[.leading] }
        // (goal) (align to edge, not text)
    }
    
    // MARK: - (layout) (next level)

    @ViewBuilder
    private var inputTextField: some View {
        TextField(
            "input",
            text: $input,
            prompt: Text("(speak or type)"),
            axis: .vertical)
        .lineLimit(5...7)
    }
    
    @ViewBuilder
    private var goal: some View {
        Text(paragraph.text)
        // TODO: - (for merge quiz, fix)
    }
    
        
    //    @ViewBuilder
    //    private var sayButton: some View {
    //    // (goal) (user can choose easily to say her answer)
    //    // (note) (buttons vs picker) (want to encourage user to try different inputs occasionally) (alt button is tap x1) (alt pick is tap x2)
    //        // (it's possible that we won't even need two buttons, and the user will choose by how they work with the text field)
    //        Button("Say", systemImage: AppConstant.SFSymbol.say) {
    //        }
    //    }
    //
    //    @ViewBuilder
    //    private var typeButton: some View {
    //    // (goal) (user can choose easily to type her answer)
    //        Button("Type") {
    //            // show text field for input
    //            // and a compare button (so is it always there but hidden/transp?
    //        }
    //    }
    
    // MARK: - (misc)

    private var paragraph: Paragraph
    
    @State private var input = String()
    
    @State private var isCheckingAnswer = false
    
    // MARK: - (init())

    init(_ paragraph: Paragraph) {
        self.paragraph = paragraph
    }
}
