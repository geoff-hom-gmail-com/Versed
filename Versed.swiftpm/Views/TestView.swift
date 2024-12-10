import SwiftUI

struct TestView: View {
    @Environment(Verse.self) private var verse
    @State private var verses = [Verse(text:"")]

    
    
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
