import SwiftUI
import AVFAudio

// (Goal) The user can pick the voice for TTS.

// (Note) (as of Xcode 16.1) The default American English voice is Samantha. The best alternative I've found is Serena (premium).
// Serena (premium) has to be downloaded. Even if you download on your Mac, you can't test Serena in App Preview. To test in the Simulator, you have to download Serena in the Simulator itself.
// Even better might be Siri voices, but those can't be used by third-party apps.
// Personal Voices are an option, but I haven't tried.
struct VoicePicker: View {
    @AppStorage(AppString.StorageKey.voiceID) var voiceID: String = ""
    
    @State private var selectedVoice: AVSpeechSynthesisVoice?
    
    @State private var englishVoices: [AVSpeechSynthesisVoice] = []
    
    @State private var selectedLine: TestLine = AppString.TestLine.defaultLine
    
    var body: some View {
        HearButton(view: Text("Test voice"), text: selectedLine.line)
        
        // (Note) (as of Xcode 16.1) This picker works in Xcode, etc., but not in Playgrounds for Mac. Nor Playgrounds for iPad. Nor Playgrounds for iPad -> TestFlight -> iPhone.
        // But it does work for Xcode -> iPhone. And Xcode -> TestFlight -> iPhone.
        // The voiceID seems to be read for HearButton, as I can hear the previously stored voice. But, the picker doesn't show that selected voice. Nor does it reflect picking other voices. 
        Picker("Voice", selection: $selectedVoice) {
            ForEach(englishVoices, id:\.identifier) {
                Text("\($0.name) \($0.language)").tag($0)
            }
        }
        .task {
            // (Goal) The user can see her last-picked voice. Even after restarting the app.
            selectedVoice = AVSpeechSynthesisVoice(identifier: voiceID)
            
            // (MVP-post) generalize for all/most languages
            englishVoices = AVSpeechSynthesisVoice.speechVoices()
                .filter {
                    $0.language.hasPrefix("en")
                }
                .sorted {
                    $0.name < $1.name
                }
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
