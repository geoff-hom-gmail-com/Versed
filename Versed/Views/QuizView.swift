import SwiftUI
import SwiftData

// MARK: - (QuizView)
struct QuizView: View {
// (goal) (user can get quizzed on the paragraph most due)
    // MARK: - (body)
    var body: some View {
        Form {
            Section() {
                Text(paragraph.passage.beforeCue + "\n")
                inputTextField
                    .listRowSeparator(.hidden, edges: .bottom)
                    // (goal) (user associates this with next element) (visually)
                checkButton
                    .frame(maxWidth: .infinity)
                    // (goal) (user sees this in center)
                
                    .alignmentGuide(.listRowSeparatorLeading) { $0[.leading] }
                    // (goal) (align to edge, not text)
                Text("\n" + paragraph.passage.afterCue)
            }
        }
    }
    
    // MARK: - (layout) (other)
    
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
    
    @ViewBuilder
    private var inputTextField: some View {
        TextField(
            "input",
            text: $input,
            prompt: Text("(speak or type)"),
            // TODO: - (prompt?)
            axis: .vertical)
        .lineLimit(3...7)
    }
    
    @ViewBuilder
    private var checkButton: some View {
    // (goal) (user can compare her answer)
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
