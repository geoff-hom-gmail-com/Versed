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

// The preview crashes because the data model (Verses) isn't in the environment. Would have to init it. And later also work with SwiftData. 
//#Preview {
//    ContentView()
//        .environment(verses)
//}
