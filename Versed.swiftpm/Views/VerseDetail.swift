import SwiftUI

// (Goal) The user can edit any aspect of the given verse.
// (ToDo) (Goal) The user knows that examples can't be edited. And she can't edit them. 
// (ToDo) How do I want this to look? Start top-down with Recite and work backwards. But remember that even an expert will start by adding a verse, then encoding it. 
// Use more SF symbols? Again, start top-down.
struct VerseDetail: View {    
    @Bindable var verse: Verse
    
    @State private var isClueExpanded: Bool = false
        
    var body: some View {
//        Text("VerseDetail")
        // In a List, the disclosure triangles work with Section(isExpanded:). But with Form, they don't seem to. Even with header empty.
        // DisclosureGroup works. Not sure the UI is ideal. Consider Post-MVP.
        Form {
            // where do we put navbar title? try with Text; later, should be the prompt/rowTitle?
            
            
            // foreach prompt, show prompt

            Section() {
                // ToDo: figure out bindings here. $verse.prompts may be empty. A prompt may exist but not its clarifier. Similarly, $verse.clues may be empty, have 1, 2, 3, etc.
                // changing it up: if we display it, then it's not empty; eg if we display it, add it
                // If empty, we don't want constant binding; we want blank text that we can edit
                // we may not want a binding to the verse itself, but to a temp var; then on save, we can transfer
                // but for now we can do constants of it
                // very not DRY, nor editable
                // could also do private var computed like promptBinding or binding(for:)
                // can handle nil case via first or can check if array is empty; hmm
//                if let prompt = verse.prompts.first {
////                    TextField("Prompt", text: $verse.prompts.first!.text)
//                    
//                    // error cannot find $prompt in scope
////                    TextField("hmm", text: $prompt.text)
//                    // this won't crash because we checked if let = .first; but it's annoying we're repeating prompts call
//                    TextField("hmm", text: $verse.prompts[0].text)
//                    
//                    TextField("Prompt", text: .constant(prompt.text))
//                    // todo display properly; if empty clarifier, should show (Clarifier) (currently shows ())
//                    TextField("(Clarifier)", text: .constant( "(\(prompt.clarifier))" ))
//                            .padding(.leading)
//                }
                ForEach($verse.prompts) { $prompt in
                    TextField("Prompt", text: $prompt.text)
                    // todo display properly; if empty clarifier, should show (Clarifier) (currently shows ())
                    TextField("(Clarifier)", text: $prompt.clarifier)
                        .padding(.leading)
                }
                 
                
//                TextField("Prompt", text: promptBinding)
//                TextField("Prompt", text: .constant(""))
//                TextField("(Clarifier)", text: .constant(""))
//                    .padding(.leading)                               
            } header: {
                HStack {
                    Text("Prompt (Clarifier)")
                    HelpButton(popoverText: "What are prompt/clarifier? Etc. Answer here.")
                    Spacer()
                }
            }
            
            // forEach clue, show clue section, numbered
            ForEach($verse.clues) { $clue in
                Section("Clue") {
                    TextField("Question", text: $clue.q)
                    TextField("Answer", text: $clue.a)
                        .padding(.leading)
                }
                
//                DisclosureGroup(isExpanded: $isClueExpanded) {
//                    TextField("Question", text: .constant(""))
//                    TextField("Answer", text: .constant(""))
//                        .padding(.leading)
//                } label: {
//                    Text("Clue X2")
//                }
                // OutlineGroup? maybe that will have a better UI and still work with isExpanded
                // also, we may want disclosure for each clue and all clues; and how do we do this programmatically for arbitrary number of clues? each needs separate binding Bool
                // and we want a help button for the first clue (or the entire clues section)
                
//                Section(isExpanded: $isClueExpanded) {
//                    TextField("Question", text: .constant(""))
//                    TextField("Answer", text: .constant(""))
//                        .padding(.leading)
//                } header: {
//                    Text("Clue X")
//                }
            }
            
            Section() {
                TextField("Question", text: .constant(""))
                TextField("Answer", text: .constant(""))
                    .padding(.leading)               
            } header: {
                HStack {
                    Text("Clue 1")
                    HelpButton(popoverText: "What are clues? Etc. Answer here.")
                    Spacer()
                }
            }
            
//            Section("Clue 2") {
//                TextField("Question", text: .constant(""))
//                TextField("Answer", text: .constant(""))
//                    .padding(.leading)               
//            }
//            
//            Section("Clue 3") {
//                TextField("Question", text: .constant(""))
//                TextField("Answer", text: .constant(""))
//                    .padding(.leading)               
//            }
//            
//            Section("Clue 4") {
//                TextField("Question", text: .constant(""))
//                TextField("Answer", text: .constant(""))
//                    .padding(.leading)               
//            } 
           
            Section() {
                // TextEditor might sound better at first. But I like having a minimum text size.
                // lineLimit() works differently here than in TextField. Here, the min doesn't seem to work.
                //                TextEditor(text: $verse.text)
                //                    .lineLimit(3...)
                
                TextField("", text: $verse.text, axis: .vertical)
                    .lineLimit(3...)
            } header: {
                HStack {
                    Text("Beats")
                    HelpButton(popoverText: "Divide text into memorable beats.")
                    Spacer()
                }
            }
            
            // May try something like this in the future. If we want a permanent label for the TextField. 
            // (Also see: https://mic.st/blog/labeled-textfield-in-swiftui/)
            // (and: https://stackoverflow.com/questions/58776561/add-label-to-swiftui-textfield)
//            LabeledContent() {
//                TextField("", text: .constant(""))
//                    .textFieldStyle(.roundedBorder)
//            } label: {
//                Text("Prompt")
//            }
//            LabeledContent() {
//                TextField("", text: .constant(""))
//                    .textFieldStyle(.roundedBorder)
//            } label: {
//                Text("Clarifier")
//            }
            
//            Button("Done") {
//                verses.myVerses.append(
//                    Verse(text: fullText))
//                //                Verse(text: "For God so loved …"))
//            }
        }
//        .listStyle(.sidebar)
//        .formStyle(.grouped)
    }
    
    // remminder: what if we just have empty prompts that the user can customize? No set prompts. Can start with 4. But would be very nice if user can add an arbitrary number of prompts. And choose which ones to have on jog/clue. Maybe jog/clue/mute segmented control?
}
