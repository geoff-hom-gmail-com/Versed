import SwiftUI

// MARK: - (AdvancedHelpView)
struct AdvancedHelpView: View {
// (goal) (examples didn't answer user's question) (she finds help here)
// (goal) (doesn't distract/overwhelm new user)
    // MARK: - (body)
    var body: some View {
        DisclosureGroup(AppConstant.Label.advancedHelp) {
            FAQView()

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
