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
            Spacer()
            
            // (Goal) The coder can add a shorter, realistic verse with a past-due date.
            Button("Add realistic verse. Shorter. With past-due date") {
                // (NIV) (John 15)
                let text = """
                    Apart from me you can do nothing. 
                    """
                let beats = """
                    Apart from me 
                    
                    you can do nothing.
                    """
                let cues = [Prompt(text: "I forgot Jesus.", clarifier: "NIV")]
                let clues = [Clue(q: "What metaphor does Jesus use?", a: "Jesus is the vine. We are the branches."),
                             Clue(q: "Without Jesus, what can't we do?", a: "We can't bear fruit.")]
                let verse = Verse(beats, prompts: cues, clues: clues,
                                  dueDate: Date.distantPast)
                modelContext.insert(verse)
            }
            Spacer()
            
            // (Goal) The coder can add a realistic verse with a past-due date.
            Button("Add realistic verse. With past-due date") {
                // (GNT) (Mark 1:40)
                // (This disease was considered to make a person ritually unclean.)
                // (pity; some manuscripts have anger.)
                // short ver should be ??
                let text = """
                    A man suffering from a dreaded skin disease came to Jesus, knelt down, and begged him for help. 

                    “If you want to,” he said, “you can make me clean.”
                                  
                    Jesus was filled with pity, and reached out and touched him. 

                    “I do want to,” he answered.
                    """
                let beats = """
                    A man suffering from 
                    
                    a dreaded skin disease 
                    
                    came to Jesus, 
                    
                    knelt down, and 
                    
                    begged him for help. 

                    “If you want to,” he said, 
                    
                    “you can make me clean.”
                                  
                    Jesus was filled with pity, and 
                    
                    reached out and touched him. 

                    “I do want to,” he answered.
                    """
                // what's the context? unclean, touch, Jesus' clean > my unclean, had to yell unclean, unsafe, fear,
                let prompts = [Prompt(text: "When people are afraid of me.", clarifier: "A leper goes to Jesus.")]
                let verse = Verse(beats, prompts: prompts,
                                  dueDate: Date.distantPast)
                modelContext.insert(verse)
            }
            Spacer()
        }
        .padding(.vertical)

    }
}
