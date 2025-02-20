import SwiftUI
import SwiftData

// MARK: - (WhenNextView)
struct WhenNextView: View {
// (goal) (user can see when the next quiz is)
    // MARK: - (body)
    var body: some View {
        Text("Nothing is ready.")
        if let nextParagraph {
            Text("\nNext quiz:")
            Text(nextParagraph.readyDate, format: .dateTime
                .month().day().year()
                .hour().minute())
        }
    }
   
    // MARK: - (non-views) (nextParagraph)
    
    private var nextParagraph: Paragraph? {
    // (goal) (user sees when the next paragraph will be ready)
    // (note) (after a user adds their first text, this should always be non-nil)
        paragraphs.min { $0.readyDate < $1.readyDate }
    }
    
    @Query
    private var paragraphs: [Paragraph]
    
    // TODO: - (tidy) (this is done in KnowView already)
    // (could wait to see if we separate "not ready" from "0 paragraphs added")
}
