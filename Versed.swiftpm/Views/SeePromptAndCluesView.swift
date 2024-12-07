import SwiftUI

// Goal: The user can see prompts/clues. 
struct SeePromptAndCluesView: View {
    var verse: Verse

    var body: some View {
        if let prompt = verse.prompts.first {
            Text(prompt.fullPrompt)
        }
        DisclosureGroup() {
            // (ToDo) (could DRY)
            if verse.clues.isEmpty {
                Text("No clues. Encode some!")
            } else {
                ForEach(verse.clues) { clue in
                    SeeClueView(clue: clue)
                }
            }
        } label: {
            Spacer()
                .frame(maxWidth: .infinity)
            // Image goal: The user thinks "clues."
            Image(systemName: "sparkle.magnifyingglass")
        }
    }
}
