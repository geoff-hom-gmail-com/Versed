import SwiftUI

// MARK: - (TextDetail)
struct TextDetail: View {
// (goal) (user can see a text) (she can access stats) (she can access editing)
    // MARK: - (body)
    var body: some View {
        Form {
            TextFieldSection(.beforeCue, text: .constant(passage.beforeText))
            TextFieldSection(.goalBeats, text: .constant(passage.goalText))
            TextFieldSection(.afterCue, text: .constant(passage.afterText))
            TextFieldSection(.notes, text: .constant(passage.referenceText))
        }
        .toolbar {
            editButton
        }
        .onAppear {
            unNew()
        }
        // TODO: - add .sheet() to edit
        // TODO: - (The user can view text, but to edit it, has to tap button.)
        // (ToDo) (Goal) The user knows that text here can't be edited. Need to open sheet for that.
        // (figure out how to have scrollable, non-editable text with limited height) (see ExampleDetail)
    }
    
    // MARK: - (properties)
    
    private var passage: Passage

    @State private var isShowingSheet = false

    // MARK: - (editButton)
    
    private var editButton: ToolbarItem<Void, some View> {
        ToolbarItem(placement: .confirmationAction) {
            Button(AppConstant.Label.edit) {
                isShowingSheet.toggle()
            }
        }
    }
    
    // MARK: - (unNew())
    
    private func unNew() {
    // (goal) (user sees text as "New," until seen once)
        if passage.isNew {
            passage.isNew.toggle()
            save()
        }
    }

    private func save() {
    // (note) (unsure if needed on device. But, in Xcode preview, helps?)
        do {
            try modelContext.save()
        } catch {
            print("Failed to save: \(error)")
        }
    }
    
    @Environment(\.modelContext) private var modelContext
    
    // MARK: - (init(_:))
    init(_ passage: Passage) {
        self.passage = passage
    }
}

// MARK: - (preview)
#Preview {
    let passage = Passage()
    TextDetail(passage)
}
