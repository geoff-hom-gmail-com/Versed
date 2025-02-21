import SwiftUI

// MARK: - (TextFieldSection(type:text:))
extension TextFieldSection {
// (goal) (dev can make a section with a text field) (browsable)
    enum SectionType {
        case beforeCue, goal, goalBeats, afterCue, notes
    }
    
    init(type: SectionType, text: Binding<String>) {
        switch type {
        case .beforeCue:
            headerImage = Image(systemName: AppConstant.SFSymbol.beforeCue)
            headerLabel = AppConstant.Label.beforeCue
            infoText = AppConstant.Info.beforeCue
            textFieldLabel = headerLabel
            self.text = text
            prompt = AppConstant.Prompt.beforeCue
        case .goal:
            headerImage = Image(systemName: AppConstant.SFSymbol.goalText)
            infoText = AppConstant.Info.goal
            textFieldLabel = AppConstant.Label.goal
            self.text = text
            prompt = AppConstant.Prompt.goal
            minLines = AppConstant.LineLimit.goalMin
            maxHeight = AppConstant.LineLimit.textLineX11_5MaxHeight
            // (goal) (user thinks, "I start here, with my goal.
            // I can copy-paste my text into here.")
        case .goalBeats:
            headerImage = Image(systemName: AppConstant.SFSymbol.goalText)
            headerLabel = AppConstant.Label.goalBeats
            infoText = AppConstant.Info.goalBeats
            textFieldLabel = headerLabel
            self.text = text
            prompt = AppConstant.Prompt.goalBeats
            minLines = AppConstant.LineLimit.goalMin
            maxHeight = AppConstant.LineLimit.textLineX11_5MaxHeight
        case .afterCue:
            headerImage = Image(systemName: AppConstant.SFSymbol.afterCue)
            headerLabel = AppConstant.Label.afterCue
            infoText = AppConstant.Info.afterCue
            textFieldLabel = headerLabel
            self.text = text
            prompt = AppConstant.Prompt.afterCue
        case .notes:
            headerImage = Image(systemName: AppConstant.SFSymbol.notes)
            headerLabel = AppConstant.Label.notes
            textFieldLabel = headerLabel
            self.text = text
            prompt = AppConstant.Prompt.notes
            minLines = AppConstant.LineLimit.notesMin
        }
    }
}

// MARK: - (TextFieldSection)
struct TextFieldSection: View {
// (goal) (dev can DRYly make a section with a header, info button, text field)
    // MARK: - (body)
    var body: some View {
        Section(
            header: SectionHeader(image: headerImage, label: headerLabel, infoText: infoText)
        ) {
            TextField(textFieldLabel, text: text, prompt: Text(prompt),
                axis: .vertical)
                // (note) (axis: needed for multiline lineLimit())
            .lineLimit(minLines...)
            // (goal) (user knows she can enter more than just the prompt)

            .frame(maxHeight: maxHeight)
            // (goal) (if the text is long enough to scroll, user knows that)

            // (note) (why TextField, not TextEditor?)
            // (TextField has prompt) (though TextEditor can be hacked with one: https://www.cephalopod.studio/blog/improving-on-texteditor-in-swiftui)
            // (or here) (tap gesture: https://developer.apple.com/forums/thread/653108)
            // (or here) (ZStack: https://www.martinlasek.com/articles/how-to-add-a-placeholder-to-texteditor)
        }
    }
    
    // MARK: - (non-views)
    
    private var headerImage: Image
    private var headerLabel = String()
    private var infoText = String()
    
    private var textFieldLabel: String
    private var text: Binding<String>
    private var prompt: String
    private var minLines = AppConstant.LineLimit.min
    private var maxHeight = AppConstant.LineLimit.textLineX6_5MaxHeight
}
