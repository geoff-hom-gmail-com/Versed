import Foundation
import SwiftData

extension Verse {
    //
    // Satan said, "If you are the Son of God, tell these stones to become bread.”
    // Jesus replied, "Man shall not live on bread alone, but on every word that comes from the mouth of God."
    
//          prompts: [Prompt(q: "Bread vs. ___", a: "God's word")],

    static let example1 = Verse("… man shall not live on bread alone, but on …",
                                isExample: true, order: 1,
                                prompts: [Prompt(text: "Hungry for food")],
                                clues: [Clue(q: "Book?", a: "Deuteronomy")])
    
    static func insertExamples(modelContext: ModelContext) {
        // add examples to the model context
        modelContext.insert(example1)
    }
}
