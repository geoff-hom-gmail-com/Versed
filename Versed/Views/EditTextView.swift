import SwiftUI

// MARK: - (EditTextView)
struct EditTextView: View {
// (goal) (user can edit the given text)
    // MARK: - (body)
    var body: some View {
        NavigationStack {
        // (goal) (user has button to cancel)
            Form {
                TextFieldSection(.beforeCue, text: $beforeCue)
                TextFieldSection(.goalBeats, text: $goal)
                TextFieldSection(.afterCue, text: $afterCue)
                TextFieldSection(.notes, text: $notes)
                
                // TODO: - (user can delete text)
                // (e.g. Contacts UI) (red button at bottom, with an alert)
            }
            .toolbar {
                cancelButton
                doneButton
            }
            .scrollDismissesKeyboard(.immediately)
        }
    }
    
    // MARK: - (views) (toolbar buttons)
    
    private var cancelButton: ToolbarItem<Void, some View> {
        // (goal) (dev can browse the calling body)
        // (goal) (user can discard text edits)
        ToolbarItem(placement: .cancellationAction) {
            Button(AppConstant.Label.cancel) {
                dismiss()
                // (note) (could use SwiftData's rollback())
                // (or https://www.hackingwithswift.com/quick-start/swiftdata/how-to-discard-changes-to-a-swiftdata-object)
                // (but this seems KISS. Also, don't like how "live editing" makes the Know badge recalculate on every keystroke)
            }
        }
    }

    private var doneButton: ToolbarItem<Void, some View> {
    // (goal) (dev can browse the calling body)
        ToolbarItem(placement: .confirmationAction) {
            Button(AppConstant.Label.done) {
                updateText()
                dismiss()
//                reset()??
            }
//            .disabled(ifNoChanges)
            // TODO: - (if no changes, disable) (Contacts does this)
        }
    }
    
    
    
    // MARK: - (non-views)

    private func updateText() {
        passage.beforeCue = beforeCue
        if passage.goal != goal {
            passage.goal = goal
            passage.updateParagraphs(modelContext)
        }
        passage.afterCue = afterCue
        passage.notes = notes
    }
    
    @Environment(\.dismiss) private var dismiss

    @Environment(\.modelContext) private var modelContext
    
    // MARK: - (state properties)
    
    // todo may not even need/want bindable
    // we pass in passage, and then it gets edited but with temp vars
    // if usre taps done/update, then we update/replace
    // that should work for passage.before/after/ref. goalText is trickier
    // Will have to do a calc in Passage to compare old and new goalText, or really old and new Paragraphs. Old ones keep interval data.
    @Bindable var passage: Passage

    
    
    @State private var beforeCue: String
    @State private var goal: String
    @State private var afterCue: String
    @State private var notes: String
    
    // MARK: - (init(_:))
    init(_ passage: Passage) {
        self.passage = passage
        self.beforeCue = passage.beforeCue
        self.goal = passage.goal
        self.afterCue = passage.afterCue
        self.notes = passage.notes
    }
}

// MARK: - (preview)
#Preview {
    let passage = Passage()
    EditTextView(passage)
}
