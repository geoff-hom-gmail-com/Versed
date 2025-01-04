import SwiftUI
import AVFAudio

// (Goal) The user thinks, "To hear <view>, tap here." If she taps, the text is spoken.
struct HearButton<Content: View>: View {
    var view: Content
    var text: String
    
    let synthesizer = AVSpeechSynthesizer()
    
    // (Goal) The user hears her preferred TTS voice.
    @AppStorage(AppString.StorageKey.voiceID) var voiceID: String = ""
    
    var body: some View {
        Button() {
            // (MVP-post) (can have user record prompts themselves (and clarifier, clues) (maybe even the verse text)
            // (MVP-post) Better TTS, like from OpenAI (or you'd think AI would have it eventually since that's from OpenAI)
            let utterance = AVSpeechUtterance(string: text)
            
            // If voice nil, then the synthesizer uses the system's default voice.
            utterance.voice = AVSpeechSynthesisVoice(identifier: voiceID)
            
            synthesizer.speak(utterance)
        } label: {
            // (ToDo) (animate properly) (user knows when playing, when stopped)
            // can google best practices (could use waveform) (play -> pause) (what about stop?)
            HStack {
                Image(systemName: AppString.SFSymbol.play)
                view
            }
        }
    }
}
