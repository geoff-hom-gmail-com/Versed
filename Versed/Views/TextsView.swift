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
        NavigationStack {
            List {
                TextsSection(.user)
                TextsSection(.example)
            }
            // (Goal) The user can see disclosure indicators.
            .listStyle(.sidebar)
            
            .lineLimit(1)
            .truncationMode(.tail)
            .navigationDestination(for: Passage.self) {
                TextDetail(passage: $0)
            }
            .task {
                insertExamples()
            }
        }
    }
    
    // MARK: - (insertExamples())

    private func insertExamples() {
        if examples.isEmpty {
            Passage.insertExamples(modelContext: modelContext)
        }
    }

    @Query(filter: #Predicate<Passage> { $0.isExample == true })
    private var examples: [Passage]
    
    @Environment(\.modelContext) private var modelContext
}

// MARK: - (TextsSection)
// (Goal) The dev can make list-sections in a human-browsable way.
// This section has a list of texts.
private struct TextsSection: View {
    // MARK: - (body)
    var body: some View {
        Section(isExpanded: $isExpanded) {
            ForEach(texts) { passage in
                // (Goal) This NavigationLink separates the view from the data.
                NavigationLink(value: passage) {
                    Text(passage.beforeText)
                        .badge(passage.isNew ? AppConstant.Badge.new : nil)
                }
            }
        } header: {
            HStack {
                Text(label)
                
                // TODO: - fix in textfieldsection too?
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
    
    // (Note) Would assign in init(_:), but can't assign property wrappers. (Xcode 16.1)
    private var texts: [Passage] {
        switch type {
        case .user:
            userTexts
        case .example:
            exampleTexts
        }
    }
  
    // (Goal) The user can see her texts, in order. (newest: top)
    @Query(filter: #Predicate<Passage> { $0.isExample == false },
           sort: \.index, order: .reverse)
    private var userTexts: [Passage]

    // (Goal) The user can see example texts, in learning order.
    @Query(filter: #Predicate<Passage> { $0.isExample == true },
           sort: \.index)
    private var exampleTexts: [Passage]
}

// MARK: - (preview)
#Preview {
    TextsView()
        .modelContainer(for: Passage.self)
}
