import SwiftUI

// (Goal) The user can hear a verse's cues, without seeing them.
struct HearCueView: View {
    let verse: Verse
    
    var body: some View {
        // (ForEach) May have multiple prompts someday. Also avoids .first's optional.
        ForEach(verse.prompts) { prompt in
            HearButton(image: Image(systemName: SFSymbols.cue),
                           text: prompt.text)
            
            if !prompt.clarifier.isEmpty {
                HearButton(image: Image(systemName: SFSymbols.clarifier),
                               text: prompt.clarifier)
                .padding(.leading)
            }
        }
    }
}
