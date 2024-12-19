import SwiftUI

// Goal: The user can hear prompts/clues, without seeing them. 
struct HearPromptAndCluesView: View {    
    var verse: Verse

    var body: some View {
        Button() {
            // ToDo play the prompt as audio
            // we need to check the prompt exists, to fail gracefully, but it should be there; we should have a flag if a verse is minimally encoded, then check that at top of recite
            // state, not event
            // how do we play arbitrary text as audio anyway? we'll see how well we can access ios 18 features
            // (MVP-post) (can have user record prompts themselves (and clarifier, clues) (maybe even the verse text)
        } label: {
            // (ToDo) (animate properly) (user knows when playing, when stopped)
            // can google best practices (could use waveform) (play -> pause) (what about stop?)
//            Label("Prompt", systemImage: "play")
            // (Goal) The user thinks, "play cue."
            HStack {
                Image(systemName: "play")
                Image(systemName: "lightbulb.max")
            }
            

        }
        // (ToDo) show only if clarifier (state, not event)
        Button() {
            // ToDo play the clarifier as audio
        } label: {
//            Label("(Clarifier)", systemImage: "play")
            // (Goal) The user thinks, "play clarifier."
            HStack {
                Image(systemName: "play")
                Image(systemName: "info.circle")
            }
            .padding(.leading)
//                .padding(.leading)
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
