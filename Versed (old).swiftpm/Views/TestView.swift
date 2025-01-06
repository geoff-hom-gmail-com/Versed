import SwiftUI

// not used in app
// temp using to test code stuff
struct TestView: View {
    @Environment(Verse.self) private var verse
    @State private var verses = [Verse("")]

    
    
    var body: some View {
//        @Bindable var verse = verse
//        TextField("Title", text: $verse.text)
        List(verses) { verse in
            @Bindable var verse = verse
//            let x = 3
            Text("hi")
            TextField("Title", text: $verse.text)
        
        }
    }
}
