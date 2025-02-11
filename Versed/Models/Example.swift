// MARK: - (Example)
struct Example: TextModel, Hashable {
// (Goal) The user can learn how to format passages. Via examples.
// (Hashable) Required by NavigationLink(_:value:).
    
    // MARK: - (init())
    init(type: String, tip: String = String(), before: String, goal: String, after: String, reference: String) {
        self.type = type
        self.tip = tip
        self.beforeText = before
        self.goalText = goal
        self.afterText = after
        self.referenceText = reference
    }
    
    // MARK: - (properties)

    // todo: add fields for examples, like tips and title/type
    
    let type: String
    // (Goal) The user sees a different example for each use case.
    
    let tip: String
    // (Goal)
    
    let beforeText: String
    let goalText: String
    let afterText: String
    let referenceText: String
    
    
}
