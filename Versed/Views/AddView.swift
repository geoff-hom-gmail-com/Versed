import SwiftUI

// (Goal) The user can add text to know.
struct AddView: View {
    @State private var fullText: String = ""
    
    //    @Environment(Verses.self) private var verses
    
    var body: some View {
        NavigationStack {
            //        let _ = Self._printChanges()
            
            // (Note) Why use TextField vs TextEditor? (ToDo) for now, we like the rounded rectangles of TF. TF also has built-in placeholder. hopefully will still work pasting multi-paragraph text.
            
            // (todo) (this view is similar UI to Encode verseDetail) (even the prompts might be similar) (I guess Encode focuses on beats/stanzas, so that prompt would be different) (DRY)
            Form {
                Section() {
                    // (Goal) The user sees a multiline text field. She knows she can enter more than just the prompt.
                    // (Note) (axis: and .lineLimit() both needed for that appearance.
                    TextField(AppString.Label.before,
                              text: $fullText,
                              prompt: Text(AppString.Prompt.before),
                              axis: .vertical)
                    .lineLimit(3...)
                } header: {
                    HStack {
                        // (Goal) The user sees the symbol just one space from its label. (HStack spacing is wider.)
                        Text(Image(systemName: AppString.SFSymbol.before))
                            + Text(" \(AppString.Label.before)")
                        Spacer()
                        InfoButton(popoverText: AppString.Info.before)
                    }
                    // (Goal) The user isn't turned off by ALL CAPS in Form Section headings.
                    .textCase(nil)
                }
                
                Section() {
                    TextField(AppString.Label.goal,
                              text: $fullText,
                              prompt: Text(AppString.Prompt.goal),
                              axis: .vertical)
                    .lineLimit(6...)
                } header: {
                    // (Goal) The user thinks, "I start here, with what I want to learn. I enter it myself. Or, paste from another app."
                    HStack {
                        Text(AppString.Emoji.soccerBall)
                            + Text(" \(Image(systemName: AppString.SFSymbol.arrow))")
                            + Text(" \(AppString.Emoji.goalNet)")
                        Spacer()
                        InfoButton(popoverText: AppString.Info.goal)
                    }
                    .textCase(nil)
                }
                
                Section() {
                    TextField(AppString.Label.after,
                              text: $fullText,
                              prompt: Text(AppString.Prompt.after),
                              axis: .vertical)
                    .lineLimit(3...)
                } header: {
                    HStack {
                        Text(Image(systemName: AppString.SFSymbol.after))
                            + Text(" \(AppString.Label.after)")
                        Spacer()
                        InfoButton(popoverText: AppString.Info.after)
                    }
                    .textCase(nil)
                }
                
                Section() {
                    TextField(AppString.Label.reference,
                              text: $fullText,
                              prompt: Text(AppString.Prompt.reference),
                              axis: .vertical)
                    .lineLimit(2...)
                } header: {
                    HStack {
                        Text(Image(systemName: AppString.SFSymbol.reference))
                            + Text(" \(AppString.Label.reference)")
                    }
                    .textCase(nil)
                }
            }
            .scrollDismissesKeyboard(.immediately)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(AppString.Label.reset) {
                        // (todo) (reset disabled while all texts empty?)
                    }
                    .disabled(true)
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(AppString.Label.done) {
                        //                verses.myVerses.append(
                        //                    Verse(fullText))

                        // (toDo) after adding/saving, user gets feedback. (a badge on Encode ("!", "new" etc) Then after confirming, reset the textfield. It depends, too. Usually, the text needs work like beats. But it's possible it's perfectly fine. In which case it's more like it's new and the user just has to okay it in Encode.
                    }
                    // (Todo) (done disabled until … in theory, one can edit it later, so … disable until goal text entered at least?)
                    .disabled(true)
                }
            }
        }
    }
}

#Preview {
    AddView()
}
