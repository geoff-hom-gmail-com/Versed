import SwiftUI
import AVFAudio

// (Goal) The coder/tester can tweak stuff.
struct DebugView: View {
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        VStack {
            // (Goal) The coder can check available voices.
            // (note: 1.2.25) This was done to see how to use higher-quality voices (e.g., Siri voices) for TTS. So far, Siri voices are unavailable. The user can download enhanced/premium voices. Also, she can make Personal Voices.
            Button("Print available voices") {
                let voices = AVSpeechSynthesisVoice.speechVoices()
                voices.forEach {
                    print($0)
                }
            }
            Spacer()
            
            // (Goal) The coder can delete all persistent data without going thru Terminal and deleting all preview data. Latter takes 30" to rebuild.
            Button("Delete all persistent data") {
                // deprecated; iOS 18+ use erase()
                // Works. But may crash preview.
                modelContext.container.deleteAllData()
                
                // (Note) Not sure if needed on device. But, in Xcode preview, helps? (maybe? can try erase() later) (and this is just for debugging)
                do {
                    try modelContext.save()
                } catch {
                    print("Failed to save: \(error)")
                }
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
                    "Apart from me 
                    
                    you can do nothing."
                    """
                let cues = [Prompt(text: "When I forget about Jesus.", clarifier: "")]
                let clues = [Clue(q: "Who is speaking? And to whom?",
                                  a: "Jesus is speaking to his disciples."),
                             Clue(q: "Where are they?", a: "The Last Supper."),
                             Clue(q: "What metaphor is Jesus using?",
                                  a: "He is the vine. We are the branches."),
                             Clue(q: "Without Jesus, what can't we do?",
                                  a: "We can't bear fruit."),
                             Clue(q: "What's the first word?", a: "Apart")]
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
