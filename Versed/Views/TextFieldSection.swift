import SwiftUI

// MARK: - (TextFieldSection(_:text:))
// (Goal) The dev can make sections with a text field in a human-browsable way.
extension TextFieldSection {
    enum SectionType {
        case before, goal, goalBeats, after, reference
    }
    
    // For the given type: configure.
    init(_ type: SectionType, text: Binding<String>) {
        switch type {
        case .before:
            self.headerImage = Image(systemName: AppConstant.SFSymbol.before)
            self.headerLabel = AppConstant.Label.before
            self.infoText = AppConstant.Info.before
            self.textFieldLabel = self.headerLabel
            self.textFieldText = text
            self.textFieldPrompt = AppConstant.Prompt.before
            self.textFieldLineLimit = AppConstant.LineLimit.before...AppConstant.LineLimit.max
        case .goal:
            // (Goal) The user thinks, "I start here, with my goal.
            // I can copy-paste my text into here."
            self.headerImage = Image(systemName: AppConstant.SFSymbol.goalText)
            self.infoText = AppConstant.Info.goal
            self.textFieldLabel = AppConstant.Label.goal
            self.textFieldText = text
            self.textFieldPrompt = AppConstant.Prompt.goal
            self.textFieldLineLimit = AppConstant.LineLimit.goal...AppConstant.LineLimit.max
        case .goalBeats:
            self.headerImage = Image(systemName: AppConstant.SFSymbol.goalText)
            self.headerLabel = AppConstant.Label.goalBeats
            self.infoText = AppConstant.Info.goalBeats
            self.textFieldLabel = self.headerLabel
            self.textFieldText = text
            self.textFieldPrompt = AppConstant.Prompt.goalBeats
            self.textFieldLineLimit = AppConstant.LineLimit.goal...AppConstant.LineLimit.max
        case .after:
            self.headerImage = Image(systemName: AppConstant.SFSymbol.after)
            self.headerLabel = AppConstant.Label.after
            self.infoText = AppConstant.Info.after
            self.textFieldLabel = self.headerLabel
            self.textFieldText = text
            self.textFieldPrompt = AppConstant.Prompt.after
            self.textFieldLineLimit = AppConstant.LineLimit.after...AppConstant.LineLimit.max
        case .reference:
            self.headerImage = Image(systemName: AppConstant.SFSymbol.reference)
            self.headerLabel = AppConstant.Label.reference
            self.textFieldLabel = self.headerLabel
            self.textFieldText = text
            self.textFieldPrompt = AppConstant.Prompt.reference
            self.textFieldLineLimit = AppConstant.LineLimit.reference...AppConstant.LineLimit.max
        }
    }
}

// MARK: - (TextFieldSection)
// (Goal) The dev can DRYly make a section with a header, info button, and text field.
struct TextFieldSection: View {
    // MARK: - (body)
    var body: some View {
        Section() {
            // (Note) Why use TextField vs TextEditor?
            // TextField has a placeholder. (Though TextEditor can be hacked with one: https://www.cephalopod.studio/blog/improving-on-texteditor-in-swiftui)
            // (or here) (tap gesture: https://developer.apple.com/forums/thread/653108)
            // (or here) (ZStack: https://www.martinlasek.com/articles/how-to-add-a-placeholder-to-texteditor)
            TextField(
                textFieldLabel,
                text: textFieldText,
                prompt: Text(textFieldPrompt),
                
                // (Note) (axis: needed for multiline lineLimit().
                axis: .vertical)
            .lineLimit(textFieldLineLimit)
            
            // TODO: - Use GeometryReader?
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
                InfoButton(popoverText: infoText)
                    .opacity(infoText.isEmpty ? 0 : 1)
            }
            // (Goal) The user isn't turned off by ALL CAPS in Form -> Section headings.
            .textCase(nil)
        }
    }
    
    // MARK: - (parameters)
    
    // Header.
    var headerImage: Image
    var headerLabel = String()
    var infoText = String()
    
    // Text field.
    var textFieldLabel: String
    var textFieldText: Binding<String>
    var textFieldPrompt: String
    var textFieldLineLimit: ClosedRange<Int>
}
