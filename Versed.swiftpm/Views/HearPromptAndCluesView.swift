import SwiftUI

// (Goal) The user can hear prompts/clues, without seeing them.
struct HearPromptAndCluesView: View {
    var verse: Verse
    
    var body: some View {
        // (ForEach) May have multiple prompts someday. Also avoids optional from .first.
        ForEach(verse.prompts) { prompt in
            // (Goal) The user thinks, "play cue."
            HearTextButton(image: Image(systemName: "lightbulb.max"),
                           text: prompt.text)
            
            if !prompt.clarifier.isEmpty {
                // (Goal) The user thinks, "play clarifier."
                HearTextButton(image: Image(systemName: "info.circle"),
                               text: prompt.clarifier)
                .padding(.leading)
            }
        }
        
        DisclosureGroup() {
            if verse.clues.isEmpty {
                Text("No clues. Encode some!")
            } else {
                ForEach(verse.clues) {
                    if !$0.q.isEmpty {
                        HearClueView(clue: $0)
                    }
                }
            }
        } label: {
            // (ToDo) (could DRY) (e.g., CluesIconLabel)
            Spacer()
                .frame(maxWidth: .infinity)
            
            // (Goal) The user thinks "clues."
            Image(systemName: "sparkle.magnifyingglass")
        }
    }
}
