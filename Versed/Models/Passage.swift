import SwiftUI
import SwiftData

// MARK: - (Passage)
@Model
final class Passage: TextModel {
// (goal) (user can know a custom text)
// (note) (was going to name Text) (but that overwrites Text view) ("Passage" is also a nod to Jason Rohrer)
// (final) (inheritance not considered)
// (class) (SwiftData)
    // MARK: - (instance functions)

    func updateParagraphs(_ context: ModelContext) {
    // (goal) (user can be quizzed on her goal's paragraphs) (independently)
    // (note) (ideally, when goal is updated) (paragraphs would update automatically)
    // (but for now) (have to manually call this)
        let newParagraphs = Paragraph.arrayFrom(goal)
        
        paragraphs.forEach {
            context.delete($0)
        }
        
        paragraphs = newParagraphs

        // TODO: - (fix for multiverse)
        // (ideally for multi-para) (keep dates for unchanged paras)
        // (also TODO let the user easily update the stats manually) (e.g., bring new paras up to neighboring paras)
    }
    
    // MARK: - (properties) (other)
    
    var isNew = true
    // (goal) (user can easily find the text she just added)
    
    var index: Int
    // (goal) (user sees listed texts in consistent order) (she can also reorder)
    // (note) (SwiftData does not preserve array order for objects) (Xcode 16.1)
        
    var beforeCue: String
    
    var goalWithIntervals: String {
    // (goal) (user can see each paragraph, with its interval underneath)
        orderedParagraphs
            .map { $0.text + AppConstant.Text.lineBreak + "(" + $0.intervalAbbr + ")" }
            .joined(separator: AppConstant.Text.paragraphBreak)
    }
    
    var goal: String
    // (note) (tried didSet to call updateParagraphs())
    // (didn't trigger intuitively with bindings)
        
    var afterCue: String
    var notes: String
    
    var orderedParagraphs: [Paragraph] {
    // (goal) (returns paragraphs in text order)
    // (since SwiftData doesn't preserve array order for objects)
        paragraphs.sorted(by: { $0.index < $1.index })
    }
    
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
        self.paragraphs = Paragraph.arrayFrom(goal)
    }
}
