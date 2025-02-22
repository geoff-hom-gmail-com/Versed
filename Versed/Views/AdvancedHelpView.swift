import SwiftUI

// MARK: - (AdvancedHelpView)
struct AdvancedHelpView: View {
// (goal) (examples didn't answer user's question) (she finds help here)
// (goal) (doesn't distract/overwhelm new user)
    // MARK: - (body)
    var body: some View {
        // ToDO: eventually all this should be localized
        DisclosureGroup("Advanced Help") {
            // a newbie guide under advanced doesn't make sense; we may move this or remove
//            DisclosureGroup("Newbie Guide") {
//                Text("""
//                1. Add a verse.
//                2. Encode it in your mind.
//                3. Recite it.
//                    a. When notified, test. Not before.
//                """)
//            }
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
                
                    versed.feedback@gmail.com
                """)
            }
        }
    }
}
