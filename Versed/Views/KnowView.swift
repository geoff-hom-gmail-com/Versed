import SwiftUI
import SwiftData

// MARK: - (KnowView)
struct KnowView: View {
// (goal) (user can get quizzed on her texts) (to know them)
    // MARK: - (body)
    var body: some View {
//        Text("Know")
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
        if isAnyParagraphDue {
            QuizView()
        } else {
            WhenNextView()
        }
    }
    
    // MARK: - (??)
    
    private var isAnyParagraphDue: Bool {
        print("(KnowView) (isAnyParagraphDue) \(Date.now)")
        // (note) (when a passage is added) (this is called x4) (not sure why)
        // (but at least it's not called continuously)
        // TODO: - (what about when a passage is updated? when it's paragraphs are updated?)
        
        let mostDue = paragraphs.min { $0.dueDate < $1.dueDate }
        return mostDue?.dueDate ?? Date.distantFuture < Date.now
    }
    
    @Query
    private var paragraphs: [Paragraph]
    
//    @Environment(\.modelContext) private var modelContext
}

// MARK: - (preview)
#Preview {
    KnowView()
        .modelContainer(for: Passage.self)
}
