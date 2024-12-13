import SwiftUI

// Recite the most-due verse.
struct ReciteView: View {
//    @Environment(Verses.self) private var verses
    // hmm not compiling; this also fails
    // could try onAppear
    // let mostDueVerse = verses.mostDue
//    @State private var mostDueVerse = verses.mostDue

    var body: some View {
        Text("Recite")
//        let earliestDueDateVerse = verses.earliestDueDateVerse

        // old?
//        if (earliestDueDateVerse == nil) {
//            NextVerseDueView(verse: nil)
//        
//        // If no verses due, then show when next.
//        } else if let dueDate = earliestDueDateVerse?.dueDate,
//           dueDate > Date.now {
//            NextVerseDueView(verse: earliestDueDateVerse)
//            
//        // Else, show most-due verse.
//        } else {
//            TestAVerseView(verse: earliestDueDateVerse!)
//        }
        
        // If there's a verse with a due date, then the due date isn't nil. 
//        if let verse = earliestDueDateVerse,
//           let dueDate = verse.dueDate {
//            // If due, test it. Else, show when due. 
//            if dueDate < Date.now {
//                TestAVerseView(verse: verse)
//            } else {
//                NextVerseDueView(verse: verse)
//            }
//        } else {
//            // Goal: User knows nothing is due, because either no verses have been added, or no verses have a prompt.
//            // ToDo (MVP-post)
//            // could just make this a Text.
//            NextVerseDueView(verse: nil)
//        }
    }
}

//#Preview {
//    ReciteView()
//}
