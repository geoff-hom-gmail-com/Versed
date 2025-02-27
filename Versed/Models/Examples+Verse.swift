import Foundation
import SwiftData

// (Goal) The user can see examples of verses. These help her understand how the app works. Especially encoding.

// ToDo (move/refactor this under AppStrings?!)
extension Verse {
    static let examples = [
        // toDo  make prompt way more obvious/clear
        // Satan said, "If you are the Son of God, tell these stones to become bread.”
        // Jesus replied, "Man shall not live on bread alone, but on every word that comes from the mouth of God."
        // (Deuteronomy) "man does not live on bread alone, but on every word that comes from the mouth of the Lord."
    //          alt prompt?: [Prompt(q: "Bread vs. ___", a: "God's word")],
        Verse("Man does not live on bread alone, but on every word that comes from the mouth of the Lord.",
              isExample: true,
              prompts: [Prompt(text: "Hungry for food")],
              clues: [Clue(q: "Book?", a: "Deuteronomy")]),
        
        // Satan said, "If you are the Son of God, throw yourself down. For it is written: …"
        // Jesus replied, "Do not put the Lord your God to the test."
        // (Deuteronomy) "Do not put the Lord your God to the test as you did at Massah."
        Verse("Do not put the Lord your God to the test.",
              isExample: true,
              prompts: [Prompt(text: "Asked to prove God's providence", clarifier: "Massah")],
                //          prompts: [Prompt(q: "Test God?", a: "No")],
              clues: [Clue(q: "Book?", a: "Deuteronomy")]),
        
        // Satan said, "bow down and worship me."
        // Jesus replied, "Worship the Lord your God, and serve him only."
        // (Deuteronomy) "Fear the Lord your God, serve him only and take your oaths in his name."
        Verse("Fear the LORD your God, serve him only.",
              isExample: true,
              //          prompts: [Prompt(q: "Fear/worship whom?", a: "Only God")],
              prompts: [Prompt(text: "Told to worship another")],
              clues: [Clue(q: "Book?", a: "Deuteronomy")])
    ]

    static func insertExamples(modelContext: ModelContext) {
        // Assign indices automatically.
        for (index, example) in examples.enumerated() {
            example.index = index
        }
        
        examples.forEach { modelContext.insert($0) }
    }
}
