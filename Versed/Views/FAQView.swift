import SwiftUI

// MARK: - (FAQView)
struct FAQView: View {
// (goal) (user has questions) (gets answers)
// (goal) (user forgets info that is in app description on App Store) (can get same info here)
    // MARK: - (body)
    var body: some View {
        DisclosureGroup(AppConstant.Label.faq) {
            DisclosureGroup(AppConstant.FAQ.whatQ) {
                Text(AppConstant.FAQ.whatA)
            }
            DisclosureGroup(AppConstant.FAQ.howQ) {
                Text(AppConstant.FAQ.howA)
            }
            DisclosureGroup(AppConstant.FAQ.codeQ) {
                Text(AppConstant.FAQ.codeA)
            }
        }
    }
}

// TODO: - (newbie guide??)
// a newbie guide under advanced doesn't make sense; move or remove
//            DisclosureGroup("Newbie Guide") {
//                Text("""
//                1. Add a verse.
//                2. Encode it in your mind.
//                3. Recite it.
//                    a. When notified, test. Not before.
//                """)
//            }

// MARK: - (preview)
#Preview {
    FAQView()
}
