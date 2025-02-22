import SwiftUI

// MARK: - (HelpView)
struct HelpView: View {
// (goal) (user sees welcoming start)
// (goal) (examples didn't answer user's question) (she finds help here)
    // MARK: - (body)
    var body: some View {
        List {
            WelcomeToView()
            FirstTimeView()
            AdvancedHelpView()
        }
    }
}

// MARK: - (preview)
#Preview {
    HelpView()
}
