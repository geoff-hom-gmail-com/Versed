import SwiftUI

struct VerseDetail: View {
    @State private var beatsAreExpanded: Bool = true

    // ugh is this bindable or state? If bindable, then observable means Verse has to be a class, which adds an init() and I may need to rework hashable, etc.
    // verse.$text not working
    // ok, we will be changing a lot of the verse in this view. But maybe we can assign one to another. 
    // like, pass in a verse without a binding; then no, that's messy
    // 
    @Binding var verse: Verse
    
    @State private var tempText: String = "test"
    
    var body: some View {
//        Text("VerseDetail")
        Form {
            Section(isExpanded: $beatsAreExpanded) {
                // which do I want? TextEditor or TextField? which can you resize manually?
//                TextEditor(text: $verse.text)
                TextEditor(text: $tempText)
//                TextField(<#LocalizedStringKey#>, text: verse.$text, axis: .vertical)
//                .lineLimit(3...)
            } header: {
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
