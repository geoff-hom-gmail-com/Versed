// MARK: - (TextModel)
protocol TextModel {
// (Goal) The user can know a custom text.

    var beforeText: String { get }
    // (Goal) The user can see a cue: what's before her text.

    var goalText: String { get }
    // (Goal) The text can be arbitrary length. With arbitrary formatting / line breaks.
    // TODO: - (user can style text to help learn)
    // (e.g., bold, italic) (any part, not just all or none)
    
    var afterText: String { get }
    // (Goal) The user can see a cue: what's after her text.

    var referenceText: String { get }
    // (Goal) The user can see notes about her text. Including the source/reference.
}
