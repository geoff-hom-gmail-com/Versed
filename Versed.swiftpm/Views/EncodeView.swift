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
                    // This init avoids compiler warning (and potential crash?). (See: https://www.polpiella.dev/binding-navigation) 
                    // (Also: https://www.hackingwithswift.com/forums/swiftui/compiler-warning-non-constant-range-argument-must-be-an-integer-literal/14878)
                    
                    // If fails again, can use NavigationLink that doesn't use NavigationDestination.
                    // Could also use Environment more. E.g., pass in the index/ID/verse without binding. Then, use Environment to get Verses and find the matching verse. 
                    ForEach(verses.myVerses.indices, id: \.self) { verseIndex in 
                        // Separate the view from the data. 
                        NavigationLink(value: verseIndex) {
                            Text(verses.myVerses[verseIndex].rowTitle)
                        }
                        // how do we truncate long texts/prompts to one line with …? Figure out after we have nav/etc.
                        // probably want a fancier NavLink. Instead of just a text title, a custom row with two lines, so the second line can have encoding score and recite scores (or maybe recite is on the third line). 
                        // That way, you can see at a glance where you may want to improve the encoding (low encoding score), or how strong encoding may be linked to strong recite scores
                    }
                }
                
                Section("Examples", isExpanded: $examplesAreExpanded) {
                    // ToDo: update for nav destination (note: examples shouldn't be changeable, so could use constant binding; but UI should make it clear that nothing can be changed)
                    ForEach(verses.exampleVerses) { verse in
                        NavigationLink(verse.rowTitle, value: verse)
                    }
                }
            }
            .listStyle(.sidebar)
            // old
//            .navigationDestination(for: Verse.self) { verse in
//                VerseDetail(verse: verse)
//            }

            // Tried: $verses.myVerses[verseIndex]. Says $verses not in scope.
            // So, making custom binding.
            .navigationDestination(for: Array<Verse>.Index.self) { verseIndex in
                VerseDetail(verse: binding(for: verseIndex))
            }
        }
    }
    
    // Given an index to an array of Verses, return a binding for that Verse.
    private func binding(for index: Array<Verse>.Index) -> Binding<Verse> {
        Binding {
            verses.myVerses[index]
        } set: { newVerse in
            verses.myVerses[index] = newVerse
        }
    }
}

//#Preview {
//    EncodeView()
//}
