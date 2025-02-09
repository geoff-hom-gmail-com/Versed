import SwiftUI

// MARK: - (KnowView)
// (Goal) The user can get quizzed on her texts. To know them.
struct KnowView: View {
    // MARK: - (body)
    var body: some View {
        Text("Know")
    }
    
    // MARK: - (??)
    @Environment(\.modelContext) private var modelContext

}

// MARK: - (preview)
#Preview {
    KnowView()
        .modelContainer(for: Passage.self)
}
