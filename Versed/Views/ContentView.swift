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
                    Label(AppConstant.Label.help, systemImage: AppConstant.SFSymbol.help)
                }
            AddView()
                .tabItem { 
                    Label(AppConstant.Label.add, systemImage: AppConstant.SFSymbol.add)
                }
            TextsView()
//                .badge(AppConstant.Badge.new)
                .tabItem {
                    Label(AppConstant.Label.texts, systemImage: AppConstant.SFSymbol.goalText)
                }
            ReciteView()
//                .badge("2")
                .tabItem {
                    Label(AppConstant.Label.know, systemImage: AppConstant.SFSymbol.brain)
                }
        }
    }
}

// (Goal) The dev can preview the app without the simulator. Includes interaction, subviews, and SwiftData!
#Preview {
    ContentView()
    // todo deprecate verse?
        .modelContainer(for: [Passage.self, Verse.self])
//        .modelContainer(for: Passage.self)
}
