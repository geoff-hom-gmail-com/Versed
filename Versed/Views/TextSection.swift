import SwiftUI

// MARK: - (TextSection(type:text:))
extension TextSection {
// (goal) (dev can make a section with text) (browsable)
    enum SectionType {
        case beforeCue, goalBeats, afterCue, notes, tip
    }
    
    init(type: SectionType, text: String) {
        switch type {
        case .beforeCue:
            headerImage = Image(systemName: AppConstant.SFSymbol.beforeCue)
            headerLabel = AppConstant.Label.beforeCue
            infoText = AppConstant.Info.beforeCue
            self.text = text
        case .goalBeats:
            headerImage = Image(systemName: AppConstant.SFSymbol.goalText)
            headerLabel = AppConstant.Label.goalBeats
            infoText = AppConstant.Info.goalBeats
            self.text = text
            maxHeight = AppConstant.LineLimit.textLineX11_5MaxHeight
        case .afterCue:
            headerImage = Image(systemName: AppConstant.SFSymbol.afterCue)
            headerLabel = AppConstant.Label.afterCue
            infoText = AppConstant.Info.afterCue
            self.text = text
        case .notes:
            headerImage = Image(systemName: AppConstant.SFSymbol.notes)
            headerLabel = AppConstant.Label.notes
            self.text = text
        case .tip:
            headerImage = Image(systemName: AppConstant.SFSymbol.tip)
            headerLabel = AppConstant.Label.tip
            self.text = text
        }
    }
}

// MARK: - (TextSection)
struct TextSection: View {
// (goal) (dev can DRYly make a section with a header, info button, text)
    // MARK: - (body)
    var body: some View {
        Section(
            header: SectionHeader(image: headerImage, label: headerLabel, infoText: infoText)
        ) {
            ScrollView {
                Text(text)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxHeight: maxHeight)
            // (goal) (if the text is long enough to scroll, user knows that)
        }
    }
    
    // MARK: - (non-views)
    
    private var headerImage: Image
    private var headerLabel = String()
    private var infoText = String()
    
    private var text: String
    private var maxHeight = AppConstant.LineLimit.textLineX6_5MaxHeight
}
