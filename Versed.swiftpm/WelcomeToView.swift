import SwiftUI

struct WelcomeToView: View {
    var body: some View {
        GroupBox(label: Text("Welcome to …")) {
            Text("Versed")
                .font(.title)
        }
    }
}

#Preview {
    WelcomeToView()
}
