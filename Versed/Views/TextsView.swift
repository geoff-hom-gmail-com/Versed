import SwiftUI
import SwiftData

// MARK: - (TextsView)
struct TextsView: View {
// (goal) (user can manage her texts) (parse into stanzas. Edit. Delete. See learning stats)
// (goal) (user can see examples) (to properly create texts)
    
// TODO: - The user can see at a glance how she's doing with her texts.
// (ToDo) (Goal) The user can see at a glance how she's doing with her texts.
// She can see which ones she is reciting well, and maybe deduce why.
// Which ones she is not reciting well, and deduce why. And know how to improve. E.g., more encoding, better encoding, recitation variety.
// Which ones are new and still need to be encoded.
// A custom row with encoding/recite data/scores/gauges? (Understanding? Stamina? symbols? What options are there for Vstack with symbol and text? Maybe Label can already do that, or LabeledContent)
    // MARK: - (body)
    var body: some View {
        #if DEBUG
//        let _ = Self._printChanges()
        #endif
        
        NavigationStack {
            List {
                TextsSection()
                ExamplesSection()
            }
            .listStyle(.sidebar)
            // (goal) (user can see disclosure indicators)

            .lineLimit(1)
            .truncationMode(.tail)
            .navigationDestination(for: Passage.self) {
                TextDetail($0)
            }
            .navigationDestination(for: Example.self) {
                ExampleDetail($0)
            }
        }
    }
}

// MARK: - (views) (TextsSection)
private struct TextsSection: View {
// (goal) (dev can browse the calling body)
    // MARK: - (body)
    var body: some View {
        Section(isExpanded: $isExpanded) {
            ForEach(texts) { text in
                NavigationLink(value: text) {
                    Text(text.beforeCue)
                        .badge(text.isNew ? AppConstant.Badge.new : nil)
                }
            }
        } header: {
            HStack {
                Text(AppConstant.Label.texts)
                InfoButton(popoverText: AppConstant.Info.myTexts)
            }
            .textCase(nil)
        }
    }
    
    // MARK: - (non-views) (properties)
    
    @State private var isExpanded = true
    // (goal) (user can focus) (by collapsing an unneeded section)
        
    @Query(sort: \Passage.index, order: .reverse)
    private var texts: [Passage]
    // (goal) (user can see her texts, in order) (newest: top)
}

// MARK: - (views) (ExamplesSection)
private struct ExamplesSection: View {
// (goal) (dev can browse the calling body)
    // MARK: - (body)
    var body: some View {
        Section(isExpanded: $isExpanded) {
            ForEach(examples) { example in
                NavigationLink(value: example) {
                    Text(example.type)
                }
            }
        } header: {
            Text(AppConstant.Label.examples)
        }
        .textCase(nil)
    }

    // MARK: - (non-views) (properties)

    @State private var isExpanded = false
    // (goal) (user can focus) (by collapsing an unneeded section)
    // (note) (hide examples by default) (let user focus on her texts)

    private var examples = AppConstant.ExampleText.examples
}

// MARK: - (preview)
#Preview {
    TextsView()
        .modelContainer(for: Passage.self)
}
