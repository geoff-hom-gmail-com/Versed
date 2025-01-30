import SwiftUI
import SwiftData

// (Goal) The user sees the starting tab. She can go to other tabs.
// (Note) The Apple template calls this ContentView, so leaving as-is.
struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    
    // (Goal) The app can tell if any user texts are new.
    @Query(filter: #Predicate<Passage> {
        $0.isExample == false && $0.isNew == true
    })
    private var userTextsNew: [Passage]
    
    // (Goal) ??
    // KISS query for passagees non-ex first, then filter for paragraphs
//    @Query(filter: #Predicate<Paragraph> {
//        $0.passage.isExample == false
//    })
//    private var userParagraphs: [Paragraph]
    
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
                // (Goal) The user adds a text. Then, she has a hint where to go next.
                .badge(userTextsNew.isEmpty ? nil : AppConstant.Badge.new)
                .tabItem {
                    Label(AppConstant.Label.texts, systemImage: AppConstant.SFSymbol.goalText)
                }
            // todo: make new KnowView()
            KnowView()
                .tabItem {
                    Label(AppConstant.Label.know, systemImage: AppConstant.SFSymbol.brain)
                }
            // (todo) (Goal) The user knows how many quizzes are ready.
            // (state, not event) (we want all user texts, or at least paragraphs) (the number due is the badge) (or nil)
            // we could maybe just query all paragraphs; except we'd need to avoid examples
            
//                .badge(
            //                .badge("2")

            ReciteView()
                .tabItem {
                    Label("recite", systemImage: AppConstant.SFSymbol.brain)
                }
        }
    }
}

#Preview {
    ContentView()
    // todo deprecate verse?
//        .modelContainer(for: [Passage.self, Verse.self])
        .modelContainer(for: Passage.self)
}
