import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            DebugView()
                .tabItem {
                    Text("Debug")
                }
            HelpView()
                .tabItem {
                    Label("Help", systemImage: "questionmark.circle")
                }
            AddView()
                .tabItem { 
                    Label("Add", systemImage: "plus.app")
                }
            EncodeView()
                .badge("new")
                .tabItem { 
                    Label("Encode", systemImage: "brain.head.profile")
                }
            ReciteView()
                .badge("3")
                .tabItem { 
                    Label("Recite", systemImage: "mouth")
                }
        }
    }
}

// (Goal) The dev can preview the app without the simulator. Includes interaction, subviews, and SwiftData!
#Preview {
    ContentView()
        .modelContainer(for: Verse.self)
}
