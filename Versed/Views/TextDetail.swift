import SwiftUI

// MARK: - (TextDetail)
struct TextDetail: View {
// (goal) (user can see a text) (she can access stats) (she can access editing)
    // MARK: - (body)
    var body: some View {
        Form {
            TextFieldSection(.beforeCue, text: .constant(passage.beforeCue))
            TextFieldSection(.goalBeats, text: .constant(passage.goal))
            TextFieldSection(.afterCue, text: .constant(passage.afterCue))
            TextFieldSection(.notes, text: .constant(passage.notes))
        }
        .toolbar {
            editButton
        }
        .onAppear {
            unNew()
        }
        .scrollDismissesKeyboard(.immediately)
        .sheet(isPresented: $isShowingSheet) {
            // TODO: - add .sheet() to edit
        }
        // TODO: - (The user can view text, but to edit it, has to tap button.)
        // (ToDo) (Goal) The user knows that text here can't be edited. Need to open sheet for that.
        // (figure out how to have scrollable, non-editable text with limited height) (see ExampleDetail)
    }
    
    // MARK: - (views) (editButton)
    
    private var editButton: ToolbarItem<Void, some View> {
    // (goal) (dev can browse the calling body)
        ToolbarItem(placement: .confirmationAction) {
            Button(AppConstant.Label.edit) {
                isShowingSheet.toggle()
            }
        }
    }
    
    // MARK: - (non-views) (unNew())
    
    private func unNew() {
    // (goal) (user sees text as "New," until seen once)
        if passage.isNew {
            passage.isNew.toggle()
            DataManager.save(modelContext)
        }
    }
    
    @Environment(\.modelContext) private var modelContext
    
    // MARK: - (non-views) (properties)
    
    private var passage: Passage
    
    @State private var isShowingSheet = false
    
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
