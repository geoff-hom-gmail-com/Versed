import SwiftUI

// MARK: - (WelcomeToView)
struct WelcomeToView: View {
// (goal) (user thinks, "This app is for getting text/verses into my brain.")
    // MARK: - (body)
    var body: some View {
        GroupBox(label: Text(AppConstant.Label.welcomeTo)) {
        // (note) (inspired by logo for board game: "Welcome to …")
        // TODO: - (maybe) (use old-school font, angle similar to game) (but not same)
            Spacer()
//                .background(Color.yellow.frame(minWidth: 10))
                // (keep) (goal) (dev can see the vertical spacer)
            Spacer()
            Text(AppConstant.Label.appName)
                .font(.largeTitle)
            Spacer()
            HStack {
                Image(systemName: AppConstant.SFSymbol.goalText)
                Image(systemName: AppConstant.SFSymbol.arrow)
                Image(systemName: AppConstant.SFSymbol.brain)
            }
        }
    }
}

// MARK: - (preview)
#Preview {
    WelcomeToView()
}
