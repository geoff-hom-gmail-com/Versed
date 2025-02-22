import SwiftUI

// MARK: - (FAQView)
struct FAQView: View {
// (goal) (user has questions) (gets answers)
// (goal) (user forgets info that is in app description on App Store) (can get same info here)
    // MARK: - (body)
    var body: some View {
        DisclosureGroup(AppConstant.Label.faq) {
            DisclosureGroup("<question 1 here>") {
                Text("<answer here>")
            }
            DisclosureGroup("<question 2 here>") {
                Text("<answer here>")
            }
        }
        // TODO: - (finish this)
    }
}

// a newbie guide under advanced doesn't make sense; move or remove
//            DisclosureGroup("Newbie Guide") {
//                Text("""
//                1. Add a verse.
//                2. Encode it in your mind.
//                3. Recite it.
//                    a. When notified, test. Not before.
//                """)
//            }
