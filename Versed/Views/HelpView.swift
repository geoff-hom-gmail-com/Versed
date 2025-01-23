import SwiftUI

// (Goal) If the user has an app question, she can get help here.
// (MVP) Experts only (not tech newbs) (not learning newbs) (not even newbs to this app =)
struct HelpView: View {
    var body: some View {
        List {
            WelcomeToView()
            FirstTimeView()
            HelpAdvancedView()
        }
    }
}

#Preview {
    HelpView()
}
