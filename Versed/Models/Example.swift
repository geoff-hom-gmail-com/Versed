import Foundation

// MARK: - (Example)
struct Example: TextModel, Hashable, Identifiable {
// (goal) (user can get tips to format texts)
// (Hashable) (NavigationLink(_:value:) requires)
// (Identifiable) (ForEach requires)
    
    // MARK: - (init(…))
    init(type: String,
         before: String, goal: String, after: String, reference: String,
         tip: String = String()) {
        self.type = type
        self.beforeText = before
        self.goalText = goal
        self.afterText = after
        self.referenceText = reference
        self.tip = tip
    }
    
    // MARK: - (properties)

    let id = UUID()
    
    let type: String
    // (goal) (user sees a list of examples) (she knows what each is for)
    
    let beforeText: String
    let goalText: String
    let afterText: String
    let referenceText: String
    
    let tip: String
    // (goal) (user sees example) (if unclear, the tip helps)
    // (note) (that's why the tip is at the end) (not the start)
}
