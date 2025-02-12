import SwiftUI

// MARK: - (EditTextView)
// (Goal) The user can update the given text.
// TODO: - ??
// (todo) ( she can delete from here?) ( see UI for delete Contact) (like a red button at bottom, with an alert)
// (ToDo) (Goal) The user knows that examples can't be edited. And she can't edit them.
struct EditTextView: View {
    // MARK: - (body)
    var body: some View {
        // (Note) In a List, the disclosure triangles work with Section(isExpanded:). But with Form, they don't seem to. Even with header empty.
        // DisclosureGroup works. Not sure the UI is ideal. Consider MVP-post.
        
        // (MVP-post?) (still have a lot to do here, including differences between myText and examples) (then stats)
        Form {
            TextFieldSection(.beforeCue, text: $beforeText)
            TextFieldSection(.goalBeats, text: $goalText)
            TextFieldSection(.afterCue, text: $afterText)
            TextFieldSection(.notes, text: $referenceText)
        }
        .onAppear {
            // (Goal) The user sees texts as "New," until seen once.
            if passage.isNew {
                passage.isNew = false
                DataManager.save(modelContext)
            }
        }
        //        .listStyle(.sidebar)
        //        .formStyle(.grouped)
        .scrollDismissesKeyboard(.immediately)
        .toolbar {
            //                ToolbarItem(placement: .cancellationAction) {
            //                    Button(AppConstant.Label.reset) {
            //                        reset()
            //                    }
            //                    .disabled(isNoText)
            //                }
            ToolbarItem(placement: .confirmationAction) {
                // (toDo) (if example, don't show button) (or, if not example, button visible )
                Button("Update") {
                    
                    // (toDo) after adding/saving, user gets feedback. (a badge on Encode ("!", "new" etc) Then after confirming, reset the textfield. It depends, too. Usually, the text needs work like beats. But it's possible it's perfectly fine. In which case it's more like it's new and the user just has to okay it in Encode.
                }
                //                    .disabled(isNoText)
            }
        }
    }
    
    // MARK: - (init(_:))

    init(_ passage: Passage) {
        self.passage = passage
        self.beforeText = passage.beforeCue
        self.goalText = passage.goal
        self.afterText = passage.afterCue
        self.referenceText = passage.notes
    }
    
    
    
//
    @Environment(\.modelContext) private var modelContext
    
    // MARK: - (state properties)
    
    // todo may not even need/want bindable
    // we pass in passage, and then it gets edited but with temp vars
    // if usre taps done/update, then we update/replace
    // that should work for passage.before/after/ref. goalText is trickier
    // Will have to do a calc in Passage to compare old and new goalText, or really old and new Paragraphs. Old ones keep interval data.
    @Bindable var passage: Passage

    // (Goal) The user can discard text edits.
    // (Note) We could use SwiftData's rollback(), or (https://www.hackingwithswift.com/quick-start/swiftdata/how-to-discard-changes-to-a-swiftdata-object).
    // But this seems KISS. Also, don't like how "live editing" makes the Know badge recalculate on every keystroke.
    
    
    @State private var beforeText: String
    @State private var goalText: String
    @State private var afterText: String
    @State private var referenceText: String
    // todo rename
}

// MARK: - (preview)
#Preview {
    let passage = Passage()
    TextDetail(passage)
}
