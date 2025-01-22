import SwiftUI

// Inspired by "Welcome to …" board games.
// (toDo) So, "Welcome to …" rising to the right. Maybe old-school font.
struct WelcomeToView: View {
    var body: some View {
        GroupBox(label: Text("Welcome to …")) {
            Text("Versed")
                .font(.title)
            HStack {
                Image(systemName: AppString.SFSymbol.text)
                Image(systemName: AppString.SFSymbol.arrow)
                Image(systemName: AppString.SFSymbol.brain)
            }
        }
    }
}

#Preview {
    WelcomeToView()
}
