import SwiftUI
import SwiftData

// MARK: - (QuizView)
struct QuizView: View {
// (goal) (user can get quizzed on the paragraph that was ready longest)
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
    // (goal) (user sees text before quiz paragraph)
        if let passage = paragraph.passage {
            
            let paragraphs = passage.orderedParagraphs
            if let index = paragraphs.firstIndex(of: paragraph),
               index != paragraphs.indices.first {
                
                let beforeParagraph = paragraphs[index - 1]
                Text(beforeParagraph.text)
            } else {
                Text(passage.beforeCue)
            }
        }
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
    // (goal) (user sees text after quiz paragraph)
        if let passage = paragraph.passage {
            
            let paragraphs = passage.orderedParagraphs
            if let index = paragraphs.firstIndex(of: paragraph),
               index != paragraphs.indices.last {
                
                let afterParagraph = paragraphs[index + 1]
                Text(afterParagraph.text)
            } else {
                Text(passage.afterCue)
            }
        }
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
            goodButton
            retryButton
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
    }
    
    @ViewBuilder
    private var goodButton: some View {
        Button(String(), systemImage: AppConstant.SFSymbol.yes) {
            update(feedback: .good)
        }
        .buttonStyle(.bordered)
        // TODO: - center image as needed
    }
    
    @ViewBuilder
    private var retryButton: some View {
        Button(String(), systemImage: AppConstant.SFSymbol.retry) {
            update(feedback: .retry)
        }
        .buttonStyle(.bordered)
    }
    
    // MARK: - (non-views)

    private var paragraph: Paragraph
    
    @State private var input = String()
    @State private var isCheckingAnswer = false
    @State private var areMistakesFixed = false
    
    private func update(feedback: QuizFeedback) {
    // (goal) (user sees next quiz)
        paragraph.update(feedback: feedback)
        resetState()
    }
    
    private func resetState() {
    // (goal) (user sees fresh quiz) (even if same paragraph)
        input = String()
        isCheckingAnswer = false
        areMistakesFixed = false
    }
    
    // MARK: - (init())

    init(_ paragraph: Paragraph) {
        self.paragraph = paragraph
    }
}
