import SwiftUI
import SwiftData

// MARK: - (QuizView)
struct QuizView: View {
// (goal) (user can get quizzed on the paragraph most due)
    // MARK: - (body)
    var body: some View {
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
        inputTextField
        checkButton
    }
    
    // MARK: - (layout) (other)
    
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
            // show text field for input
            // and a compare button (so is it always there but hidden/transp?
        }
    }
    
    @ViewBuilder
    private var inputTextField: some View {
        TextField("input", text: $input)
    }
    
    @ViewBuilder
    private var checkButton: some View {
    // (goal) (??)
        Button("Check") {
            
        }
    }

    // MARK: - (paragraph)

    
    // MARK: - (?)

    private var paragraph: Paragraph
    
    @State private var input = String()
    
    init(_ paragraph: Paragraph) {
        self.paragraph = paragraph
    }
}
