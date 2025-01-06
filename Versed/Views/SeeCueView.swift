import SwiftUI

// (Goal) The user can see a verse's cues. (vs hear)
struct SeeCueView: View {
    let verse: Verse

    var body: some View {
        // ToDo (ForEach) May have multiple prompts someday. Also avoids .first's optional.
        ForEach(verse.prompts) { prompt in
            Text(prompt.fullPrompt)
        }
    }
}
