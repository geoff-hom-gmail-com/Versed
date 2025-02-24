import SwiftUI
import SwiftData

// MARK: - (TextDetail)
struct TextDetail: View {
// (goal) (user can see a text) (she can access stats) (she can access editing)
    // MARK: - (body)
    var body: some View {
        Form {
            TextSection(type: .beforeCue, text: passage.beforeCue)
            goalBeatsSection
            TextSection(type: .afterCue, text: passage.afterCue)
            TextSection(type: .notes, text: passage.notes)
            // (note) (was trying to use TextField) (to match EditTextView)
            // (didn't work) (keeping notes in case) (Xcode 16.1)
            // - (disabling TextField or TextEditor disables scrolling)
            // - (constant binding on TextField still allows text to be entered, just not saved) (though no newlines)
            // - (constant binding on TextEditor still shows cursor, and keyboard)
        }
        .toolbar {
            editButton
        }
        .onAppear {
            unNew()
        }
        .scrollDismissesKeyboard(.immediately)
        .fullScreenCover(isPresented: $isShowingSheet, onDismiss: didDismiss) {
        // (note) (slides up) (Xcode 16.1) (vs Contacts app is instant)
        // (someday, Apple will have an easy option to appear instantly)
            EditTextView(passage)
        }
    }

    // MARK: - (views) (goalBeatsSection)
    
    @ViewBuilder
    private var goalBeatsSection: some View {
    // (goal) (user can see goal) (she can see intervals)
        Section(
            header: SectionHeader(
                image: Image(systemName: AppConstant.SFSymbol.goalText),
                label: AppConstant.Label.goalBeats,
                infoText: AppConstant.Info.goalBeats)
        ) {
            ScrollView {
                goalBeatsText
            }
            .frame(maxHeight: AppConstant.LineLimit.textLineX11_5MaxHeight)
            // (goal) (if the text is long enough to scroll, user knows that)
            
            Toggle(isOn: $showIntervals) {
                HStack {
                    Text(AppConstant.Label.showIntervals)
                    // TODO: - (prepend sf symbol for intervals?)

                    InfoButton(popoverText: AppConstant.Info.showIntervals)
                }
            }
            
            Button(AppConstant.Label.editIntervals) {
                // TODO: - (implement)
                // (also TODO let the user easily update the stats manually) (e.g., bring new paras up to neighboring paras)
            }
        }
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
    
    // MARK: - (views) (goalBeatsText)
    
    @ViewBuilder
    private var goalBeatsText: some View {
    // (goal) (user can see goal) (option: and intervals)
        let text = showIntervals ? passage.goalWithIntervals : passage.goal
        Text(text)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    // MARK: - (non-views) (unNew())
    
    private func unNew() {
    // (goal) (user sees text as "New," until seen once)
        if passage.isNew {
            passage.isNew.toggle()
            DataManager.save(modelContext)
        }
    }
    
    // MARK: - (non-views) (didDismiss())
    
    private func didDismiss() {
    // (goal) (if user deleted the text) (she sees texts list)
        let savedPassage = passages.first { passage.id == $0.id }
        if savedPassage == nil {
            dismiss()
        }
    }
    
    @Query
    private var passages: [Passage]
    
    // MARK: - (non-views) (properties)
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    private var passage: Passage
    
    @State private var showIntervals = false
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
