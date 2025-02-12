import SwiftUI

// MARK: - (VersedApp)
@main
struct VersedApp: App {
// (goal) (user can know text of arbitrary length) (via memorization)
    // MARK: - (body)
    var body: some Scene {
        WindowGroup {
            MainView()
                .modelContainer(for: Passage.self)
//                .modelContainer(for: [Passage.self, Verse.self])
            // TODO: - (after vert slice) (tidy out Verse et al.)
        }
    }
}
