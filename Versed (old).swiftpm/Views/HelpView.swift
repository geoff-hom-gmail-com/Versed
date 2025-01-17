import SwiftUI

struct HelpView: View {
    var body: some View {
        List {
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
                SettingsView()
                
            }
            DisclosureGroup("Donate") {
                Text("TBD")
            }
            DisclosureGroup("Code") {
                // The URL is automatically made into a working link!
                Text("""
                Versed's code is on GitHub:
                
                    https://github.com/geoff-hom-gmail-com/Versed.
                """)
            }
            DisclosureGroup("Contact") {
                Text("""
                Versed was created by:
                
                    Dave Bradley (production)
                    Geoff Hom (design) (code)
                """)
                Text("""
                Feedback may be sent to: 
                
                    (?) geoff.hom@gmail.com? 
                    versed@gmail.com?
                """)
            }

        }
       
    }
}

#Preview {
    HelpView()
}
