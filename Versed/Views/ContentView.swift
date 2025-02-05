import SwiftUI
import SwiftData

// (Goal) The user sees the starting tab. She can go to other tabs.
// (Note) The Xcode template calls this ContentView, so leaving as-is.
struct ContentView: View {
    // MARK: - (body)
    
    var body: some View {
        TabView {
            DebugView().withTab()
            HelpView().withTab()
            AddView().withTab()
            TextsView().withTab()
                // (Goal) The user adds a text. Then, she sees a hint where to go next.
                .badge(ifNewTexts)
            KnowView().withTab()
                // (Goal) The user knows how many quizzes are ready.
            
                // TODO: - when texts edit fixed, switch
                .badge(2)
//                .badge(paragraphsDue)
            
            // TODO: - when reciteview deprecated, remove
//            ReciteView().withTab()
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

// MARK: - (withTab())

// (Goal) The dev can use tabs in a human-browsable way.
// Given a specific view, return it wrapped in its tab.
private extension View {
    func withTab() -> Tab<Never, Self, DefaultTabLabel> {
        switch self {
        case is DebugView:
            Tab(AppConstant.Label.debug, systemImage: String()) { self }
        case is HelpView:
            Tab(AppConstant.Label.help, systemImage: AppConstant.SFSymbol.help) { self }
        case is AddView:
            Tab(AppConstant.Label.add, systemImage: AppConstant.SFSymbol.add) { self }
        case is TextsView:
            Tab(AppConstant.Label.texts, systemImage: AppConstant.SFSymbol.goalText) { self }
        case is KnowView:
            Tab(AppConstant.Label.know, systemImage: AppConstant.SFSymbol.brain) { self }
        default:
            Tab(AppConstant.Label.unknown, systemImage: String()) { self }
        }
    }
}

// MARK: - (preview)

#Preview {
    ContentView()
    
    // TODO: - when verse deprecated, remove
//        .modelContainer(for: [Passage.self, Verse.self])
    
        .modelContainer(for: Passage.self)
}
