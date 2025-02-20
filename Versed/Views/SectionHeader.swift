import SwiftUI

// MARK: - (SectionHeader)
struct SectionHeader: View {
// (goal) (dev can DRYly make a section header with info button)
    // MARK: - (body)
    var body: some View {
        HStack {
            Text(image) + Text(" \(label)")
            // (goal) (user sees label only one space from its image) (HStack spacing is wider)

            Spacer()
            InfoButton(popoverText: infoText)
                .opacity(infoText.isEmpty ? 0 : 1)
        }
        .textCase(nil)
        // (goal) (user isn't turned off by ALL CAPS in Form -> Section headings)
    }
    
    // MARK: - (non-views)

    var image: Image
    var label = String()
    var infoText = String()
}
