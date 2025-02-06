import SwiftUI
import SwiftData

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
                // we have two list sections, both with headers
                // headers slightly different
                // example has a .task() how do we do that?
                // the lists are very similar; one is usertexts and one examples; that's the key
                TextsSection(.user)
                TextsSection(.example)
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
    
    // MARK: - (??)

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
}

// (Goal) The dev can make list sections in a human-browsable way.
// This section has a header, and a list of texts.
private struct TextsSection: View {
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
                infoButton
//                infoButton2
            }
            .textCase(nil)
        }
        .task {
            
        }
    }
    
    enum SectionType {
        case user, example
    }
    
    init(_ type: SectionType) {
        switch type {
        case .user:
            self.isExpanded = true
            self.label = AppConstant.Label.texts
//            self.infoButton2 = InfoButton(popoverText: AppConstant.Info.myTexts)
        case .example:
            self.isExpanded = false
            self.label = AppConstant.Label.examples
//            self.infoButton2 = EmptyView()
        }
        self.type = type
    }
    
//    @ViewBuilder
//    private var infoButton2: some View
    
    @ViewBuilder
    private var infoButton: some View {
        switch type {
        case .user:
            // (Goal) The user knows her listed texts show the before-cue (vs the goal text).
            InfoButton(popoverText: AppConstant.Info.myTexts)
        case .example:
            EmptyView()
        }
    }
    
    private var label: String
    
    // (Goal) The user can see her texts, in order. (newest: top)
    // (Note) SwiftData does not support dynamic queries yet (Xcode 16.1).
    private var texts: [Passage] {
        switch type {
        case .user:
            userTexts
        case .example:
            exampleTexts
        }
    }
    
    private let type: SectionType
    

    @State private var isExpanded: Bool
    
    // (Goal) The user can see her texts, in order. (newest: top)
    @Query(filter: #Predicate<Passage> { $0.isExample == false },
           sort: \.index, order: .reverse)
    private var userTexts: [Passage]

    // (Goal) The user can see example texts, in learning order.
    @Query(filter: #Predicate<Passage> { $0.isExample == true },
           sort: \.index)
    private var exampleTexts: [Passage]
     
}

private extension Section {
    //
//    init(for type: SectionType) {
//        switch type {
//        case .user:
//            Section(isExpanded: $isMyTextsExpanded) {
//                ForEach(userTexts) { passage in
//                    // (Goal) This NavigationLink separates the view from the data.
//                    NavigationLink(value: passage) {
//                        Text(passage.beforeText)
//                            .badge(passage.isNew ? AppConstant.Badge.new : nil)
//                    }
//                }
//            } header: {
//                HStack {
//                    Text(AppConstant.Label.texts)
//                    
//                    // (Goal) The user knows her listed texts show the before-cue (vs the goal text).
//                    InfoButton(popoverText: AppConstant.Info.myTexts)
//                }
//                .textCase(nil)
//            }
//        case .example:
//            Section(isExpanded: $isExamplesExpanded) {
//                ForEach(exampleTexts) { passage in
//                    NavigationLink(value: passage) {
//                        Text(passage.beforeText)
//                            .badge(passage.isNew ? AppConstant.Badge.new : nil)
//                    }
//                }
//            } header: {
//                HStack {
//                    Text(AppConstant.Label.examples)
////                        InfoButton(popoverText: AppConstant.Info.examples)
//                }
//                .textCase(nil)
//            }
//            .task {
//                if exampleTexts.isEmpty {
////                        print("examples: insert")
//                    Passage.insertExamples(modelContext: modelContext)
//                }
//            }
//        }
//    }
    
    
}

// MARK: - (preview)
#Preview {
    TextsView()
        .modelContainer(for: Passage.self)
}
