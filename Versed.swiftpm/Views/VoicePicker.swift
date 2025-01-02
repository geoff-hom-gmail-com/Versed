import SwiftUI
import AVFoundation

// (Goal) The user can pick the voice for TTS.
struct VoicePicker: View {
    @AppStorage(AppStrings.StorageKeys.voiceID) var voiceID: String = ""
    
    @State private var selectedVoice: AVSpeechSynthesisVoice?
    
    var body: some View {
        // (MVP-post) generalize for all/most languages
        let englishVoices = AVSpeechSynthesisVoice.speechVoices().filter {
            $0.language.hasPrefix("en")
        }
        
        // ToDo: Make a better test line; something that captures most sounds.
        HearButton(view: Text("Test voice"), text: "This is a test.")
        
        Picker("Voice", selection: $selectedVoice) {
            ForEach(englishVoices, id:\.identifier) {
                Text("\($0.name) \($0.language)").tag($0)
            }
        }
        .onAppear {
            // (Goal) The user can see her last-picked voice. Even after restarting the app.
            selectedVoice = AVSpeechSynthesisVoice(identifier: voiceID)
        }
        .onChange(of: selectedVoice) {
            if let id = selectedVoice?.identifier {
                voiceID = id
            }
        }
    }
}
