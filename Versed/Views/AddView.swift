import SwiftUI

// (Goal) The user can add text to know.
struct AddView: View {
    @State private var fullText: String = ""
    
    //    @Environment(Verses.self) private var verses
    
    var body: some View {
        NavigationStack {
            //        let _ = Self._printChanges()
            
            // (Note) Why use TextField vs TextEditor? (ToDo) for now, we like the rounded rectangles of TF. TF also has built-in placeholder. hopefully will still work pasting multi-paragraph text.
            // (todo) (this looks similar UI to Encode verseDetail) (even the prompts might be similar) (I guess Encode focuses on beats/stanzas, so that prompt would be different)
            Form {
                Section() {
                    // (Goal) The user sees a multiline text field. She knows she can enter more than just the prompt.
                    // (Note) (axis: and .lineLimit() both needed for that appearance.
                    TextField("Before",
                              text: $fullText,
                              prompt: Text(AppString.Prompt.before),
                              axis: .vertical)
                    .lineLimit(3...)
                } header: {
                    HStack {
                        Text("\(Image(systemName: AppString.SFSymbol.before)) Before")
                        Spacer()
                        InfoButton(popoverText: "Before your goal, some text. Used to cue.")
                    }
                    // (Goal) The user isn't turned off by ALL CAPS in Form Section headings.
                    .textCase(nil)
                }
                
                Section() {
                    TextField("Goal",
                              text: $fullText,
                              prompt: Text(AppString.Prompt.goal),
                              axis: .vertical)
                    .lineLimit(6...)
                } header: {
                    // (Goal) The user thinks, "I start here, with what I want to learn. I enter it myself. Or, paste from another app."
                    HStack {
                        Text(AppString.Emoji.soccerBall)
                        Image(systemName: AppString.SFSymbol.arrow)
                        Text(AppString.Emoji.goalNet)
                        Spacer()
                        InfoButton(popoverText: "Your goal text.")
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
                        Image(systemName: AppString.SFSymbol.after)
                        Text(AppString.Label.after)
                        Spacer()
                        InfoButton(popoverText: "After your goal, some text. Used to cue.")
                    }
                    .textCase(nil)
                }
                
                Section() {
                    TextField("",
                              text: $fullText,
                              prompt: Text(AppString.Prompt.reference),
                              axis: .vertical)
                    .lineLimit(2...)
                } header: {
                    HStack {
                        Image(systemName: "text.book.closed.fill")
                        Text("Reference / notes")
                    }
                    .textCase(nil)
                }
                
                
                //            Button("Done") {
                //                verses.myVerses.append(
                //                    Verse(fullText))
                //            }
            }
            .scrollDismissesKeyboard(.immediately)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Reset") {
                        
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        
                    }
                    // (Todo) (done disabled until … in theory, one can edit it later, so … disable until goal text entered at least?)
                    .disabled(true)
                }
            }
            
            // (toDo) after adding/saving, should have some feedback so user knows. Like, a badge on Encode ("!", "new" etc) Then after confirming, reset the textfield.
            
            
        }
    }
}

#Preview {
    AddView()
}
