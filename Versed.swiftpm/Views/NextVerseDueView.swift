import SwiftUI

// Goal: User knows when next verse is due.
struct NextVerseDueView: View {
    var verse: Verse?
    
    var body: some View {
        VStack {
            Text("Next verse due in:")
            if verse == nil {
                Text("n/a")
            } else {
                // If no verses due, then show when next. (days/hours/min)

                Text("3 days")
            }
        }
    }
}

#Preview {
    NextVerseDueView()
}
