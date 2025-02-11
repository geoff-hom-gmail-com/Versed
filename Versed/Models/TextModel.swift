// MARK: - (TextModel)
protocol TextModel {
// (goal) (user can know a custom text)

    var beforeCue: String { get }
    // (goal) (user can see a cue) (what's before her text)
    // (notes) (no setter) (because examples are constant)

    var goal: String { get }
    // (goal) (the text can be arbitrary length) (with arbitrary formatting, line breaks)
    // TODO: - (user can style text to help learn)
    // (e.g., bold, italic) (any part, not just all or none)
    
    var afterCue: String { get }
    // (goal) (user can see a cue) (what's after her text)

    var notes: String { get }
    // (goal) (user can see notes about her text) (including source/reference)
}
