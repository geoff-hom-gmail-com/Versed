import SwiftUI

// MARK: - (AdvancedHelpView)
struct AdvancedHelpView: View {
// (goal) (examples didn't answer user's question) (she finds help here)
// (goal) (doesn't distract/overwhelm new user)
    // MARK: - (body)
    var body: some View {
        DisclosureGroup(AppConstant.Label.advancedHelp) {
            // a newbie guide under advanced doesn't make sense; move or remove
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
            // TODO: - (faq) (make view)

//            DisclosureGroup("Settings") {
//                SettingsView()
//                
//            }
            // TODO: - (settings) (add when needed)
            
            DisclosureGroup("Donate") {
                Text("""
                If you wish to support us financially, inquire at: 
                                        
                    
                """) +
                    Text(AppConstant.Email.feedback)
                // (note) (whitespaced so the link is indented)
            }
            DisclosureGroup(AppConstant.Label.code) {
                Text("""
                \(AppConstant.Label.appName)'s code is on GitHub:
                
                    
                """) +
                    Text(AppConstant.URL.repo)
                // (note) (whitespaced so the link is indented)
            }
            DisclosureGroup(AppConstant.Label.contact) {
                Text("""
                \(AppConstant.Label.appName) was created by:
                
                    \(AppConstant.Credit.dave)
                    \(AppConstant.Credit.geoff)
                """)
                Text("""
                Feedback may be sent to: 
                                        
                    
                """) +
                    Text(AppConstant.Email.feedback)
                // (note) (whitespaced so the link is indented)
            }
        }
    }
}
