import SwiftUI

// (Goal) The user thinks, "This app is for getting text/verses into my brain."
struct WelcomeToView: View {
    var body: some View {
        // Inspired by "Welcome to …" board games.
        // (toDo) Maybe old-school font.
        GroupBox(label: Text("Welcome to …")) {
            Spacer()
            // (Keep) The dev can see the Spacer.
//                .background(Color.yellow.frame(minWidth: 10))

            Spacer()
//                .background(Color.blue.frame(minWidth: 10))
            Text("Versed")
                .font(.title)
                .scaleEffect(1.4)
            Spacer()
//                .background(Color.blue.frame(minWidth: 10))
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
