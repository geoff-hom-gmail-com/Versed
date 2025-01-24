import SwiftUI

// (Goal) The user thinks, "If I tap here, I'll learn more about X."
// A button with an info icon. Tap the button to show a popover with help text.
struct InfoButton: View {
    var popoverText: String
    @State private var isShowingHelp: Bool = false
    
    var body: some View {
        // (todo) how to make popover text textcase nil?
        Button(AppString.Label.info, systemImage: AppString.SFSymbol.info) {
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
