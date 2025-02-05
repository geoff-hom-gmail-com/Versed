import SwiftUI
import SwiftData

// (Goal) The user sees the starting tab. She can go to other tabs.
// (Note) The Xcode template calls this ContentView, so leaving as-is.
struct ContentView: View {
    // MARK: - (body)
    
    var body: some View {
        TabView {
            DebugView().withTab(.debug)
            HelpView().withTab(.help)
            AddView().withTab(.add)
            TextsView().withTab(.texts)
                // (Goal) The user adds a text. Then, she sees a hint where to go next.
                .badge(ifNewTexts)
            KnowView().withTab(.know)
                // (Goal) The user knows how many quizzes are ready.
            
                // TODO: - when texts edit fixed, switch
                .badge(2)
//                .badge(paragraphsDue)
            
            // TODO: - when reciteview deprecated, remove
//            ReciteView()
//                .tabItem {
//                    Label("recite", systemImage: AppConstant.SFSymbol.brain)
//                }
        }
    }
    
    // MARK: - (badge) (if new texts)
    
    private var ifNewTexts: Text? {
        let hasNewTexts = !newTexts.isEmpty
        
        // (Note) For nil, use Text() not String():
        // (bug) (https://developer.apple.com/forums/thread/766000)
        return hasNewTexts ? Text(AppConstant.Badge.new) : nil
    }
    
    @Query(filter: #Predicate<Passage> {
        $0.isExample == false && $0.isNew == true
    })
    private var newTexts: [Passage]

    // MARK: - (badge) (paragraphs due)
    
    // TODO: - check if updates in realtime
    // (e.g. due in 10"; does it change in 10"?)
    // (if not, set timer to check every x" and then once working, make it 60")
    private var paragraphsDue: Int {
        // TODO: - (when working) (delete)
        print("paragraphsDue computed")
        
        let paragraphs = userTexts.flatMap { $0.paragraphs }
        return paragraphs
            .filter { $0.dueDate < Date.now }
            .count
    }
    
    @Query(filter: #Predicate<Passage> {
        $0.isExample == false
    })
    private var userTexts: [Passage]
}

// MARK: - (withTab(_:))

// (Goal) The dev can use tabs in a human-browsable way.
private extension View {
    func withTab(_ config: TabConfig) -> Tab<Never, Self, DefaultTabLabel> {
        switch config {
        case .debug:
            Tab(AppConstant.Label.debug, systemImage: String()) { self }
        case .help:
            Tab(AppConstant.Label.help, systemImage: AppConstant.SFSymbol.help) { self }
        case .add:
            Tab(AppConstant.Label.add, systemImage: AppConstant.SFSymbol.add) { self }
        case .texts:
            Tab(AppConstant.Label.texts, systemImage: AppConstant.SFSymbol.goalText) { self }
        case .know:
            Tab(AppConstant.Label.know, systemImage: AppConstant.SFSymbol.brain) { self }
        }
    }
}

private enum TabConfig {
    case debug, help, add, texts, know
}

// MARK: - (preview)

#Preview {
    ContentView()
    
    // TODO: - when verse deprecated, remove
//        .modelContainer(for: [Passage.self, Verse.self])
    
        .modelContainer(for: Passage.self)
}
