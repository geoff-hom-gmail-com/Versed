import SwiftUI

@main
struct VersedApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
//                .modelContainer(for: Passage.self)
            // todo deprecate Verse?
                .modelContainer(for: [Passage.self, Verse.self])
        }
    }
}
