import SwiftUI

// Goal: The user can hear a clue, without seeing it. Tap question and answer buttons to show/hide.
struct HearClueView: View {
    // (ToDo) (parameters) (figure out) (e.g., which verse, which clue)
    var clue: Clue
    
    var body: some View {
        // (ToDo) (tweak UI) (probably want cleaner like see/read) (question icon, then play icon?) (ditto for answer)
        // (ditto for the prompt/clarifier hearing)
        Button() {
            // ToDo (play audio)
        } label: {
            Label("Question", systemImage: "play")
        }
        Button() {
            // ToDo (play audio)
        } label: {
            Label("Answer", systemImage: "play")
                .padding(.leading)
        }
    }
}

