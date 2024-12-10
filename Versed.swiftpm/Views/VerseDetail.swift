import SwiftUI

// (UX) The user can edit any aspect of the given verse.
struct VerseDetail: View {
    // This was a bit tricky to get working with parent views. 
    // If problems later, could use Environment more. E.g., pass in the index/ID/verse without binding. Then, use Environment to get Verses and find the matching verse. 
    // Which makes the most sense, top-down? Readability? Maintainability?
//    @Binding var verse: Verse
    
    @Bindable var verse: Verse
        
    var body: some View {
//        Text("VerseDetail")
        // In a List, the disclosure triangles work with Section(isExpanded:). But with Form, they don't seem to. Even with header empty.
        // DisclosureGroup works. Not sure the UI is ideal. Consider Post-MVP.
        Form {
            // where do we put navbar title? try with Text; later, should be the prompt/rowTitle?
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
            
            Section() {
                // ToDo: figure out bindings here. $verse.prompts may be empty. Similarly, $verse.clues may be empty, have 1, 2, 3, etc.
                //     !           TextField("", text: $verse.prompts.first?.text)
                TextField("Prompt", text: .constant(""))
                TextField("(Clarifier)", text: .constant(""))
                    .padding(.leading)                               
            } header: {
                HStack {
                    Text("Prompt (Clarifier)")
                    HelpButton(popoverText: "What are prompt/clarifier? Etc. Answer here.")
                    Spacer()
                }
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
            
            Section("Clue 2") {
                TextField("Question", text: .constant(""))
                TextField("Answer", text: .constant(""))
                    .padding(.leading)               
            }
            
            Section("Clue 3") {
                TextField("Question", text: .constant(""))
                TextField("Answer", text: .constant(""))
                    .padding(.leading)               
            }
            
            Section("Clue 4") {
                TextField("Question", text: .constant(""))
                TextField("Answer", text: .constant(""))
                    .padding(.leading)               
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
