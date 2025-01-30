import SwiftUI

// (Goal) The user can get quizzed on her texts. To help know them.
struct KnowView: View {
    @Environment(\.modelContext) private var modelContext

    // we need user texts to know what's due
    
    var body: some View {
        Text("Know")
    }
}

#Preview {
    KnowView()
        .modelContainer(for: Passage.self)
}
