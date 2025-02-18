import SwiftUI
import SwiftData

// MARK: - (Passage)
@Model
final class Passage: TextModel {
// (goal) (user can know a custom text)
// (note) (was going to name Text) (but that overwrites Text view) ("Passage" is also a nod to Jason Rohrer)
// (final) (inheritance not considered)
// (class) (SwiftData)
    // MARK: - (functions)

    func updateParagraphs() {
    // (goal) (user can be quizzed on her goal's paragraphs) (independently)
        // ??
        
//        if let context = ModelContext(self) {
//                    for paragraph in paragraphs {
//                        context.delete(paragraph) // Mark for deletion
//                    }
//                }
        
//        paragraphs.removeAll()
        paragraphs = [Paragraph]()
        // (ugh we have to think this thru a bit)
        // (if it's just one para, we just replace it)
        // (but with multipara) (we want to keep the stats on the unchanged paras)
        // (or a hack is to just replace all paras and stats) (and let the user easily update the stats manually)
        
        // (and do we have to make paragraph.passage opt? don't fight the framework??
        
        print("(Passage) (updateParagraphs)")

        let rawParagraphs = goal.components(separatedBy: "\n\n")
        print("(Passage) (updateParagraphs) \(rawParagraphs.count) \(rawParagraphs)")
        
        let tempPara = rawParagraphs.map { Paragraph(passage: self, text: $0) }
        
        print("(Passage) (updateParagraphs) \(tempPara)")

        
        paragraphs = tempPara
        
        print("(Passage) (updateParagraphs) 4")

//        paragraphs = rawParagraphs.map { Paragraph(text: $0) }
        // (note) (keep) (if Paragraph.passage optional)
    }
    
    // MARK: - (properties)
    
    var isNew = true
    // (goal) (user can easily find the text she just added)
    
    var index: Int
    // (goal) (user sees listed texts in consistent order) (she can also reorder)
    // (note) (SwiftData does not store array order for model objects)
        
    var beforeCue: String
    
    var goal: String
    // (note) (tried using didSet to call updateParagraphs())
    // (but didn't seem to trigger intuitively with bindings)
    
    // (check when called) (init?) (updateText?)
    
    var afterCue: String
    var notes: String
    
    @Relationship(deleteRule: .cascade, inverse: \Paragraph.passage)
    var paragraphs: [Paragraph] = [Paragraph]()
    // (goal) (user can be quizzed on each paragraph in a text) (independently)
    // (note) (default value) (so in init(), we can pass self)

    // MARK: - (init())
    init(
    // (note) (text fields may be empty) (user can edit later)
        index: Int = 0,
        beforeCue: String = String(),
        goal: String = String(),
        afterCue: String = String(),
        notes: String = String()
    ) {
        self.index = index
        self.beforeCue = beforeCue
        self.goal = goal
        self.afterCue = afterCue
        self.notes = notes
        
        let rawParagraphs = goal.components(separatedBy: "\n\n")
//        print("(Passage) (rawParagraphs) \(rawParagraphs.count) \(rawParagraphs)")
        
        self.paragraphs = rawParagraphs.map { Paragraph(passage: self, text: $0) }
        
//        self.paragraphs = rawParagraphs.map { Paragraph(text: $0) }
        // (note) (keep) (if Paragraph.passage optional)
    }
}
