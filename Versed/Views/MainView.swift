import SwiftUI
import SwiftData

// MARK: - (MainView)
struct MainView: View {
// (goal) (user sees the starting tab. She can go to other tabs)
    // MARK: - (body)
    var body: some View {
        TabView {
            DebugView().inTab()
            HelpView().inTab()
            AddView().inTab()
            TextsView().inTab()
                .badge(ifNewTexts)
                // (goal) (user adds a text) (she sees a hint where to go next)
            KnowView().inTab()
//                .badge(2)
                // TODO: - when user can edit text, switch
                .badge(paragraphsReady)
                // (goal) (user knows how many quizzes are ready)

//            ReciteView().withTab()
            // TODO: - when reciteview deprecated, remove
        }
    }
    
    // MARK: - (non-views) (ifNewTexts)
    
    private var ifNewTexts: Text? {
        let hasNewTexts = !newTexts.isEmpty
        print("(MainView) (ifNewTexts)")
        
        return hasNewTexts ? Text(AppConstant.Badge.new) : nil
        // (note) (for nil) (String doesn't work) (Text does)
        // (https://developer.apple.com/forums/thread/766000)
    }
    // (note) (a badge update causes all tabs to be redone) (x2) (Xcode 16.1)
    
    @Query(filter: #Predicate<Passage> { $0.isNew == true })
    private var newTexts: [Passage]

    // MARK: - (non-views) (paragraphsReady)
    
    private var paragraphsReady: Int {
    // TODO: - check if updates in realtime
    // (e.g. ready in 10"; does it change in 10"?)
    // (if not, set timer to check every x" and then once working, make it 60")
        print("(MainView) (paragraphsReady) \(Date.now)")
                
//        let paragraphs = texts.flatMap { $0.paragraphs }
        return paragraphs
            .filter { $0.readyDate < Date.now }
            .count
    }
    // todo: should be same with query on paragraphs directly
    
    @Query
    private var paragraphs: [Paragraph]
    
//    @Query
//    private var texts: [Passage]
}

// MARK: - (views) (.inTab())
private extension View {
// (goal) (dev can browse the calling body)
    func inTab() -> Tab<Never, Self, DefaultTabLabel> {
    // (note) (returns a tab with the view)
        var label = AppConstant.Label.unknown
        var symbol = String()

        switch self {
        case is DebugView:
            label = AppConstant.Label.debug
        case is HelpView:
//            print("(MainView) (inTab) (HelpView) \(Date.now)")
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
    MainView()
        .modelContainer(for: Passage.self)
//        .modelContainer(for: [Passage.self, Verse.self])
        // TODO: - when verse deprecated, remove
}
