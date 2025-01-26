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
    
    var body: some View {
        NavigationStack {
            //        let _ = Self._printChanges()
            
            // (Note) Why use TextField vs TextEditor? (ToDo) for now, we like the rounded rectangles of TF. TF also has built-in placeholder. hopefully will still work pasting multi-paragraph text.
            
            // (todo) (this view is similar UI to Encode verseDetail) (even the prompts might be similar) (I guess Encode focuses on beats/stanzas, so that prompt would be different) (DRY)
            Form {
                Section() {
                    TextField(AppConstant.Label.before,
                              text: $beforeText,
                              prompt: Text(AppConstant.Prompt.before),
                              
                              // (Note) (axis: needed for multiline lineLimit().
                              axis: .vertical)
                    .lineLimit(AppConstant.LineLimit.before...)
                } header: {
                    HStack {
                        // (Goal) The user sees the symbol just one space from its label. (HStack spacing is wider.)
                        Text(Image(systemName: AppConstant.SFSymbol.before))
                            + Text(" \(AppConstant.Label.before)")
                        Spacer()
                        InfoButton(popoverText: AppConstant.Info.before)
                    }
                    // (Goal) The user isn't turned off by ALL CAPS in Form Section headings.
                    .textCase(nil)
                }
                
                Section() {
                    TextField(AppConstant.Label.goal,
                              text: $goalText,
                              prompt: Text(AppConstant.Prompt.goal),
                              axis: .vertical)
                    .lineLimit(AppConstant.LineLimit.goal...)
                } header: {
                    // (Goal) The user thinks, "I start here, with what I want to learn. I enter it myself. Or, paste from another app."
                    HStack {
                        Image(systemName: AppConstant.SFSymbol.goalText)
                        Spacer()
                        InfoButton(popoverText: AppConstant.Info.goal)
                    }
                    .textCase(nil)
                }
                
                Section() {
                    TextField(AppConstant.Label.after,
                              text: $afterText,
                              prompt: Text(AppConstant.Prompt.after),
                              axis: .vertical)
                    .lineLimit(AppConstant.LineLimit.after...)
                } header: {
                    HStack {
                        Text(Image(systemName: AppConstant.SFSymbol.after))
                            + Text(" \(AppConstant.Label.after)")
                        Spacer()
                        InfoButton(popoverText: AppConstant.Info.after)
                    }
                    .textCase(nil)
                }
                
                Section() {
                    TextField(AppConstant.Label.reference,
                              text: $referenceText,
                              prompt: Text(AppConstant.Prompt.reference),
                              axis: .vertical)
                    .lineLimit(AppConstant.LineLimit.reference...)
                } header: {
                    HStack {
                        Text(Image(systemName: AppConstant.SFSymbol.reference))
                            + Text(" \(AppConstant.Label.reference)")
                    }
                    .textCase(nil)
                }
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
