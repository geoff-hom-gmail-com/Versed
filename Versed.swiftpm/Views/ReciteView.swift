import SwiftUI

struct ReciteView: View {
    @Environment(Verses.self) private var verses

    var body: some View {
        Text("Recite")
        // If no verses due, then show when next. (days/hours/min)
        // Else, show most-due verse.
//        if 
    }
}

//#Preview {
//    ReciteView()
//}
