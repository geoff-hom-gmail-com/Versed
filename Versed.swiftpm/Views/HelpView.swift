import SwiftUI

struct HelpView: View {
    var body: some View {
        List {
//            Text("Help")
            WelcomeToView()
            // note: eventually all this should be localized
            DisclosureGroup("Newbie Guide") {
                Text("""
                1. Add a verse.
                2. Encode it in your mind.
                3. Recite it.
                    a. When notified, test. Not before.
                """)
            }
            DisclosureGroup("FAQ") {
                DisclosureGroup("<question 1 here>") {
                    Text("<answer here>")
                }
                DisclosureGroup("<question 2 here>") {
                    Text("<answer here>")
                }
            }
            DisclosureGroup("Settings") {
                // if this fails to stick, may need to be outside body; also, want to store these persistently pre-MVP
                @State var vibrateOnRing = true
                @State var toggleSetting2 = false

                // use Form? SettingsView
                Toggle(isOn: $toggleSetting2) {
                    Text("hmm")
                }
                Toggle(isOn: $vibrateOnRing) {
                    Text("hmm2")
                }
            }
            DisclosureGroup("Donate") {
                Text("TBD")
            }
            DisclosureGroup("Code") {
                Text("This app's code is available on GitHub: <link>.")
            }
            DisclosureGroup("Contact") {
                Text("TBD")
            }

        }
       
    }
}

#Preview {
    HelpView()
}
