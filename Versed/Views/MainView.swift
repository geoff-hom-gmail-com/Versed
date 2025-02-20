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
                .badge(readyParagraphs)
                // (goal) (user knows how many quizzes are ready)

//            ReciteView().withTab()
            // TODO: - when reciteview deprecated, remove
        }
    }
    
    // MARK: - (non-views) (ifNewTexts)
    
    private var ifNewTexts: Text? {
        let hasNewTexts = !newTexts.isEmpty
//        print("(MainView) (ifNewTexts)")
        
        return hasNewTexts ? Text(AppConstant.Badge.new) : nil
        // (note) (for nil) (String doesn't work) (Text does)
        // (https://developer.apple.com/forums/thread/766000)
    }
    // (note) (a badge update causes all tabs to be redone) (x2) (Xcode 16.1)
    
    @Query(filter: #Predicate<Passage> { $0.isNew == true })
    private var newTexts: [Passage]

    // MARK: - (non-views) (paragraphsReady)
    
    private var readyParagraphs: Int {
//        print("(MainView) (readyParagraphs) \(Date.now)")
        return paragraphs
            .filter { $0.readyDate < Date.now }
            .count
    }
    // (note) (this won't update in precise realtime)
    // (e.g. if ready in 5") (badge won't update in 5")
    // (but practically) (it seems to update often enough)
    // (e.g., every 1')
    // (if issues) (can try adding a timer)
    
    @Query
    private var paragraphs: [Paragraph]
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
