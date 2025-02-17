import SwiftUI
import SwiftData

// MARK: - (WhenNextView)
struct WhenNextView: View {
// (goal) (user can see when the next quiz is)
    // MARK: - (body)
    var body: some View {
        Text("Nothing is due.")
        if let nextParagraph {
            Text("\nNext quiz:")
            Text("\(nextParagraph.dueDate)")
        }
    }
   
    // MARK: - (non-views) (nextParagraph)
    
    private var nextParagraph: Paragraph? {
    // (goal) (user sees when the next paragraph is due)
    // (note) (after a user adds their first text, this should always be non-nil)
        paragraphs.min { $0.dueDate < $1.dueDate }
    }
    
    @Query
    private var paragraphs: [Paragraph]
}
