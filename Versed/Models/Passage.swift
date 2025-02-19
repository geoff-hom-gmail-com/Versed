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

    func updateParagraphs(_ context: ModelContext) {
    // (goal) (user can be quizzed on her goal's paragraphs) (independently)
    // (note) (ideally, when goal is updated) (paragraphs would update automatically)
    // (but for now) (have to manually call this)
        let newParagraphs = Paragraph.arrayFrom(goal)
//        let rawParagraphs = goal.components(separatedBy: AppConstant.Text.paragraphBreak)
//        print("(Passage) (updateParagraphs) \(rawParagraphs.count) \(rawParagraphs)")
        
        paragraphs.forEach {
            context.delete($0)
        }
        
//        paragraphs = rawParagraphs.map { Paragraph(text: $0) }
        paragraphs = newParagraphs
        
        print("  (Passage) (updateParagraphs) \(self.paragraphs.first?.passage?.goal)")

        // TODO: - (fix for multiverse)
        // (wait for multiverse quizzes)
        // (ideally for multi-para) (keep dates for unchanged paras)
        // (also TODO let the user easily update the stats manually) (e.g., bring new paras up to neighboring paras)
    }
    
    // MARK: - (properties)
    
    var isNew = true
    // (goal) (user can easily find the text she just added)
    
    var index: Int
    // (goal) (user sees listed texts in consistent order) (she can also reorder)
    // (note) (SwiftData does not store array order for model objects)
        
    var beforeCue: String
    
    var goal: String
    // (note) (tried didSet to call updateParagraphs())
    // (didn't trigger intuitively with bindings)
        
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

//        let paragraphs = Paragraph.arrayFrom(goal)
//        print("  (Passage) (init2) \(paragraphs.first?.passage?.notes)")

//        let rawParagraphs = goal.components(separatedBy: AppConstant.Text.paragraphBreak)
//        self.paragraphs = rawParagraphs.map { Paragraph(text: $0) }
        
        self.paragraphs = Paragraph.arrayFrom(goal)
        // TODO: - (DRY)
//        print("(Passage) (init) \(rawParagraphs.count) \(rawParagraphs)")
        print("  (Passage) (init) \(self.paragraphs.first?.passage?.notes)")
    }
}
