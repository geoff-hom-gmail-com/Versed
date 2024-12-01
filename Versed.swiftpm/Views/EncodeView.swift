import SwiftUI

struct EncodeView: View {
    @State private var myTextsAreExpanded: Bool = true
    @State private var examplesAreExpanded: Bool = true
    
    // why doesn't this have @State, private, etc? Look up when we figure out data model. 
    var dataModel = DataModel.shared

    var body: some View {
//        Text("Encode")
        NavigationStack {
            List {
                Section("My Texts", isExpanded: $myTextsAreExpanded) {
                    ForEach(dataModel.myVerses) { verse in
                        // Separate the view from the data. 
                        NavigationLink(verse.rowTitle, value: verse)
                        // how do we truncate long texts/prompts to one line with …? Figure out after we have nav/etc.
                    }
                }
                
                Section("Examples", isExpanded: $examplesAreExpanded) {
                    ForEach(dataModel.exampleVerses) { verse in
                        NavigationLink(verse.rowTitle, value: verse)
                    }
                }
            }
            .listStyle(.sidebar)
            .navigationDestination(for: Verse.self) { verse in
                VerseDetail(verse: verse)
            }
        }
    }
}

#Preview {
    EncodeView()
}
