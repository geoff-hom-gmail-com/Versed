import SwiftUI

// Goal: The user can see prompts/clues. 
struct SeePromptView: View {
    var verse: Verse
//    @State private var fullPrompt: String = "(warning) (no prompt)"

    var body: some View {
        if let prompt = verse.prompts.first {
            Text(prompt.fullPrompt)
        }
        
        DisclosureGroup() {
            SeeCluesView(clues: verse.clues)
//            Spacer()
//            SeeClueView()
//            Spacer()
//            HearClueView(clue: 3)
//            Spacer()
//            HearClueView(clue: 4)
        } label: {
            Spacer()
                .frame(maxWidth: .infinity)
            // Goal: The user thinks "clues."
            Image(systemName: "sparkle.magnifyingglass")
        }
        
//        DisclosureGroup("(Clues)") {
//            HearClueView(clue: 1)
//            Spacer()
//            HearClueView(clue: 2)
//            Spacer()
//            HearClueView(clue: 3)
//            Spacer()
//            HearClueView(clue: 4)
//        }
    }
}
