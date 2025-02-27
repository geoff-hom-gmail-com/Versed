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
            Text(AppConstant.Email.feedback)
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
            Text(AppConstant.Credit.credits)
        }
    }
}
