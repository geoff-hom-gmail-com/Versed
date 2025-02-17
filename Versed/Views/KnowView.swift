import SwiftUI
import SwiftData

// MARK: - (KnowView)
struct KnowView: View {
// (goal) (user can get quizzed on her texts) (to know them)
    // MARK: - (body)
    var body: some View {
        if let nextParagraph = nextParagraph, isParagraphDue(nextParagraph) {
            QuizView(nextParagraph)
        } else {
            WhenNextView()
        }
    }
    
    // MARK: - (non-views) (nextParagraph)
    
    private var nextParagraph: Paragraph? {
//        print("(KnowView) (paragraph) \(Date.now)")
        // (note) (when a text is added) (this is called x4)
        // (but at least it's not called continuously)
        // TODO: - (what about when a passage is updated? when it's paragraphs are updated?)
        return paragraphs.min { $0.dueDate < $1.dueDate }
    }
    
    private func isParagraphDue(_ paragraph: Paragraph) -> Bool {
        paragraph.dueDate < Date.now
    }
    
    @Query
    private var paragraphs: [Paragraph]
}

// MARK: - (preview)
#Preview {
    KnowView()
        .modelContainer(for: Passage.self)
}
