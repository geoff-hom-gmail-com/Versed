import SwiftUI

// (Goal) The user can add text to learn.
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
                    // if we have labels, they should be what's most often. So not "end" or "how does Mark start?" but actual verses before and after. What's a good example? vine?
                } header: {
                    //
                    HStack {
                        Image(systemName: AppString.SFSymbol.before)
//                        Text("Before")
//                        // (Goal) The user isn't turned off by ALL CAPS in Form Section headings.
//                            .textCase(nil)
                        InfoButton(popoverText: "How to make textCase nil?")
                    }
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
                        Text("Goal").textCase(nil)
                        InfoButton(popoverText: "How to make textCase nil?")
                        //                    Spacer()
                    }
                }
                
                Section() {
                    TextField(AppString.Label.after,
                              text: $fullText,
                              prompt: Text(AppString.Prompt.after),
                              axis: .vertical)
                    .lineLimit(3...)
                } header: {
                    Image(systemName: AppString.SFSymbol.after)
//                    Text(AppString.Label.after).textCase(nil)
                }
                
                Section() {
                    TextField("",
                              text: $fullText,
                              prompt: Text(AppString.Prompt.reference),
                              axis: .vertical)
                    .lineLimit(2...)
                } header: {
                    Text("Reference / Notes").textCase(nil)
                }
                
                // (Todo) (done disabled until all 3 entered?) (though in theory, one can edit it later, so … disable until Text entered at least?)
                
                
                //            Text("Add a verse")
                //            Text("Enter text to remember:")
                //            TextField("The Kingdom of God is like …",
                //                      text: $fullText, axis: .vertical)
                //                .lineLimit(3...)
                //            Button("Done") {
                ////                verses.myVerses.append(
                ////                    Verse(fullText))
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
                    .disabled(true)
                }
            }
            
            // after adding, should have some feedback so user knows. Like, a pop-up to confirm. Or the badge on Encode ("!", "new" etc) Then after confirming, reset the textfield.
            
            
        }
    }
}

#Preview {
    AddView()
}
