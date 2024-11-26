import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HelpView()
                .tabItem {
                    Label("Help", systemImage: "questionmark.circle")
                }
            Text("AddView")
                .tabItem { 
                    Label("Add", systemImage: "plus.app")
                }
            Text("EncodeView")
                .badge("new")
                .tabItem { 
                    Label("Encode", systemImage: "brain.head.profile")
                }
            Text("ReciteView")
                .badge("3")
                .tabItem { 
                    Label("Recite", systemImage: "mouth")
                }
        }
    }
}

#Preview {
    ContentView()
}
