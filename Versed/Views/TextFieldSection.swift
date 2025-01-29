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
            .padding(.bottom, AppConstant.LineLimit.scrollHintPadding)
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
