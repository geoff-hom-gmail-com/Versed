import SwiftUI
import AVFoundation

// (Goal) The user thinks, "To hear <image>, tap here." If she taps, the text is spoken.
// Technically, this can take any view. Future proofing. Also, .environment() returns "some View."
struct HearButton<Content: View>: View {
    var image: Content
    var text: String
    
    let synthesizer = AVSpeechSynthesizer()
    
    var body: some View {
        Button() {
            // (MVP-post) (can have user record prompts themselves (and clarifier, clues) (maybe even the verse text)
            // (MVP-post) Better TTS, like from OpenAI (or you'd think AI would have it eventually since that's from OpenAI)
            let utterance = AVSpeechUtterance(string: text)
            synthesizer.speak(utterance)
        } label: {
            // (ToDo) (animate properly) (user knows when playing, when stopped)
            // can google best practices (could use waveform) (play -> pause) (what about stop?)
            HStack {
                Image(systemName: SFSymbols.play)
                image
            }
        }
    }
}
