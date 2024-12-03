import SwiftUI

// Recite the most-due verse.
struct ReciteView: View {
    @Environment(Verses.self) private var verses
    // hmm not compiling; this also fails
    // could try onAppear
    // let mostDueVerse = verses.mostDue
//    @State private var mostDueVerse = verses.mostDue

    var body: some View {
//        Text("Recite")
        // is it calculating this a lot? check with log
        let earliestDueDateVerse = verses.earliestDueDateVerse
        let _ = Self._printChanges()

        if (earliestDueDateVerse == nil) {
            NextVerseDueView(verse: nil)
        
        // If no verses due, then show when next.
        } else if let dueDate = earliestDueDateVerse?.dueDate,
           dueDate > Date.now {
            NextVerseDueView(verse: earliestDueDateVerse)
            
        // Else, show most-due verse.
        } else {
            TestAVerseView(verse: earliestDueDateVerse)
        }
    }
}

//#Preview {
//    ReciteView()
//}
