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
                inputTextField
                afterCue
                checkButton
            }
        }
//        .sheet(isPresented: $isShowingSheet) {
////            CompareView()
//        }
    }
    
    // MARK: - (layout) (other)
    
    @ViewBuilder
    private var beforeCue: some View {
        Text(paragraph.passage.beforeCue)
//        Text(paragraph.passage.beforeCue + "\n")
    }
    
    @ViewBuilder
    private var inputTextField: some View {
        TextField(
            "input",
            text: $input,
            prompt: Text("(speak or type)"),
            axis: .vertical)
        .lineLimit(5...7)
        
        .listRowSeparator(.hidden)
        // (goal) (user associates this with adjacent elements) (visually)
    }
    
    @ViewBuilder
    private var afterCue: some View {
        Text(paragraph.passage.afterCue)
//        Text("\n" + paragraph.passage.afterCue)
    }
    
    @ViewBuilder
    private var checkButton: some View {
    // (goal) (user can compare her answer)
        Button("Check") {
//            isShowingSheet.toggle()
        }
        .frame(maxWidth: .infinity)
        // (goal) (user sees this in center)
        
        //        .listRowSeparator(.hidden)
        
        //        .alignmentGuide(.listRowSeparatorLeading) { $0[.leading] }
        // (goal) (align to edge, not text)
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
        

    // MARK: - (??)

    
    // MARK: - (misc)

    private var paragraph: Paragraph
    
    @State private var input = String()
    
//    @State private var isShowingSheet = false
    
    // MARK: - (init())

    init(_ paragraph: Paragraph) {
        self.paragraph = paragraph
    }
}
