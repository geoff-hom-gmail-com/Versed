import SwiftUI

// Goal: The user can see a verse's clues. At first, only the first clue's question is shown. Tap question and answer buttons to see those.
struct SeeCluesView: View {
    var clues: [Clue]
    
//    @State private var shouldShowText2: Bool = false

    var body: some View {
        // ForEach
        // hmm; how do we want this? 
        // we want the user to see minimal stuff if they don't want clues
        // so clues = just an icon
        // if tapped, then presumably wants to see first clue, so we should show that question
        // but not q2
        // we almost just want an outline view, and just programmatically show q1 right away
        // the disadvantage is three lines per question, and three indentations
        // ideal might be question/answer buttons; answer is indented
        // tap button to show text
        
        // hearing is slightly different, because you can't get spoiled since you have to hit each button
        if let clue = clues.first {
            SeeClueView(clue: clue, shouldShowQuestion: true)
            SeeClueView(clue: clue)

        } else {
            Text("No clues. Encode some!")
        }
        // how do we get the remaining clues? 
//        Button() {
//            
//        } label: {
//            Image(systemName: "questionmark.bubble")            
//        }
//        HStack {
//            var shouldShowText: Bool = false
//            Button() {
//                shouldShowText = true
//                shouldShowText2 = true
//            } label: {
//                // alt: bubble.left.and.exclamationmark.bubble.right
//                Image(systemName: "exclamationmark.bubble")
//                    .environment(\.layoutDirection, .rightToLeft)
//                    .padding(.leading)
//            }
//            // how do we do this for ForEach? 
//            if shouldShowText || shouldShowText2 {
//                Text("question/answer here")
//            }
//            Text("test")
//        }
//        Button() {
//            
//        } label: {
//            Image(systemName: "questionmark.bubble")            
//        }
//        
//        Button() {
//            
//        } label: {
//            Image(systemName: "bubble.left.and.exclamationmark.bubble.right")
//                .padding(.leading)
//        }
//        Button() {
//            // ToDo (show answer)
//        } label: {
//            Label("Answer", systemImage: "play")
//                .padding(.leading)
//                .labelStyle(.iconOnly)
//        }
//        .labelStyle(.iconOnly)
    }
}
