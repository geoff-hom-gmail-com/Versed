import SwiftUI
import SwiftData

// MARK: - (KnowView)
struct KnowView: View {
// (goal) (user can get quizzed on her texts) (to know them)
    // MARK: - (body)
    var body: some View {
        
        // anki shows #due and #new to learn today
        // it also shows it while reviewing, which is definitely distracting
        // we also have the tab badge; if distracting, could do quiz as sheet
        
        // so try just jumping into most-due quiz

        if isAnyParagraphDue {
            QuizView()
        } else {
            WhenNextView()
        }
    }
    
    // MARK: - (isAnyParagraphDue)
    
    private var isAnyParagraphDue: Bool {
        print("(KnowView) (isAnyParagraphDue) \(Date.now)")
        // (note) (when a passage is added) (this is called x4) (not sure why)
        // (but at least it's not called continuously)
        // TODO: - (what about when a passage is updated? when it's paragraphs are updated?)
        
        let nextParagraph = paragraphs.min { $0.dueDate < $1.dueDate }
        return nextParagraph?.dueDate ?? Date.distantFuture < Date.now
    }
    
    @Query
    private var paragraphs: [Paragraph]
}

// MARK: - (preview)
#Preview {
    KnowView()
        .modelContainer(for: Passage.self)
}
