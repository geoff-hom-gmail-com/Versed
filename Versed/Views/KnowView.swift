import SwiftUI
import SwiftData

// MARK: - (KnowView)
struct KnowView: View {
// (goal) (user can get quizzed on her texts) (to know them)
    // MARK: - (body)
    var body: some View {
        if let nextParagraph = nextParagraph, isParagraphReady(nextParagraph) {
            QuizView(nextParagraph)
        } else {
            WhenNextView()
        }
    }
    
    // MARK: - (non-views) (nextParagraph)
    
    private var nextParagraph: Paragraph? {
    // (goal) (return paragraph with earliest ready date)
//        print("(KnowView) (paragraphs) \(paragraphs.count)")
//        print("(KnowView) (paragraph) \(Date.now)")
        // (note) (when a text is added) (this is called x4)
        // (when quiz feedback given) (called x3)
        // (but at least it's not called continuously)
        // TODO: - (what about when a passage is updated? when it's paragraphs are updated?)
        
        return paragraphs.min { $0.readyDate < $1.readyDate }
    }
    
    private func isParagraphReady(_ paragraph: Paragraph) -> Bool {
        paragraph.readyDate < Date.now
    }
    
    @Query
    private var paragraphs: [Paragraph]
}

// MARK: - (preview)
#Preview {
    KnowView()
        .modelContainer(for: Passage.self)
}
