import SwiftUI
import SwiftData

// MARK: - (AddView)
struct AddView: View {
// (goal) (user can add text to know)
// (goal) (user adds everything from her reference now) (e.g., Bible app) (then, she can focus on our app) (e.g., beats, paragraphs)
    // MARK: - (body)
    var body: some View {
        NavigationStack {
        // (goal) (dev has buttons to reset/save)
            Form {
                TextFieldSection(.beforeCue, text: $beforeCue)
                TextFieldSection(.goal, text: $goal)
                TextFieldSection(.afterCue, text: $afterCue)
                TextFieldSection(.notes, text: $notes)
            }
            .toolbar {
                resetButton
                doneButton
            }
            .scrollDismissesKeyboard(.immediately)
        }
    }
    
    // MARK: - (text properties)
    @State private var beforeCue: String = ""
    @State private var goal: String = ""
    @State private var afterCue: String = ""
    @State private var notes: String = ""

    // MARK: - (buttons)
    
    private var resetButton: ToolbarItem<Void, some View> {
    // (goal) (dev can browse the calling body)
        ToolbarItem(placement: .cancellationAction) {
            Button(AppConstant.Label.reset) {
                reset()
            }
            .disabled(isNoText)
        }
    }
    
    private var doneButton: ToolbarItem<Void, some View> {
    // (goal) (dev can browse the calling body)
        ToolbarItem(placement: .confirmationAction) {
            Button(AppConstant.Label.done) {
                addText()
                reset()
            }
            .disabled(isNoText)
        }
    }
    
    // MARK: - (misc)

    private func addText() {
        var newIndex = 0
        if let maxIndex = textsOrderReversed.first?.index {
            newIndex = maxIndex + 1
        }
        // (goal) (the text has the correct index)
        
        let passage = Passage(index: newIndex, beforeCue: beforeCue, goal: goal,
                              afterCue: afterCue, notes: notes)
        modelContext.insert(passage)
        DataManager.save(modelContext)
    }
    
    private func reset() {
    // (goal) (user sees the view reset)
        inputTexts.forEach { $0.wrappedValue = "" }
    }
    
    private var isNoText: Bool {
    // (goal) (when are buttons disabled?) (if no text)
        inputTexts.allSatisfy { $0.wrappedValue.isEmpty }
    }
    
    @Query(sort: \Passage.index, order: .reverse)
    private var textsOrderReversed: [Passage]
    
    @Environment(\.modelContext) private var modelContext
    
    private var inputTexts: [Binding<String>] {
    // (note) (why not [String]?) (doesn't work in reset())
        [$beforeCue, $goal, $afterCue, $notes]
    }
}

// MARK: - (preview)
#Preview {
    AddView()
}
