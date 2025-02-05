import SwiftUI
import SwiftData

// (Goal) The user can add text to know.
// (Goal) The user adds everything from her reference now. (e.g., Bible app) Then, she can focus on our app. (e.g., stanzas)
struct AddView: View {
    // MARK: - body

    var body: some View {
        // (Note) NavigationStack used so the dev can easily have buttons to save/reset.
        NavigationStack {
            Form {
                // BeforeTextFieldSection($beforeText)
                // AfterTextFieldSection($afterText)
                // ReferenceTextFieldSection($beforeText)
                
                // TextFieldSection.for(.before, text: $beforeText)
                
                // TextFieldSection.for(.before)
                // TextFieldSection.for(.after)
                // TextFieldSection.for(.reference)
                
                // Before.
                TextFieldSection(
                    headerImage: Image(systemName: AppConstant.SFSymbol.before),
                    headerLabel: AppConstant.Label.before,
                    infoText: AppConstant.Info.before,
                    textFieldLabel: AppConstant.Label.before,
                    textFieldText: $beforeText,
                    textFieldPrompt: AppConstant.Prompt.before,
                    textFieldLineLimit: AppConstant.LineLimit.before...AppConstant.LineLimit.max
                )
                
                // Goal.
                TextFieldSection(
                    // (Goal) The user thinks, "I start here, with my goal. I can copy my text from another app into here."
                    headerImage: Image(systemName: AppConstant.SFSymbol.goalText),
                    infoText: AppConstant.Info.goal,
                    
                    textFieldLabel: AppConstant.Label.goal,
                    textFieldText: $goalText,
                    textFieldPrompt: AppConstant.Prompt.goal,
                    textFieldLineLimit: AppConstant.LineLimit.goal...AppConstant.LineLimit.max
                )
                
                // After.
                TextFieldSection(
                    headerImage: Image(systemName: AppConstant.SFSymbol.after),
                    headerLabel: AppConstant.Label.after,
                    infoText: AppConstant.Info.after,
                    textFieldLabel: AppConstant.Label.after,
                    textFieldText: $afterText,
                    textFieldPrompt: AppConstant.Prompt.after,
                    textFieldLineLimit: AppConstant.LineLimit.after...AppConstant.LineLimit.max
                )
                
                // Reference.
                TextFieldSection(
                    headerImage: Image(systemName: AppConstant.SFSymbol.reference),
                    headerLabel: AppConstant.Label.reference,
                    textFieldLabel: AppConstant.Label.reference,
                    textFieldText: $referenceText,
                    textFieldPrompt: AppConstant.Prompt.reference,
                    textFieldLineLimit: AppConstant.LineLimit.reference...AppConstant.LineLimit.max
                )
            }
            .scrollDismissesKeyboard(.immediately)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(AppConstant.Label.reset) {
                        reset()
                    }
                    .disabled(isNoText)
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(AppConstant.Label.done) {
                        var newIndex = 0
                        if let maxIndex = userTextsOrderReversed.first?.index {
                            newIndex = maxIndex + 1
                        }
                        
                        let passage = Passage(index: newIndex, before: beforeText, goal: goalText, after: afterText, reference: referenceText)
                        modelContext.insert(passage)
                        
                        // (Note) Not sure if needed on device. But, in Xcode preview, helps.
                        do {
                            try modelContext.save()
                        } catch {
                            print("Failed to save: \(error)")
                        }
                        
                        // (ToDo) how to add badge to tabview from here? asked chatG (state, not event)
                        
                        reset()
                        // (toDo) after adding/saving, user gets feedback. (a badge on Texts ("!", "new" etc)  It depends, too. Usually, the text needs work like beats. But it's possible it's perfectly fine. In which case it's more like it's new and the user just has to okay it in Texts.
                    }
                    .disabled(isNoText)
                }
            }
        }
    }
    
    @State private var beforeText: String = ""
    @State private var goalText: String = ""
    @State private var afterText: String = ""
    @State private var referenceText: String = ""
    
    // (Note) Why not [String]? Won't work in reset().
    private var inputTexts: [Binding<String>] {
        [$beforeText, $goalText, $afterText, $referenceText]
    }
    
    // (Goal) Buttons are disabled, if no text.
    private var isNoText: Bool {
        inputTexts.allSatisfy { $0.wrappedValue.isEmpty }
    }
    
    @Environment(\.modelContext) private var modelContext

    // (Goal) The app can calculate the index for new texts.
    @Query(filter: #Predicate<Passage> { $0.isExample == false },
           sort: \.index, order: .reverse)
    var userTextsOrderReversed: [Passage]

    
    // (Goal) The user sees the view reset.
    // (Note) Was worried about this being too abrupt. But seems okay.
    private func reset() {
        inputTexts.forEach { $0.wrappedValue = "" }
    }
}

// MARK: - preview

#Preview {
    AddView()
}
