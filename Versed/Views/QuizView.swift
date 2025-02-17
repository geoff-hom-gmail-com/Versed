import SwiftUI
import SwiftData

// MARK: - (QuizView)
struct QuizView: View {
// (goal) (user can get quizzed on the paragraph most due)
    // MARK: - (body)
    var body: some View {
        Form {
            Section() {
            // (note) (form section: why?) (consistentcy) (e.g., with TextDetail)
                beforeCue
                answerHStack
                afterCue
                checkButton
            }
            
            if isCheckingAnswer {
                Section() {
                    feedbackView
                }
            }
        }
        .scrollDismissesKeyboard(.immediately)
    }
    
    // MARK: - (views) (next level)
    
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
        Button(AppConstant.Label.check) {
            withAnimation {
                isCheckingAnswer.toggle()
            }
        }
        .frame(maxWidth: .infinity)
        // (goal) (user sees view in center)
    }
    
    @ViewBuilder
    private var feedbackView: some View {
        Toggle(AppConstant.Label.mistakesFixed, isOn: $areMistakesFixed)
        // (goal) (user is encouraged/reminded to fix her mistakes) (helps retrieval)
        // (note) (.checkbox style isn't available in iOS) (Xcode 16.1) (which is asinine) (when available, switch) (pun)
        // (yes, we could code our own) (https://sarunw.com/posts/swiftui-checkbox/)
        
        HStack {
            Text(AppConstant.Label.quizFeedback)
            Button(String(), systemImage: AppConstant.SFSymbol.yes) {
                paragraph.updateDueDate(feedback: .good)
            }
            .buttonStyle(.bordered)
            Button(String(), systemImage: AppConstant.SFSymbol.retry) {
                paragraph.updateDueDate(feedback: .retry)
            }
            .buttonStyle(.bordered)
            // TODO: - check buttons same size; center as needed
            // TODO: - (user taps score) (next quiz)
        }
        .listRowSeparator(.hidden)
    }
    
    // MARK: - (views) (next level)

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
    
    // MARK: - (non-views)

    private var paragraph: Paragraph
    
    @State private var input = String()
    @State private var isCheckingAnswer = false
    @State private var areMistakesFixed = false
    
    // MARK: - (init())

    init(_ paragraph: Paragraph) {
        self.paragraph = paragraph
    }
}
