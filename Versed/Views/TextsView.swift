import SwiftUI
import SwiftData

// (Goal) The user can manage her texts: Parse into stanzas. Edit. Delete. See learning stats.

// (ToDo) (Goal) The user can see at a glance how she's doing with her texts.
// She can see which ones she is reciting well, and maybe deduce why.
// Which ones she is not reciting well, and deduce why. And know how to improve. E.g., more encoding, better encoding, recitation variety.
// Which ones are new and still need to be encoded.
// A custom row with encoding/recite data/scores/gauges? (Understanding? Stamina? symbols? What options are there for Vstack with symbol and text? Maybe Label can already do that, or LabeledContent)
struct TextsView: View {
    @Environment(\.modelContext) private var modelContext
    
    // (Goal) The user can see her texts, in order. (newest: top)
    @Query(filter: #Predicate<Passage> { $0.isExample == false },
           sort: \.index, order: .reverse)
    private var userTexts: [Passage]

    // (Goal) The user can see example texts, in learning order.
    @Query(filter: #Predicate<Passage> { $0.isExample == true },
           sort: \.index)
    private var exampleTexts: [Passage]
        
    // (Goal) The user can shrink either section of verses, for focus.
    @State private var isMyTextsExpanded: Bool = true
    @State private var isExamplesExpanded: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                // (ToDo) (DRY?)
                Section(isExpanded: $isMyTextsExpanded) {
                    ForEach(userTexts) { passage in
                        // (Goal) This NavigationLink separates the view from the data.
                        NavigationLink(value: passage) {
                            Text(passage.beforeText)
                                .badge(passage.isNew ? AppConstant.Badge.new : nil)
                        }
                    }
                } header: {
                    HStack {
                        Text(AppConstant.Label.texts)
                        
                        // (Goal) The user knows her listed texts show the before-cue (vs the goal text).
                        InfoButton(popoverText: AppConstant.Info.myTexts)
                    }
                    .textCase(nil)
                }
                
                Section(isExpanded: $isExamplesExpanded) {
                    ForEach(exampleTexts) { passage in
                        NavigationLink(value: passage) {
                            Text(passage.beforeText)
                                .badge(passage.isNew ? AppConstant.Badge.new : nil)
                        }
                    }
                } header: {
                    HStack {
                        Text(AppConstant.Label.examples)
//                        InfoButton(popoverText: AppConstant.Info.examples)
                    }
                    .textCase(nil)
                }
                .task {
                    if exampleTexts.isEmpty {
//                        print("examples: insert")
                        Passage.insertExamples(modelContext: modelContext)
                    }
                }
            }
            // (Goal) The user can see disclosure indicators.
            .listStyle(.sidebar)
            
            .lineLimit(1)
            .truncationMode(.tail)
            .navigationDestination(for: Passage.self) {
                TextDetail(passage: $0)
            }
        }
    }
}

#Preview {
    TextsView()
        .modelContainer(for: Passage.self)
}
