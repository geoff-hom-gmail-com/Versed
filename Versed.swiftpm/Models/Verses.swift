import SwiftUI
import SwiftData

// (Goal) The user can memorize their collection of verses. Also, she can learn how to use the app, from examples. 
// (final) (inheritance not considered)
// (class) (SwiftData)
//@Model
@Observable
final class Verses {
    var myVerses: [Verse] = []
    var exampleVerses = builtInExamples
    
    init() {
        // for testing; not sure how to do this better
        myVerses = tempMyVerses
//        myVerses = tempMyVerses2
        myVerses = tempMyVerses3
    }
    
    // (Goal) The user goes to recite her due verses. She 
    // The verse with the earliest due date. Could be past due or coming up.
    // If (new) user hasn't encoded any verses, then no verses will be due. Return nil.
    var earliestDueDateVerse: Verse? {
        // Get only verses with due dates. Then get earliest. 
        let dueDatedVerses = myVerses.filter { $0.dueDate != nil }
        return dueDatedVerses.min(by: { $0.dueDate! < $1.dueDate! })
    }
}

let tempMyVerses: [Verse] = [
//    Verse("For God so loved …")
    Verse("For God so loved the world, he gave his one and only begotton Son, that whosoever")

]

// For testing. 
let tempMyVerses2: [Verse] = [
    // Due date in future. 
    Verse("future text", dueDate: Date.distantFuture)
]

let tempMyVerses3: [Verse] = [
    // Due date in past.
//    Verse("past text", prompts: [Prompt(text: "Hungry for food")], dueDate: Date.distantPast)
//    Verse("past text", prompts: [Prompt(text: "Asked to prove God's providence", clarifier: "Massah")], dueDate: Date.distantPast)
//    Verse("past text", prompts: [Prompt(text: "Hungry for food")], clues: [Clue(q: "Book?", a: "Deuteronomy")], dueDate: Date.distantPast)
    Verse("past text", 
          prompts: [Prompt(text: "Hungry for food")], 
          clues: [Clue(q: "Book?", a: "Deuteronomy"), 
                  Clue(q: "q2", a: "a2"), 
                  Clue(q: "q3", a: "a3")], 
          dueDate: Date.distantPast)

]

let builtInExamples: [Verse] = [
    // Satan said, "If you are the Son of God, tell these stones to become bread.”
    // Jesus replied, "Man shall not live on bread alone, but on every word that comes from the mouth of God."
    Verse("… man shall not live on bread alone, but on …",
          prompts: [Prompt(text: "Hungry for food")],
//          prompts: [Prompt(q: "Bread vs. ___", a: "God's word")],

          clues: [Clue(q: "Book?", a: "Deuteronomy")]),

    // Satan said, "If you are the Son of God, throw yourself down. For it is written: …"
    // Jesus replied, "Do not put the Lord your God to the test."
    Verse("Do not put the Lord your God to the test as you did at Massah.",
          prompts: [Prompt(text: "Asked to prove God's providence", clarifier: "Massah")],
//          prompts: [Prompt(q: "Test God?", a: "No")],

          clues: [Clue(q: "Book?", a: "Deuteronomy")]),


    // Satan said, "bow down and worship me." 
    // Jesus replied, "Worship the Lord your God, and serve him only."
    Verse("Fear the LORD your God, serve him only …",
//          prompts: [Prompt(q: "Fear/worship whom?", a: "Only God")],

          prompts: [Prompt(text: "Told to worship another")],
          clues: [Clue(q: "Book?", a: "Deuteronomy")]),
]
