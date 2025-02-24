import SwiftUI

// MARK: - (AdvancedHelpView)
struct AdvancedHelpView: View {
// (goal) (examples didn't answer user's question) (she finds help here)
// (goal) (doesn't distract/overwhelm new user)
    // MARK: - (body)
    var body: some View {
        DisclosureGroup(AppConstant.Label.advancedHelp) {
            FAQView()
//            settings
            contact
            donate
            credits
            code
        }
    }
    
    // MARK: - (views) (convenience)

//    @ViewBuilder
//    var settings: some View {
//        DisclosureGroup("Settings") {
//        }
//    }
    // TODO: - (settings) (add when needed)

    @ViewBuilder
    var contact: some View {
        DisclosureGroup(AppConstant.Label.contact) {
            Text("""
            Feedback may be sent to: 
                                    
                
            """) +
            Text(AppConstant.Email.feedback)
            // (note) (whitespaced so the link is indented)
        }
    }
    
    @ViewBuilder
    var donate: some View {
        DisclosureGroup(AppConstant.Label.donate) {
            Text("""
            To support us financially, inquire at: 
                                    
                
            """) +
            Text(AppConstant.Email.feedback)
            // (note) (whitespaced so the link is indented)
        }
    }
    
    @ViewBuilder
    var credits: some View {
        DisclosureGroup(AppConstant.Label.credits) {
            Text("""
            \(AppConstant.Label.appName) was created by:
            
                \(AppConstant.Credit.dave)
                \(AppConstant.Credit.geoff)
            """)
            // TODO: - (finish)
        }
    }
    
    @ViewBuilder
    var code: some View {
        DisclosureGroup(AppConstant.Label.code) {
            Text("""
            \(AppConstant.Label.appName)'s code is on GitHub:
            
                
            """) +
            Text(AppConstant.URL.repo)
            // (note) (whitespaced so the link is indented)
        }
    }
}
