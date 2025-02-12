import SwiftUI

// MARK: - (ExampleDetail)
struct ExampleDetail: View {
// (goal) (user can see an example) (to properly create texts)
    // MARK: - (body)
    var body: some View {
        Form {
            TextFieldSection(.beforeCue, text: .constant(example.beforeCue))
            TextFieldSection(.goalBeats, text: .constant(example.goal))
            TextFieldSection(.afterCue, text: .constant(example.afterCue))
            TextFieldSection(.notes, text: .constant(example.notes))
            TextFieldSection(.tip, text: .constant(example.tip))

            // TODO: - (goal) (user can't edit example)
//            ScrollView {
//                Text(example.goal)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//            }
//            .frame(maxHeight: 200)
//            // (test) (Text)
//            // (arbitrary height not good) (can try GeometryReader)
//            
//            Section {
//                TextEditor(text: .constant(example.goal))
//            }
            // (test) (TextEditor)
            // (text/height is cutoff, even for short paragraphs) (can try lineLimit)
        }
        .navigationTitle(example.type)
        .scrollDismissesKeyboard(.immediately)
        // (note) (example should not be editable) (but for now we're using a TextField with a constant binding) (so the keyboard still comes up)
        
        // TODO: - (goal) (user can't edit example) (also need to apply this to user texts, which have prompts)
        // Haven't found an ideal solution yet.
        // For now, using a constant binding.
        // How can we design our way out of this? Wait until ready to tackle stats view here? What's MVP?
        // Issues:
        // - (disabling TextField or TextEditor disables scrolling)
        // - (constant binding on TextField still allows text to be entered, just not saved) (though no newlines)
        // - (constant binding on TextEditor still shows cursor, and keyboard)
        // - (Text in ScrollView works, but not sure how to set frame height in a robust way) (GeometryReader?)
        // - (Only TextField has placeholder built-in) (would need fake gray placeholders) (though examples have all fields filled except maybe tip)
        // - (need to include headers) (while keeping code browsable/DRY)
        // - (test on device to ensure scrolling is acceptable)
    }
    
    // MARK: - (properties)
    
    private var example: Example
    
    // MARK: - (init(_:))
    init(_ example: Example) {
        self.example = example
    }
}

// MARK: - (preview)
#Preview {
    let example = AppConstant.ExampleText.universe
    ExampleDetail(example)
}
