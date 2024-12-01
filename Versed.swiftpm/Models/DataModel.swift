import SwiftUI

// why observ?
//class DataModel: ObservableObject {

class DataModel {
    @Published var myVerses: [Verse] = []
    @Published var exampleVerses: [Verse] = []
    
    static let shared: DataModel = DataModel()
    
    private init() {
//        myVerses = tempMyVerses
        exampleVerses = builtInExamples
    }
}

let tempMyVerses: [Verse] = [
    Verse(text: "For God so loved …")
]

// hmm I may be confusing prompts with jogs/clues. Prompts are what we use to prompt recitation. Jogs/clues are if we get stuck. But we can have multiple prompts, since the same verse can be triggered multiple ways. 
// Jogs/clues should be Q&A, but not prompts. They would be just prompts, or perhaps with specifiers
let builtInExamples: [Verse] = [
    // Satan said, "If you are the Son of God, tell these stones to become bread.”
    // Jesus replied, "Man shall not live on bread alone, but on every word that comes from the mouth of God."
    Verse(text: "… man shall not live on bread alone, but on …",
          prompts: [Prompt(text: "Hungry for food")],
//          prompts: [Prompt(q: "Bread vs. ___", a: "God's word")],

          clues: [Clue(q: "Book?", a: "Deuteronomy")]),

    // Satan said, "If you are the Son of God, throw yourself down. For it is written: …"
    // Jesus replied, "Do not put the Lord your God to the test."
    Verse(text: "Do not put the Lord your God to the test as you did at Massah.",
          prompts: [Prompt(text: "Asked to prove God's providence", clarifier: "Massah")],
//          prompts: [Prompt(q: "Test God?", a: "No")],

          clues: [Clue(q: "Book?", a: "Deuteronomy")]),


    // Satan said, "bow down and worship me." 
    // Jesus replied, "Worship the Lord your God, and serve him only."
    Verse(text: "Fear the LORD your God, serve him only …",
//          prompts: [Prompt(q: "Fear/worship whom?", a: "Only God")],

          prompts: [Prompt(text: "Told to worship another")],
          clues: [Clue(q: "Book?", a: "Deuteronomy")]),
]
