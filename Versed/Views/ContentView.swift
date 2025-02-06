import SwiftUI
import SwiftData

// MARK: - (ContentView)
// (Goal) The user sees the starting tab. She can go to other tabs.
// (Note) The Xcode template calls this ContentView, so leaving as-is.
struct ContentView: View {
    // MARK: - (body)
    var body: some View {
        TabView {
            DebugView().inTab()
            HelpView().inTab()
            AddView().inTab()
            TextsView().inTab()
                // (Goal) The user adds a text. Then, she sees a hint where to go next.
                .badge(ifNewTexts)
            KnowView().inTab()
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

// MARK: - (View.inTab())
// (Goal) The dev can make tabs in a human-browsable way.
private extension View {
    // Returns a tab with the view.
    func inTab() -> Tab<Never, Self, DefaultTabLabel> {
        var label = AppConstant.Label.unknown
        var symbol = String()

        switch self {
        case is DebugView:
            label = AppConstant.Label.debug
        case is HelpView:
            label = AppConstant.Label.help
            symbol = AppConstant.SFSymbol.help
        case is AddView:
            label = AppConstant.Label.add
            symbol = AppConstant.SFSymbol.add
        case is TextsView:
            label = AppConstant.Label.texts
            symbol = AppConstant.SFSymbol.goalText
        case is KnowView:
            label = AppConstant.Label.know
            symbol = AppConstant.SFSymbol.brain
        default:
            symbol = String()
        }
        
        return Tab(label, systemImage: symbol) { self }
    }
}

// MARK: - (preview)
#Preview {
    ContentView()
        .modelContainer(for: Passage.self)

    // TODO: - when verse deprecated, remove
//        .modelContainer(for: [Passage.self, Verse.self])
}
