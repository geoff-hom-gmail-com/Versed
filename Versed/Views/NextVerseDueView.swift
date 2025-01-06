import SwiftUI

// Goal: User knows when next verse is due.
struct NextVerseDueView: View {
    let verse: Verse?
    
    var body: some View {
        VStack() {
            HStack {
                Text("Next verse due in:")
                Spacer()
            }
            if verse == nil {
                Text("n/a")
            } else {
                // If no verses due, then show when next. (days/hours/min)
                // ToDo (call difference between verse.dueDate and now) (and format) (may be some built-in functions for this) (else, can check packages, including from Apple)
                Text("3 days")
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    NextVerseDueView(verse: nil)
}
