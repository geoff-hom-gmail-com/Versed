import SwiftUI

// why observ?
//class DataModel: ObservableObject {

class DataModel {
    // what does @Published property wrapper do?
    @Published var myVerses: [Verse] = []
    @Published var exampleVerses: [Verse] = []
    
    // since this is let, what does that mean? can we still change data inside?
    static let shared: DataModel = DataModel()
    
    private init() {
//        myVerses = tempMyVerses
        exampleVerses = builtInExamples
    }
}

let tempMyVerses: [Verse] = [
    Verse(text: "For God so loved …")
]

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
