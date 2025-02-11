import SwiftUI

// MARK: - (KnowView)
// (Goal) The user can get quizzed on her texts. To know them.
struct KnowView: View {
    // MARK: - (body)
    var body: some View {
        Text("Know")
        // use opacity instead of if/then?
        // what's most browsable?
        // how many paragraphs due?
        // if zero, show view for when next one is due
        
        // or could say, when is next due? if not yet, show that view
        
        // suppose one is due; and it's the most due; how much do we want to show about others due?
        // what's best for the user?
        
        // anki shows #due and #new to learn today
        // it also shows it while reviewing, which is definitely distracting
        // we also have the tab badge; if distracting, could do quiz as sheet
        
        // so try just jumping into most-due quiz
        // so it's a bool; isParagraphDue (computed or not?)
        if isParagraphDue {
//            QuizView()
        } else {
//            WhenIsNextDueView()
        }
    }
    
    // MARK: - (??)
    
    private var isParagraphDue: Bool {
        false
        // hmm examples have paragraphs, but really they don't need to
        // and paragraphs all have due dates, unless examples have paragraphs
    }
    
    // (Goal) The user can recite her most-due verse.
    // We'll get all user verses with due dates. Then, we just need the min().
//    @Query(filter: #Predicate<Verse> {
//        ($0.isExample == false) && ($0.dueDate != nil)
//    })
//    private var versesDueSomeday: [Verse]
    
    @Environment(\.modelContext) private var modelContext

}

// MARK: - (preview)
#Preview {
    KnowView()
        .modelContainer(for: Passage.self)
}
