import SwiftUI
import AVFAudio

// MARK: - (DebugView)
struct DebugView: View {
// (goal) (dev and tester can tweak stuff)
    // MARK: - (body)
    var body: some View {
        Spacer()
        deleteDataButton
        Spacer()
        addMultiverseButton
        Spacer()
        addUniverseButton
        Spacer()
        addUniverseDistantFutureButton
        Spacer()

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

    @ViewBuilder
    private var deleteDataButton: some View {
    // (goal) (dev can delete all persistent data without going thru Terminal and deleting all preview data. Latter takes 30" to rebuild)
    // (note) (if model changes) (need to go thru Terminal) (xcrun simctl --set previews delete all)
        Button("Delete all persistent data") {
            do {
                try modelContext.container.erase()
                // (works) (but preview may crash)
            } catch {
                print(".erase() failed: \(error)")
            }
            DataManager.save(modelContext)
        }
    }

    @ViewBuilder
    private var addMultiverseButton: some View {
    // (goal) (tester can add user text of multiple paragraphs)
        Button("Add multiverse") {
            let text = Passage(
                beforeCue: """
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
                afterCue: "\"If you do not remain in me, you are like a branch that is thrown away and withers …\"",
                notes: """
                    (John) (NIV)
                    """
            )
            modelContext.insert(text)
            DataManager.save(modelContext)
        }
    }
    
    @ViewBuilder
    private var addUniverseButton: some View {
    // (goal) (tester can add user text of one paragraph)
        Button("Add universe") {
//            print("  (DebugView) (addUni) \(uniPassage.paragraphs.first?.readyDate)")
            modelContext.insert(uniPassage)
            DataManager.save(modelContext)
        }
    }
    
    @ViewBuilder
    private var addUniverseDistantFutureButton: some View {
    // (goal) (tester can add user text of one paragraph) (ready date: distant future)
        Button("Add universe: distant future") {
            uniPassage.paragraphs.forEach {
                $0.readyDate = Date.distantFuture
            }
            modelContext.insert(uniPassage)
            DataManager.save(modelContext)
//            print("  (DebugView) (addUniFuture) \(uniPassage.paragraphs.first?.readyDate)")
            // (note) (we're changing uniPassage) (a SwiftData instance)
            // (but after .insert(), something weird happens)
            // (it's like after auto-saving, calls to uniPassage return a new one)
            // (anyway, this is just for debugging)
        }
    }
    
    // MARK: - (misc)
    
    private let uniPassage = Passage(
        beforeCue: """
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
        afterCue: """
            \"… who do not need to repent.\"
            """,
        notes: """
            (Luke) (NIV)
            """
    )

    @Environment(\.modelContext) private var modelContext
}

// MARK: - (preview)
#Preview {
    DebugView()
        .modelContainer(for: Passage.self)
}
