import SwiftUI

// (Goal) The user thinks, "If I tap here, I'll learn more about X."
// A button with an info icon. Tap the button to show a popover with help text.
struct InfoButton: View {
    var popoverText: String
    @State private var isShowingHelp: Bool = false
    
    var body: some View {
        // (Goal) The user doesn't feel overwhelmed by questions. ("i" vs "?")
        Button(AppConstant.Label.info, systemImage: AppConstant.SFSymbol.info) {
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
