import SwiftUI

// MARK: - (ExampleDetail)
// (Goal) The user can see learning stats. She can also edit the text.
struct ExampleDetail: View {
    // MARK: - (body)
    var body: some View {
        // TODO: - (The user can view text, but to edit it, has to tap button.)
        // (ToDo) (Goal) The user knows that text here can't be edited. Need to open sheet for that.
        // Haven't found an ideal solution yet.
        // For now, using a constant binding.
        // How can we design our way out of this? Wait until ready to tackle stats view here? What's MVP?
        // Issues:
        // - (disabling TextField or TextEditor disables scrolling)
        // - (constant binding on TextField still allows text to be entered, just not saved) (though no newlines)
        // - (constant binding on TextEditor still shows cursor, and presumably keyboard)
        // - (Text in ScrollView works, but not sure how to set frame height in a robust way) (GeometryReader?)
        // - (Only TextField has placeholder built-in) (would need fake gray placeholders)
        // - (need to include headers) (while keeping code browsable/DRY)
        // - (probably do on-device testing to make sure scrolling is acceptable)
        Form {
            // temp example with Text()
            ScrollView {
                Text(goalText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            // todo; not fond of how it's just a number vs number of lines
            .frame(maxHeight: 200)
            
            // temp example with TextEditor()
            // this also has some arbitrary default height of like 9 lines
            Section {
                TextEditor(text: .constant(goalText))
            }
            
            TextFieldSection(.before, text: .constant(beforeText))
            TextFieldSection(.goalBeats, text: .constant(goalText))
            TextFieldSection(.after, text: .constant(afterText))
            TextFieldSection(.reference, text: .constant(referenceText))
        }
        .onAppear {
//            unNew()
        }
    }
    
    // MARK: - (init(_:))
    init(_ example: Example) {
        self.beforeText = example.beforeText
        self.goalText = example.goalText
        self.afterText = example.afterText
        self.referenceText = example.referenceText
    }
    
    // MARK: - (properties)
    
    // todo may not even need/want bindable
    // we pass in passage, and then it gets edited but with temp vars
    // if usre taps done/update, then we update/replace
    // that should work for passage.before/after/ref. goalText is trickier
    // Will have to do a calc in Passage to compare old and new goalText, or really old and new Paragraphs. Old ones keep interval data.
//    @Bindable var passage: Passage
    
    private var beforeText: String
    private var goalText: String
    private var afterText: String
    private var referenceText: String
    
    @State private var isShowingSheet = false
    
    // MARK: - (unNew())
    
    // (Goal) The user sees text as "New," until seen once.
//    private func unNew() {
//        if passage.isNew {
//            passage.isNew.toggle()
//            save()
//        }
//    }
//
//    private func save() {
//        // (Note) Not sure if needed on device. But, in Xcode preview, helps.
//        do {
//            try modelContext.save()
//        } catch {
//            print("Failed to save: \(error)")
//        }
//    }
//    
//    @Environment(\.modelContext) private var modelContext
}

// MARK: - (preview)
#Preview {
    let example = AppConstant.ExampleText.multiverse
//    ExampleDetail(example)
}
