import SwiftUI

// MARK: - (EditTextView)
struct EditTextView: View {
// (goal) (user can edit the given text)
    // MARK: - (body)
    var body: some View {
        NavigationStack {
        // (goal) (user has toolbar buttons)
            Form {
                TextFieldSection(type: .beforeCue, text: $beforeCue)
                TextFieldSection(type: .goalBeats, text: $goal)
                TextFieldSection(type: .afterCue, text: $afterCue)
                TextFieldSection(type: .notes, text: $notes)
                deleteButton
            }
            .navigationTitle(AppConstant.Label.editText)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                cancelButton
                doneButton
            }
            .scrollDismissesKeyboard(.immediately)
        }
    }
    
    // MARK: - (views) (deleteButton)
    
    private var deleteButton: some View {
    // (goal) (user can delete this text)
        Button(AppConstant.Label.deleteText, role: .destructive) {
            isShowingDeleteConfirmation.toggle()
        }
        .confirmationDialog(AppConstant.Label.deleteText, isPresented: $isShowingDeleteConfirmation) {
            Button(AppConstant.Label.deleteText, role: .destructive) {
                modelContext.delete(passage)
                dismiss()
            }
        }
    }
        
    // MARK: - (views) (toolbar buttons)
    
    private var cancelButton: ToolbarItem<Void, some View> {
    // (goal) (dev can browse the calling body)
    // (goal) (user can discard edits)
        ToolbarItem(placement: .cancellationAction) {
            Button(AppConstant.Label.cancel, role: .cancel) {
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
            }
//            .disabled(ifNoChanges)
            // TODO: - (if no changes, disable) (Contacts does this)
            // (note) (this does provide an easy way to refresh Know badge)
            // (since a text can be updated without any real changes)
        }
    }
    
    // MARK: - (non-views)

    private func updateText() {
        passage.beforeCue = beforeCue
        if passage.goal != goal {
        // (note) (currently) (updateParagraphs(_:) deletes all prior paragraphs and makes new ones)
        // (later version may be smarter and replace only changed paras)
        // (then we wouldn't need this check)
            passage.goal = goal
            passage.updateParagraphs(modelContext)
        }
        passage.afterCue = afterCue
        passage.notes = notes
    }
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    private var passage: Passage

    @State private var isShowingDeleteConfirmation = false

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
