import SwiftUI
import SwiftData

// MARK: - (QuizView)
struct QuizView: View {
// (goal) (user can get quizzed on the paragraph most due)
    // MARK: - (body)
    var body: some View {
        Form {
            Section() {
            // (note) (form section why?) (consistentcy) (e.g., with TextDetail)
                beforeCue
                answerHStack
                afterCue
                checkButton
            }
            
            if isCheckingAnswer {
                Section() {
                    HStack {
                        Text("Mistakes fixed?")
                        Button(String(), systemImage: AppConstant.SFSymbol.yes) {
                            
                        }
                        // TODO: - (one-time animation/feedback? brain)
                    }
                    HStack {
                        Text("Score:")
                        Button("Good") {
                            
                        }
                        .buttonStyle(.bordered)
                        Button("Fail") {
                            
                        }
                        .buttonStyle(.bordered)
                        // TODO: - (user taps score) (next quiz)
                    }
                    .listRowSeparator(.hidden)
                }
            }
            
        }
        .scrollDismissesKeyboard(.immediately)
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
        Button("Check") {
            withAnimation {
                isCheckingAnswer.toggle()
            }
        }
        .frame(maxWidth: .infinity)
        // (goal) (user sees view in center)
        
        //        .alignmentGuide(.listRowSeparatorLeading) { $0[.leading] }
        // (goal) (align to edge, not text)
    }
    
    // MARK: - (layout) (next level)

    @ViewBuilder
    private var inputTextField: some View {
        TextField(
            "input",
            text: $input,
            prompt: Text("(dictate or type)"),
            axis: .vertical)
        .lineLimit(5...7)
    }
    
    @ViewBuilder
    private var goal: some View {
        Text(paragraph.text)
        // TODO: - (for merge quiz, fix)
    }
    
    // MARK: - (misc)

    private var paragraph: Paragraph
    
    @State private var input = String()
    
    @State private var isCheckingAnswer = false
    
    // MARK: - (init())

    init(_ paragraph: Paragraph) {
        self.paragraph = paragraph
    }
}
