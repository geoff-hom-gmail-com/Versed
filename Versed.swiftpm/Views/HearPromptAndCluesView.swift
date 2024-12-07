import SwiftUI

// Goal: The user can hear prompts/clues, without seeing them. 
struct HearPromptAndCluesView: View {    
    var verse: Verse

    var body: some View {
        Button() {
            // ToDo play the prompt as audio
            // we need to check the prompt exists, to fail gracefully, but it should be there; we should have a flag if a verse is minimally encoded, then check that at top of recite
            // how do we play arbitrary text as audio anyway? we'll see how well we can access ios 18 features
            // (MVP-post) (can have user record prompts themselves (and clarifier, clues) (maybe even the verse text)
        } label: {
            // (ToDo) (animate properly) (user knows when playing, when stopped)
            // can google best practices (could use waveform) (play -> pause) (what about stop?)
            Label("Prompt", systemImage: "play")
        }
        // (ToDo) what if no clarifier? probably don't show
        Button() {
            // ToDo play the clarifier as audio
        } label: {
            Label("(Clarifier)", systemImage: "play")
                .padding(.leading)               
        }
        DisclosureGroup() {
            if verse.clues.isEmpty {
                Text("No clues. Encode some!")
            } else {
                ForEach(verse.clues) { clue in
                    HearClueView(clue: clue)
                }
            }
//            HearClueView(clue: 1)
//            Spacer()
//            HearClueView(clue: 2)
//            Spacer()
//            HearClueView(clue: 3)
//            Spacer()
//            HearClueView(clue: 4)
        } label: {
            // (ToDo) (could DRY) (e.g., CluesIconLabel)
            Spacer()
                .frame(maxWidth: .infinity)
            // Image goal: The user thinks "clues."
            Image(systemName: "sparkle.magnifyingglass")
        }
        
//        DisclosureGroup("Clues") {
//            HearClueView(clue: 1)
//            Spacer()
//            HearClueView(clue: 2)
//            Spacer()
//            HearClueView(clue: 3)
//            Spacer()
//            HearClueView(clue: 4)
//        }
//        DisclosureGroup() {
//            SeeCluesView(clues: verse.clues)
//        } label: {
//            Spacer()
//                .frame(maxWidth: .infinity)
//            // Image goal: The user thinks "clues."
//            Image(systemName: "sparkle.magnifyingglass")
//        }
            
    }
}
