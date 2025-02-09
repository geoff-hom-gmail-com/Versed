import SwiftUI
import AVFAudio

// MARK: - (DebugView)
// (Goal) The dev and tester can tweak stuff.
struct DebugView: View {
    // MARK: - (body)
    var body: some View {
        Spacer()
        deleteDataButton
        Spacer()
        addMultiverseButton
        Spacer()
        addUniverseButton
        Spacer()
        
//        // (Goal) The coder can add a user verse with a distant due date.
//        let verse = Verse("A message from the future", dueDate: Date.distantFuture)
//
//        // (Goal) The coder can add a user verse with a past-due date.
//        let verse = Verse("A message from the past", dueDate: Date.distantPast)
//
//        // (GNT) (Mark 1:40)
//        // (pity; some manuscripts have anger.)
//        let text = """
//                    A man suffering from a dreaded skin disease came to Jesus, knelt down, and begged him for help.
//
//                    “If you want to,” he said, “you can make me clean.”
//
//                    Jesus was filled with pity, and reached out and touched him.
//
//                    “I do want to,” he answered.
//                    """
    }
    
    // MARK: - (buttons)

    // (Goal) The coder can delete all persistent data without going thru Terminal and deleting all preview data. Latter takes 30" to rebuild.
    @ViewBuilder
    private var deleteDataButton: some View {
        Button("Delete all persistent data") {
            do {
                // Works. But preview may crash.
                try modelContext.container.erase()
            } catch {
                print(".erase() failed: \(error)")
            }
        }
    }

    // (Goal) The tester can add a user text of multiple paragraphs.
    @ViewBuilder
    private var addMultiverseButton: some View {
        Button("Add multiverse") {
            let text = Passage(
                before: """
                    \"… Neither can you bear fruit unless you remain in me.\"
                    """,
                goal: """
                    \"I am the 
                    vine; 
                    you are the 
                    branches. 
                    
                    If you remain in me 
                    and I in you, 
                    you will bear 
                    much fruit; 
                    
                    apart from me 
                    you can do 
                    nothing.\"
                    """,
                after: "\"If you do not remain in me, you are like a branch that is thrown away and withers …\"",
                reference: """
                    (John) (NIV)
                    """
            )
            modelContext.insert(text)
        }
    }
    
    // (Goal) The tester can add a user text of one paragraph.
    @ViewBuilder
    private var addUniverseButton: some View {
        Button("Add universe") {
            let text = Passage(
                before: """
                    \"… he calls his friends and neighbors together and says, 
                    
                    ‘Rejoice with me; 
                    I have found my lost sheep.’ 
                    
                    I tell you 
                    that in the same way …\"
                    """,
                goal: """
                    \"… there will be more 
                    rejoicing in heaven 
                    over
                    one sinner who repents 
                    than over 
                    ninety-nine righteous persons …\"
                    """,
                after: """
                    \"… who do not need to repent.\"
                    """,
                reference: """
                    (Luke) (NIV)
                    """
            )
            modelContext.insert(text)
        }
    }

    @Environment(\.modelContext) private var modelContext
}

// MARK: - (preview)
#Preview {
    DebugView()
        .modelContainer(for: Passage.self)
}
