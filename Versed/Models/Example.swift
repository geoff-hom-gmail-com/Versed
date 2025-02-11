import Foundation

// MARK: - (Example)
struct Example: TextModel, Hashable, Identifiable {
// (goal) (user can see examples) (to properly create texts)
// (Hashable) (NavigationLink(_:value:) requires)
// (Identifiable) (ForEach requires)
    // MARK: - (init(…))
    init(type: String,
         beforeCue: String, goal: String, afterCue: String, notes: String,
         tip: String = String()) {
        self.type = type
        self.beforeCue = beforeCue
        self.goal = goal
        self.afterCue = afterCue
        self.notes = notes
        self.tip = tip
    }
    
    // MARK: - (properties)

    let id = UUID()
    
    let type: String
    // (goal) (user sees a list of examples) (she knows what each is for)
    
    let beforeCue: String
    let goal: String
    let afterCue: String
    let notes: String
    
    let tip: String
    // (goal) (user sees example) (if unclear, the tip helps)
    // (note) (that's why the tip is at the end) (not the start)
}
