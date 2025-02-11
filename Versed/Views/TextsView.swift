import SwiftUI
import SwiftData

// MARK: - (TextsView)
// (Goal) The user can manage her texts: Parse into stanzas. Edit. Delete. See learning stats.

// TODO: - The user can see at a glance how she's doing with her texts.
// (ToDo) (Goal) The user can see at a glance how she's doing with her texts.
// She can see which ones she is reciting well, and maybe deduce why.
// Which ones she is not reciting well, and deduce why. And know how to improve. E.g., more encoding, better encoding, recitation variety.
// Which ones are new and still need to be encoded.
// A custom row with encoding/recite data/scores/gauges? (Understanding? Stamina? symbols? What options are there for Vstack with symbol and text? Maybe Label can already do that, or LabeledContent)
struct TextsView: View {
    // MARK: - (body)
    var body: some View {
        #if DEBUG
//        let _ = Self._printChanges()
        #endif
        
        NavigationStack {
            List {
//                 TextsSection()
                ExamplesSection()
//                TextsSection(.user)
//                TextsSection(.example)
            }
            // (Goal) The user can see disclosure indicators.
            .listStyle(.sidebar)
            
            .lineLimit(1)
            .truncationMode(.tail)
            .navigationDestination(for: Passage.self) {
                TextDetail($0)
            }
            .navigationDestination(for: Example.self) {
                ExampleDetail($0)
            }
            .task {
//                insertExamples()
            }
        }
    }
    
    // MARK: - (insertExamples())

//    private func insertExamples() {
//        if examples.isEmpty {
//            Passage.insertExamples(modelContext: modelContext)
//        }
//    }
//
//    @Query(filter: #Predicate<Passage> { $0.isExample == true })
//    private var examples: [Passage]
//    
//    @Environment(\.modelContext) private var modelContext
}

// MARK: - (ExamplesSection)
private struct ExamplesSection: View {
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
//                .textCase(nil)
        }
        .textCase(nil)
    }

    // MARK: - (properties)

    @State private var isExpanded = false
    // (goal) (the user can focus) (by collapsing an unneeded section)
    // (note) (hide examples by default) (let user focus on her texts)

    private var examples = AppConstant.ExampleText.examples

}

// MARK: - (TextsSection)
// (Goal) The dev can make list-sections in a human-browsable way.
// This section has a list of texts.
private struct TextsSection: View {
    // MARK: - (body)
    var body: some View {
        Section(isExpanded: $isExpanded) {
//            ForEach(texts) { text in
//                NavigationLink(value: text) {
//                // (Goal) This NavigationLink separates the view from the data.
//                    Text(text.beforeText)
//                    // this isn't right for examples; they'll use the type not before) (
//                        .badge(text.isNew ? AppConstant.Badge.new : nil)
//                        // how does this work for example, which has no isNew?
//                        // could check for type Passage; or use separate sections
//                }
//            }
        } header: {
            HStack {
                Text(label)
                InfoButton(popoverText: infoText)
                    .opacity(infoText.isEmpty ? 0 : 1)
            }
            .textCase(nil)
        }
    }
    
    // MARK: - (init(_:))

    enum SectionType {
        case user, example
    }
    
    init(_ type: SectionType) {
        switch type {
        case .user:
            self.isExpanded = true
            self.label = AppConstant.Label.texts
            self.infoText = AppConstant.Info.myTexts
        case .example:
            self.isExpanded = false
            self.label = AppConstant.Label.examples
        }
        
        self.type = type
    }
    
    // MARK: - (properties)
    
    // (Goal) The user can shrink sections, for focus.
    @State private var isExpanded: Bool
    
    private var label: String
    private var infoText = String()
    
    // MARK: - (SwiftData)

    private let type: SectionType
    
//    private var texts: [Passage] {
//        switch type {
//        case .user:
//            userTexts
//        case .example:
//            examples
//        }
//    }
    // (Note) Would assign in init(_:), but can't assign property wrappers. (Xcode 16.1)
    
    // (Goal) The user can see her texts, in order. (newest: top)
    @Query(filter: #Predicate<Passage> { $0.isExample == false },
           sort: \.index, order: .reverse)
    private var userTexts: [Passage]
    

    // (Goal) The user can see example texts, in learning order.
//    @Query(filter: #Predicate<Passage> { $0.isExample == true },
//           sort: \.index)
//    private var exampleTexts: [Passage]
}

// MARK: - (preview)
#Preview {
    TextsView()
        .modelContainer(for: Passage.self)
}
