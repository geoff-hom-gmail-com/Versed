import SwiftUI

// (Goal) The coder/tester can tweak stuff.
struct DebugView: View {
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        VStack {
            //        Text("debug")
            
            // (Goal) The coder can delete all persistent data without going thru Terminal and deleting all preview data. Latter takes 30" to rebuild.
            Button("Delete all persistent data") {
                // deprecated; iOS 18+ use erase()
                // Works. But may crash preview.
                modelContext.container.deleteAllData()
            }
            Spacer()
            
            // (Goal) The coder can add a user verse with a distant due date.
            Button("Add user verse, with distant due date") {
                let verse = Verse("A message from the future", dueDate: Date.distantFuture)
                modelContext.insert(verse)
            }
            Spacer()

            // (Goal) The coder can add a user verse with a past-due date.
            Button("Add user verse, with past-due date") {
                let verse = Verse("A message from the past", dueDate: Date.distantPast)
                modelContext.insert(verse)
            }
        }
        .padding(.vertical)

    }
}
