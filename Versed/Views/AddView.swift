import SwiftUI

// (Goal) The user can add text to know.
// (Goal) The user adds everything from her reference now. (e.g., Bible app) Then, she can focus on our app. (e.g., stanzas)
struct AddView: View {
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
    
    //    @Environment(Verses.self) private var verses
    //    @Environment(??Verses.self) private var verses

    var body: some View {
        NavigationStack {
            Form {
                TextFieldSection(
                    headerImage: Image(systemName: AppConstant.SFSymbol.before),
                    headerLabel: AppConstant.Label.before,
                    infoText: AppConstant.Info.before,
                    textFieldLabel: AppConstant.Label.before,
                    textFieldText: $beforeText,
                    textFieldPrompt: AppConstant.Prompt.before,
                    textFieldLineLimit: AppConstant.LineLimit.before...AppConstant.LineLimit.max
                )
                
                TextFieldSection(
                    // (Goal) The user thinks, "I start here, with my goal. I can copy my text from another app into here."
                    headerImage: Image(systemName: AppConstant.SFSymbol.goalText),
                    infoText: AppConstant.Info.goal,
                    
                    textFieldLabel: AppConstant.Label.goal,
                    textFieldText: $goalText,
                    textFieldPrompt: AppConstant.Prompt.goal,
                    textFieldLineLimit: AppConstant.LineLimit.goal...AppConstant.LineLimit.max
                )
                
                TextFieldSection(
                    headerImage: Image(systemName: AppConstant.SFSymbol.after),
                    headerLabel: AppConstant.Label.after,
                    infoText: AppConstant.Info.after,
                    textFieldLabel: AppConstant.Label.after,
                    textFieldText: $afterText,
                    textFieldPrompt: AppConstant.Prompt.after,
                    textFieldLineLimit: AppConstant.LineLimit.after...AppConstant.LineLimit.max
                )
                
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
                        //                verses.myVerses.append(
                        //                    Verse(fullText))

                        // (toDo) after adding/saving, user gets feedback. (a badge on Encode ("!", "new" etc) Then after confirming, reset the textfield. It depends, too. Usually, the text needs work like beats. But it's possible it's perfectly fine. In which case it's more like it's new and the user just has to okay it in Encode.
                    }
                    // (Todo) (done disabled until … in theory, one can edit it later, so … disable until goal text entered at least?)
                    .disabled(isNoText)
                }
            }
        }
    }
    
    // (Goal) The user sees the view reset.
    // (Note) Was worried about this being too abrupt. But seems okay.
    private func reset() {
        inputTexts.forEach { $0.wrappedValue = "" }
    }
}

#Preview {
    AddView()
}
