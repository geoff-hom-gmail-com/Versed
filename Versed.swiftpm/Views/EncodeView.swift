import SwiftUI

struct EncodeView: View {
    @State private var myTextsAreExpanded: Bool = true
    @State private var examplesAreExpanded: Bool = true
    
    @Environment(Verses.self) private var verses

    var body: some View {
//        @Bindable var testVerse = verses.myVerses.first
//        Text("Encode")
        NavigationStack {
            List {
                Section("My Texts", isExpanded: $myTextsAreExpanded) {
                    // This init avoids compiler warning (and potential crash?). (See: https://www.polpiella.dev/binding-navigation) 
                    // (Also: https://www.hackingwithswift.com/forums/swiftui/compiler-warning-non-constant-range-argument-must-be-an-integer-literal/14878)
                    
                    // If fails again, can use NavigationLink that doesn't use NavigationDestination.
                    // Could also use Environment more. E.g., pass in the index/ID/verse without binding. Then, use Environment to get Verses and find the matching verse. 
//                    ForEach(verses.myVerses.indices, id: \.self) { verseIndex in 
//                        // Separate the view from the data. 
//                        NavigationLink(value: verseIndex) {
//                            Text(verses.myVerses[verseIndex].rowTitle)
//                        }
//                        // how do we truncate long texts/prompts to one line with …? Figure out after we have nav/etc.
//                        // probably want a fancier NavLink. Instead of just a text title, a custom row with two lines, so the second line can have encoding score and recite scores (or maybe recite is on the third line). 
//                        // That way, you can see at a glance where you may want to improve the encoding (low encoding score), or how strong encoding may be linked to strong recite scores
//                    }
                    ForEach(verses.myVerses) { verse in
                        NavigationLink(verse.rowTitle, value: verse)
                    }
                }
                
                Section("Examples", isExpanded: $examplesAreExpanded) {
                    // ToDo: update for nav destination (note: examples shouldn't be changeable, so could use constant binding; but UI should make it clear that nothing can be changed)
                    // but, how do we make NavDest use examples and not myVerses?
                    // instead of the value being the index, could be the verse itself; then in binding(for:), could search for the verse that matches
                    // also, it's weird as Verse was struct (value) but now is going to be class (ref)
                    // class would use @Bindable
                    // should be able to create it in the view body, like @Bindable var verse = verse, then $verse
                    ForEach(verses.exampleVerses) { verse in
                        NavigationLink(verse.rowTitle, value: verse)
                    }
//                    ForEach(verses.exampleVerses) { verse in
//                        NavigationLink(verse.rowTitle, value: verse)
//                    }
                }
            }
            .listStyle(.sidebar)
            // old
//            .navigationDestination(for: Verse.self) { verse in
//                VerseDetail(verse: verse)
//            }

            // Tried: $verses.myVerses[verseIndex]. Says $verses not in scope.
            // So, making custom binding.
//            .navigationDestination(for: Array<Verse>.Index.self) { verseIndex in
//                VerseDetail(verse: binding(for: verseIndex))
//            }
            // hmm, maybe NavDest is too clunky with bindings. It is pretty silly to separate a verse in an array only to have to get it back in the array. On the other hand, we definitely want to edit the verse, and it's position in the array shouldn't really matter; like if it changes. 
        // it's my VerseDetail view; how do I want it to be called? 
        // on the one hand, it can use Bindable verse since it's a class now
        // also, we don't really need that to be bindable; it's the stuff inside that should be bound, like $verse.text; the ref to verse shouldn't change in this view. 
        // we could have VerseDetail take in a regular verse, then create the binding there
        // but, if we decide to just use a TextField, or a Form with a Textfield, then we don't have internal access and would need to here (encodeview) create a binding, like $verse.text)
        // ok, VD should definitely have verse be @Bindable, because we need bindings to its properties. 
            .navigationDestination(for: Verse.self) { verse in
//                let verseBinding: Binding<Verse> = binding(for: verse)
//                @Bindable var bindableVerse = verse
                Text("hi")
//                TextField("", text: verseBinding.text)
//                TextField("", text: $bindableVerse.text)
//                TextField("", text: verse.text)

                VerseDetail(verse: verse)
//                VerseDetail(verse: verseBinding)
//                @Binding var bindingVerse: Verse = Binding(verse)
//                VerseDetail(verse: $bindableVerse.self)

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
    
    private func binding(for verse: Verse) -> Binding<Verse> {
        Binding {
            verse
        } set: { newVerse in
            // so this should be like replacing old text with new text
            // we could find the verse in verses, then replace
            // toDo: fix this temp hack
            verses.myVerses[0] = newVerse
//            verse = newVerse
        }
    }
}

//#Preview {
//    EncodeView()
//}
