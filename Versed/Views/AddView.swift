import SwiftUI
import SwiftData

// (Goal) The user can add text to know.
// (Goal) The user adds everything from her reference now. (e.g., Bible app) Then, she can focus on our app. (e.g., stanzas)
struct AddView: View {
    // MARK: - (body)
    var body: some View {
        // (Note) NavigationStack used so the dev can easily have buttons to save/reset.
        NavigationStack {
            Form {
                TextFieldSection(for: .before, text: $beforeText)
                TextFieldSection(for: .goal, text: $goalText)
                TextFieldSection(for: .after, text: $afterText)
                TextFieldSection(for: .reference, text: $referenceText)
            }
            .scrollDismissesKeyboard(.immediately)
            .toolbar {
                // TODO: - make more browsable?
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
                                                
                        reset()
                        // (toDo) after adding/saving, user gets feedback. (a badge on Texts ("!", "new" etc)  It depends, too. Usually, the text needs work like beats. But it's possible it's perfectly fine. In which case it's more like it's new and the user just has to okay it in Texts.
                    }
                    .disabled(isNoText)
                }
            }
        }
    }
    
    // MARK: - (parameters?)
    // TODO: - tidy marks below

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

// MARK: - (preview)
#Preview {
    AddView()
}
