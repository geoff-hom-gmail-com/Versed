import SwiftUI

struct HearClueView: View {
    // (ToDo) (parameters) (figure out) (e.g., which verse, which clue)
    
    // temp
    var clue: Int
    
    var body: some View {
        Button() {
            // ToDo (play audio)
        } label: {
            Label("Question \(clue)", systemImage: "play")
        }
        Button() {
            // ToDo (play audio)
        } label: {
            Label("Answer", systemImage: "play")
                .padding(.leading)
        }
    }
}

