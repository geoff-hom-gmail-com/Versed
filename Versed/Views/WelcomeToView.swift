import SwiftUI

// (Goal) The user thinks, "This app is for getting text/verses into my brain."
struct WelcomeToView: View {
    var body: some View {
        // Inspired by "Welcome to …" board games.
        // (toDo) Maybe old-school font.
        GroupBox(label: Text("Welcome to …")) {
            Spacer()
            // (Keep) (Goal) The dev can see the vertical Spacer.
//                .background(Color.yellow.frame(minWidth: 10))

            Spacer()
//                .background(Color.blue.frame(minWidth: 10))
            Text("Versed")
                .font(.largeTitle)
//                .font(.system(size: 36))
            Spacer()
//                .background(Color.blue.frame(minWidth: 10))
            HStack {
                Image(systemName: AppConstant.SFSymbol.goalText)
                Image(systemName: AppConstant.SFSymbol.arrow)
                Image(systemName: AppConstant.SFSymbol.brain)
            }
        }
    }
}

#Preview {
    WelcomeToView()
}
