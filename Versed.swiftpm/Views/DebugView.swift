import SwiftUI

// (Goal) The coder/tester can tweak stuff.
struct DebugView: View {
    @Environment(\.modelContext) private var modelContext

    var body: some View {
//        Text("debug")
        
        // (Goal) The coder can delete all persistent data without going thru Terminal and deleting all preview data. Latter takes 30" to rebuild. 
        Button("Delete all persistent data") {
            // deprecated; iOS 18+ use erase()
            modelContext.container.deleteAllData()
        }
    }
}
