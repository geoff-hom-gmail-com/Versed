import SwiftUI

struct VerseDetail: View {
    @State private var beatsAreExpanded: Bool = true

    // This was a bit tricky to get working with parent views. 
    // If problems later, could use Environment more. E.g., pass in the index/ID/verse without binding. Then, use Environment to get Verses and find the matching verse. 
    // Which makes the most sense, top-down? Readability? Maintainability?
    @Binding var verse: Verse
    
//    @State private var tempText: String = "test"
    
    var body: some View {
//        Text("VerseDetail")
        Form {
            // where do we put navbar title? try with Text; later, should be the prompt/rowTitle?
            Section(isExpanded: $beatsAreExpanded) {
                // TextEditor might sound better at first. But I like having a minimum text size. 
                // lineLimit() works differently here than in TextField. Here, the min doesn't seem to work. 
//                TextEditor(text: $verse.text)
//                    .lineLimit(3...)

                TextField("", text: $verse.text, axis: .vertical)
                    .lineLimit(3...)
            } header: {
                // wrap in HStack? Add button with help symbol?
                Text("Beats")
            }
            
//            Button("Done") {
//                verses.myVerses.append(
//                    Verse(text: fullText))
//                //                Verse(text: "For God so loved …"))
//            }
        }
    }
    
    // remminder: what if we just have empty prompts that the user can customize? No set prompts. Can start with 4. But would be very nice if user can add an arbitrary number of prompts. And choose which ones to have on jog/clue. Maybe jog/clue/mute segmented control?
}
