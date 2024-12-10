import SwiftUI

@main
struct VersedApp: App {
    @State private var verses = Verses()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
//                .modelContainer(for: Verses.self)
                .environment(verses)
        }
    }
}
