import SwiftUI

// A button with a help icon. Tap the button to show a popover with help text.
// (ToDo) deprecate? (use InfoButton instead)
struct HelpButton: View {
    var popoverText: String
    @State private var isShowingHelp: Bool = false
    
    var body: some View {
        Button("Help", systemImage: "questionmark.circle") {
            self.isShowingHelp = true
        }
        .labelStyle(.iconOnly)
        .popover(isPresented: $isShowingHelp) {
            Text(popoverText)
                .padding()
                .presentationCompactAdaptation(.popover)
        }
    }
}
