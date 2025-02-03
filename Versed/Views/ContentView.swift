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
    
    // (Goal) The app can get all user paragraphs.
    @Query(filter: #Predicate<Passage> {
        $0.isExample == false
    })
    private var userTexts: [Passage]
    
    // ?? (todo) figure this out more after we have actual paragraphs and isDue
    // isDue should be state, but then how often does it check? this tab view is always around, but it can't/shouldn't check every ms, should it?
    // I guess we can check when we add a text. When we update text. And then every … minute??
    private var userParagraphs: [Paragraph] {
        print("userParagraphs computed")
        return userTexts.flatMap { $0.paragraphs }
    }
    
    private var userParagraphsDue: Int {
        print("userParagraphsuserParagraphsDue computed")
        let paragraphs = userTexts.flatMap { $0.paragraphs }
        return paragraphs
            .filter { $0.dueDate < Date.now }
            .count
//        return userTexts.flatMap { $0.paragraphs }
    }
    
    var body: some View {
        TabView {
            Tab("Debug", systemImage: "") {
                DebugView()
            }
            Tab(AppConstant.Label.help, systemImage: AppConstant.SFSymbol.help) {
                HelpView()
            }
            Tab(AppConstant.Label.add, systemImage: AppConstant.SFSymbol.add) {
                AddView()
            }
            // HelpView().tabConfig(.help)
            // (no) HelpTab (struct below?)
            // (maybe) Tab.for(.help) (ext below?)
            // (or just) @ViewBuilder for each?) (eg https://www.reddit.com/r/SwiftUI/comments/1do397m/is_it_worth_splitting_big_view_into_smaller/)

//            TextsView()
//                // (Goal) The user adds a text. Then, she has a hint where to go next.
//                .badge(userTextsNew.isEmpty ? nil : AppConstant.Badge.new)
//                .tabItem {
//                    Label(AppConstant.Label.texts, systemImage: AppConstant.SFSymbol.goalText)
//                }
//            // todo: make new KnowView()
//            KnowView()
//                .badge(userParagraphsDue)
//                .tabItem {
//                    Label(AppConstant.Label.know, systemImage: AppConstant.SFSymbol.brain)
//                }
//            // (todo) (Goal) The user knows how many quizzes are ready.
//            // (state, not event) (we want all user texts, or at least paragraphs) (the number due is the badge) (or nil)
//            // we could maybe just query all paragraphs; except we'd need to avoid examples
//            
////                .badge(
//            //                .badge("2")
//
//            ReciteView()
//                .tabItem {
//                    Label("recite", systemImage: AppConstant.SFSymbol.brain)
//                }
        }
    }
}

#Preview {
    ContentView()
    // todo deprecate verse?
//        .modelContainer(for: [Passage.self, Verse.self])
        .modelContainer(for: Passage.self)
}

//enum TabConfig {
//    case help
//}
//
//extension View {
//    func tab() -> some View {
//        self.tabItem(<#T##label: () -> View##() -> View#>)
//    }
//}
