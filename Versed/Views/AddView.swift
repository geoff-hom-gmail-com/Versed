import SwiftUI

struct AddView: View {
    @State private var fullText: String = ""

//    @Environment(Verses.self) private var verses

    var body: some View {
//        let _ = Self._printChanges()

        // (Note) Why use TextField vs TextEditor? (ToDo) for now, we like the rounded rectangles of TF. TF also has built-in placeholder. hopefully will still work pasting multi-paragraph text.
        
        Form {
            
            Section("Before") {
                // (Goal) The user sees a multiline text field. She knows she can enter more than just a line.
                // (Note) (axis: and .lineLimit() both needed for that appearance.
                TextField("", text: $fullText, axis: .vertical)
                    .lineLimit(3...)
                // if we have labels, they should be what's most often. So not "end" or "how does Mark start?" but actual verses before and after. What's a good example? vine?
            }
            
            Section() {
                TextField("", text: $fullText, axis: .vertical)
                    .lineLimit(3...)
            } header: {
                HStack {
                    Text("Text")
//                    HelpButton(popoverText: "What are prompt/clarifier? Etc. Answer here.")
//                    Spacer()
                }
            }
            
            Section() {
                TextField("", text: $fullText, axis: .vertical)
                    .lineLimit(3...)
            } header: {
                Text("After")
            }
            
            Section() {
                TextField("", text: $fullText, axis: .vertical)
                    .lineLimit(3...)
            } header: {
                Text("Reference / Notes")
            }
            
            // (Todo) (done disabled until all 3 entered?) (though in theory, one can edit it later, so … disable until Text entered at least?)
            

            //            Text("Add a verse")
//            Text("Enter text to remember:")
//            TextField("The Kingdom of God is like …", 
//                      text: $fullText, axis: .vertical)
//                .lineLimit(3...)
            Button("Done") {
//                verses.myVerses.append(
//                    Verse(fullText))
            }
        }
        .scrollDismissesKeyboard(.immediately)
        
        // after adding, should have some feedback so user knows. Like, a pop-up to confirm. Then after confirming, reset the textfield. 
        
        // how hard to rig the button so that when done it will trigger/increase the encode badge? probably should just code it to add it lol
        // also need a way to delete texts/verses. I guess that's the Encode list. though if doing similar texts, one might want to copy/dup a text in the add tab. 
        // yeah, would make sense to be able to see a list of texts in AddView, especially like an Example, then select Duplicate or Add Text from
        // for non-examples, it would be like Duplicate. Hmm; maybe wait until MVP. though will def need Delete verse function by then.
    }
}

#Preview {
    AddView()
}
