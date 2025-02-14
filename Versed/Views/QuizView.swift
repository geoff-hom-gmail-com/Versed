import SwiftUI
import SwiftData

// MARK: - (QuizView)
struct QuizView: View {
// (goal) (user can get quizzed on the paragraph most due)
    // MARK: - (body)
    var body: some View {
        if let paragraph = paragraph {
            VStack(alignment: .leading) {
                Text(paragraph.passage.beforeCue)
                Text("\n…\n")
                Text(paragraph.passage.afterCue)
            }
            HStack {
                sayButton
                Spacer()
                typeButton
            }
        }
    }
    
    // MARK: - (buttons)
    
    @ViewBuilder
    private var sayButton: some View {
    // (goal) (user can choose easily to say her answer)
    // (note) (buttons vs picker) (want to encourage user to try different inputs occasionally) (alt button is tap x1) (alt pick is tap x2)
        Button("Say", systemImage: AppConstant.SFSymbol.say) {
            
        }
        
    }
    
    @ViewBuilder
    private var typeButton: some View {
    // (goal) (user can choose easily to type her answer)
        Button("Type") {
            
        }
    }

    // MARK: - (paragraph)

    private var paragraph: Paragraph? {
        print("(QuizView) (paragraph)")
        return paragraphs.min { $0.dueDate < $1.dueDate }
    }
    
    @Query
    private var paragraphs: [Paragraph]
    // TODO: - (after quizzing works) (see how many times called when a text is added/updated)
    // as long as it doesn't call the compute too often we're fine
}
