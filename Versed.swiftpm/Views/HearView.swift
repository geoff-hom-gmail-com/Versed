import SwiftUI

// Goal: The user can hear prompts/clues without seeing them. 
struct HearView: View {
    @Binding var wasTranscribePressed: Bool
    
    var body: some View {
        Section() {
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
            Button() {
                // ToDo play the clarifier as audio
            } label: {
                Label("(Clarifier)", systemImage: "play")
                    .padding(.leading)               
            }
            
            DisclosureGroup("Clues") {
                HearClueView(clue: 1)
                Spacer()
                HearClueView(clue: 2)
                Spacer()
                HearClueView(clue: 3)
                Spacer()
                HearClueView(clue: 4)
            }
            HStack {
                Spacer()
                // (ToDo) (need to work on this UI practically)
                // (and keep in mind latest features of iOS 18 vs what I have access to in Playgrounds)
                // Ideally, user taps Transcribe button. User knows when transcription is happening and when stopped. 
                // User can pause to think. Unpause to resume. (or maybe that's MVP-post)
                // Does it stop transcribing automatically, and/or when user taps a stop button? Or just a button?
                // Is the dictation live, or after stop? What's ideal?
                // What if the user wants to hear it back?
                Button("Transcribe me") {
                    wasTranscribePressed = true
                }
            }
        }
    }
}
