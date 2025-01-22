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
                    Label("Help", systemImage: AppString.SFSymbol.help)
                }
            AddView()
                .tabItem { 
                    Label("Add", systemImage: AppString.SFSymbol.add)
                }
            EncodeView()
                .badge("new")
                .tabItem { 
                    Label("Encode", systemImage: AppString.SFSymbol.brain)
                }
            ReciteView()
                .badge("3")
                .tabItem { 
                    Label("Recite", systemImage: AppString.SFSymbol.say)
                }
        }
    }
}

// (Goal) The dev can preview the app without the simulator. Includes interaction, subviews, and SwiftData!
#Preview {
    ContentView()
        .modelContainer(for: Verse.self)
}
