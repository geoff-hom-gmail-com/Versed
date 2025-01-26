import SwiftUI

// (Goal) The user can get clues, according to the given sense.
struct CluesView: View {
    let verse: Verse
    let sense: Sense
    
    var body: some View {
        DisclosureGroup() {
            // (ToDo) (beginner UX) (fix bug)
            // (currently, default verses have 4 empty clues) (so clues isn't empty; each clue is empty) (also, a user may encode only 1 or 2 clues at start) (the rest remain empty)
            // (so, we want to show only non-empty clues) (ok)
            // (and) (if they're empty) (or there are no non-empty ones), then let the user know, so she can encode some)
            if verse.clues.isEmpty {
                Text("No clues. Encode some!")
            } else {
                let sortedClues = verse.clues.sorted {
                    $0.index < $1.index
                }
                ForEach(sortedClues) {
                    if !$0.q.isEmpty {
                        ClueView(clue: $0, sense: sense)
                    }
                }
            }
        } label: {
            Spacer()
                .frame(maxWidth: .infinity)            
            Image(systemName: AppConstant.SFSymbol.clues)
        }
    }
}
