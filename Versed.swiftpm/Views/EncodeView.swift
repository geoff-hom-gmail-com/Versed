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
                        // later, probably want a fancier NavLink. Instead of just a text title, a custom row with two lines, so the second line can have encoding score and recite scores (or maybe recite is on the third line). 
                        // That way, you can see at a glance where you may want to improve the encoding (low encoding score), or how strong encoding may be linked to strong recite scores
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
