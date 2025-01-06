import SwiftUI
import SwiftData

// (Goal) The user can recite (test) her due verses. In order of due date.
struct ReciteView: View {
    @Environment(\.modelContext) private var modelContext
    
    // (Goal) The user can recite her most-due verse.
    // We'll get all user verses with due dates. Then, we just need the min().
    @Query(filter: #Predicate<Verse> {
        ($0.isExample == false) && ($0.dueDate != nil)
    })
    private var versesDueSomeday: [Verse]
    
    // (ToDo) (later) After one verse is recited, the due dates may change; I mean, the other due dates will be the same, but the one just tested could be next. Or not.

    var body: some View {
//        Text("Recite")
        
        let mostDueVerse = versesDueSomeday.min {
            // Nil dates were skipped via the predicate.
            $0.dueDate! < $1.dueDate!
        }

        // (Goal) The user knows the due-date situation:
        // 1) The next verse is due, so she can recite.
        // 2) The next verse is due later.
        // 3) No verse has a due date. And how to fix.
        if let verse = mostDueVerse {
            // There's a verse, so it has a date.
            if verse.dueDate! < Date.now {
                TestAVerseView(verse: verse)
            } else {
                // (ToDo) Pass in only what a view needs. (just due date?)
                NextVerseDueView(verse: verse)
            }
        } else {
            // (toDo) last case may need some clarity, esp for beginners; but it's only at the start, until 1 verse is added and given a prompt.
            // KISS: ToDo: just make this a text or other view vs calling NextVerseDueView? (consider during coding-for-beginner-user) (probably; top-down)
            NextVerseDueView(verse: nil)
        }
    }
}

//#Preview {
//    ReciteView()
//}
