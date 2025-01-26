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
                    Label("Help", systemImage: AppConstant.SFSymbol.help)
                }
            AddView()
                .tabItem { 
                    Label("Add", systemImage: AppConstant.SFSymbol.add)
                }
            EncodeView()
                .badge("new")
                .tabItem { 
                    Label("Encode", systemImage: AppConstant.SFSymbol.brain)
                }
            ReciteView()
                .badge("3")
                .tabItem { 
                    Label("Recite", systemImage: AppConstant.SFSymbol.say)
                }
        }
    }
}

// (Goal) The dev can preview the app without the simulator. Includes interaction, subviews, and SwiftData!
#Preview {
    ContentView()
        .modelContainer(for: Verse.self)
}
