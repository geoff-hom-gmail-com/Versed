import SwiftUI

// (Goal) The dev can DRYly use a section with a header, info button, and text field.
struct TextFieldSection: View {
    var headerImage: Image
    var headerLabel = String()
    var infoText = String()
    
    var textFieldLabel: String
    var textFieldText: Binding<String>
    var textFieldPrompt: String
    var textFieldLineLimit: ClosedRange<Int>
    
    var body: some View {
        Section() {
            // (Note) Why use TextField vs TextEditor? TextField is a rounded rectangle. TextField  has a placeholder.
            TextField(
                textFieldLabel,
                text: textFieldText,
                prompt: Text(textFieldPrompt),
                
                // (Note) (axis: needed for multiline lineLimit().
                axis: .vertical)
            .lineLimit(textFieldLineLimit)
            
            // (Keep) (Goal) If the text is long enough to scroll, the user knows that.
            // (Note) The plan was to use negative padding, so that the last line would be partly hidden. Thus, the user would know she can scroll.
            // However, this should be used only when text is truncated. Else, non-truncated text is cut off at the end.
            // There's no built-in solution for this (as of Xcode 16.1). We could use GeometryReader to tell if text is truncated. (MVP-post?)
//            .padding(.bottom, AppConstant.LineLimit.scrollHintPadding)
        } header: {
            HStack {
                // (Goal) The user sees the image only one space from its label. (HStack spacing is wider.)
                Text(headerImage) + Text(" \(headerLabel)")
                Spacer()
                if !infoText.isEmpty {
                    InfoButton(popoverText: infoText)
                }
            }
            // (Goal) The user isn't turned off by ALL CAPS in Form -> Section headings.
            .textCase(nil)
        }
    }
}
