import SwiftUI

struct EncodeView: View {
    @State private var myTextsAreExpanded: Bool = true
    @State private var examplesAreExpanded: Bool = true
    
    @Environment(Verses.self) private var verses

    var body: some View {
//        Text("Encode")
        NavigationStack {
            List {
                Section("My Texts", isExpanded: $myTextsAreExpanded) {
                    ForEach(verses.myVerses) { verse in
                        // Separate the view from the data. 
                        NavigationLink(verse.rowTitle, value: verse)
                        // how do we truncate long texts/prompts to one line with …? Figure out after we have nav/etc.
                    }
                }
                
                Section("Examples", isExpanded: $examplesAreExpanded) {
                    ForEach(verses.exampleVerses) { verse in
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

//#Preview {
//    EncodeView()
//}
