import SwiftUI

// (Goal) The (new) user knows what to do next.
struct FirstTimeView: View {
    var body: some View {
        // She thinks, "I start by tapping the matching icon." Which is in the tab bar.
        HStack {
            Text("First time?")
            Image(systemName: AppConstant.SFSymbol.tap)
            Image(systemName: AppConstant.SFSymbol.add)
        }
    }
}

#Preview {
    FirstTimeView()
}
