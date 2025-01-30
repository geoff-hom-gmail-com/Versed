import SwiftUI
import SwiftData

// (Goal) The user can manage her texts: Parse into stanzas. Edit. Delete. See learning stats.

// (ToDo) (Goal) The user can see at a glance how she's doing with her texts.
// She can see which ones she is reciting well, and maybe deduce why.
// Which ones she is not reciting well, and deduce why. And know how to improve. E.g., more encoding, better encoding, recitation variety.
// Which ones are new and still need to be encoded.
// A custom row with encoding/recite data/scores/gauges? (Understanding? Stamina? symbols? What options are there for Vstack with symbol and text? Maybe Label can already do that, or LabeledContent)
struct TextsView: View {
    //
    @Environment(\.modelContext) private var modelContext
    
    // (Goal) The user can see her texts, in order. (newest: top)
    @Query(filter: #Predicate<Passage> { $0.isExample == false },
           sort: \.index, order: .reverse)
    private var userTexts: [Passage]

    // (Goal) The user can see example texts, in learning order.
    @Query(filter: #Predicate<Passage> { $0.isExample == true },
           sort: \.index)
    private var exampleTexts: [Passage]
    
    
    // (Goal) The user can see her verses, in order.
//    @Query(filter: #Predicate<Verse> { $0.isExample == false },
//           sort: \.index)
//    private var userVerses: [Verse]
//    
    // (Goal) The user can see example verses, in learning order.
//    @Query(filter: #Predicate<Verse> { $0.isExample == true },
//           sort: \.index)
//    private var exampleVerses: [Verse]
        
    // (Goal) The user can shrink either section of verses, for focus.
    @State private var isMyTextsExpanded: Bool = true
    @State private var isExamplesExpanded: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                Section(isExpanded: $isMyTextsExpanded) {
                    ForEach(userTexts) { passage in
                        // (Goal) This NavigationLink separates the view from the data.
                        NavigationLink(value: passage) {
                            Text(passage.beforeText)
                                .badge("")
                        }
                    }
                } header: {
                    HStack {
                        Text(AppConstant.Label.texts)
//                        InfoButton(popoverText: AppConstant.Info.myTexts)
                    }
                    .textCase(nil)
                }
                
                Section(isExpanded: $isExamplesExpanded) {
                    ForEach(exampleTexts) { passage in
                        NavigationLink(value: passage) {
                            Text(passage.beforeText)
                                .badge("New")
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
                    print("TextsView 1")
                    if exampleTexts.isEmpty {
                        print("TextsView 2")
                        Passage.insertExamples(modelContext: modelContext)
                    }
                }
                
//                Section("My Texts", isExpanded: $isMyTextsExpanded) {
//                    ForEach(userVerses) { verse in
//                        
//                        // This NavigationLink separates the view from the data.
//                        NavigationLink(value: verse) {
//                            Text(verse.rowTitle)
//                            
//                        }
//                    }
//                }
                
//                (ToDo) This section is similar to above. DRY?
//                Section("Examples", isExpanded: $isExamplesExpanded) {
//                    ForEach(exampleVerses) { verse in
//                        NavigationLink(value: verse) {
//                            Text(verse.rowTitle)
////                                .badge("New")
//                        }
//                    }
//                }
//                .task {
//                    if exampleVerses.isEmpty {
//                        Verse.insertExamples(modelContext: modelContext)
//                    }
//                }
            }
            // (ToDo) why do we have this mod?
            .listStyle(.sidebar)
            
            .lineLimit(1)
            .truncationMode(.tail)
            .navigationDestination(for: Passage.self) {
                TextDetail(passage: $0)
            }
//            .navigationDestination(for: Verse.self) {
//                VerseDetail(verse: $0)
//            }
        }
    }
}

#Preview {
    TextsView()
        .modelContainer(for: Passage.self)
}
