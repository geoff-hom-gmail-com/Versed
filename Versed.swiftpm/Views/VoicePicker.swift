import SwiftUI
import AVFAudio

// (Goal) The user can pick the voice for TTS.
struct VoicePicker: View {
    @AppStorage(AppString.StorageKey.voiceID) var voiceID: String = ""
    
    @State private var selectedVoice: AVSpeechSynthesisVoice?
    
    @State private var selectedLine: TestLine = AppString.TestLine.defaultLine
    
    var body: some View {
        // (MVP-post) generalize for all/most languages
        let englishVoices = AVSpeechSynthesisVoice.speechVoices().filter {
            $0.language.hasPrefix("en")
        }
        
        HearButton(view: Text("Test voice"), text: selectedLine.line)
        
        Picker("Voice", selection: $selectedVoice) {
            ForEach(englishVoices, id:\.identifier) {
                Text("\($0.name) \($0.language)").tag($0)
            }
        }
        .task {
            // (Goal) The user can see her last-picked voice. Even after restarting the app.
            selectedVoice = AVSpeechSynthesisVoice(identifier: voiceID)
        }
        .onChange(of: selectedVoice) {
            if let id = selectedVoice?.identifier {
                voiceID = id
            }
        }
        
        Picker("Line", selection: $selectedLine) {
            ForEach(AppString.TestLine.allLines, id:\.id) {
                Text("(\($0.why)) \($0.line)").tag($0)
            }
        }
    }
}
