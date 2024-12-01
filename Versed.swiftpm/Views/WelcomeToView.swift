import SwiftUI

// Inspired by "Welcome to …" board games. So, "Welcome to …" rising to the right. Maybe old-school font. 
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
