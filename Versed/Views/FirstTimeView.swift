import SwiftUI

// MARK: - (FirstTimeView)
struct FirstTimeView: View {
// (goal) (new user knows what to do next)
    // MARK: - (body)
    var body: some View {
        HStack {
            Text(AppConstant.Label.firstTime)
            Image(systemName: AppConstant.SFSymbol.tap)
            Image(systemName: AppConstant.SFSymbol.add)
            // (she thinks, "I start by tapping the matching icon.") (which is in the tab bar)
        }
    }
}

// MARK: - (preview)
#Preview {
    FirstTimeView()
}
