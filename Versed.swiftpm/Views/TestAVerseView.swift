import SwiftUI

// Goal: User can test recitation of a verse.
struct TestAVerseView: View {
    var verse: Verse
    enum Sense: String {
        case eyes, ears
    }
    @State private var selectedSense: Sense = .ears
    // (ToDo) (rename this?) (it currently says "Next") (though that could be confusing to coder) (top-down)
    @State private var wasPromptMePressed: Bool = false
    @State private var wasTranscribePressed: Bool = false
    @State private var recitedText: String = ""
    @State private var wasComparePressed: Bool = false
    
//    @State private var areCluesExpanded: Bool = true

    var body: some View {
        // Form or more like a VStack?
        Form {
            Text("A verse is due!")
            // (ToDo) (this picker/seg looks a little wonky) (probably because it's in a form) (try VStack etc later?)
            HStack {
                Picker("Sense", selection: $selectedSense) {
                    Text("Read").tag(Sense.eyes)
                    Text("Hear").tag(Sense.ears)
                }
                .pickerStyle(.segmented)
                Spacer()
                Button("Next") {
                    // not event based; state based!!
                    wasPromptMePressed = true
                }
            }
            
            // so here we can add the entire view for HearView and ReadView
            // ToDo: toggle view depending on picker (state not event!)
            // also: if reading, how do we recite? still speaking, or typing? MVP?
            // is the transcribe button common to both views? if so, pull it out?
            // does HearView need Section? try without and see how it looks
            if wasPromptMePressed {
                HearView(wasTranscribePressed: $wasTranscribePressed)
        
            }
            
            if wasTranscribePressed {
                Section() {
                    TextField("Recite", text: $recitedText, axis: .vertical)
                        .lineLimit(3...)
                    HStack {
                        Spacer()
                        Button("Compare") {
                            wasComparePressed = true
                        }
                        .disabled(wasComparePressed)
                    }
                }
            }
            
            if wasComparePressed {
                Section() {
                    TextField("", text: .constant(verse.text), axis: .vertical)
                        .lineLimit(3...)
                    // (toDo) (here we present two mutually exclusive buttons) (Again) (Promote) (what UI?) (seg control might make sense) (except it requires two presses: one for the control, and one for "Next")
                    // try two buttons
                }
                
                // The buttons to repeat/promote the verse. 
                // This is a separate section from above, because it refers to the whole Recite view.
                // The buttons are mutually exclusive, so we could use a segmented control. However, to make that sensible to the user, would require an extra tap on a "Done" button. 
                HStack {
                    Button() {
                    } label: {
                        Image(systemName: "arrow.trianglehead.counterclockwise")
                        Text("Again")                        
                    }
                    Spacer()
                    Button() {
                    } label: {
                        Image(systemName: "figure.step.training")
                        Text("1 d \(Image(systemName: "arrow.right")) 2 d")                        
                    }
                }
            }
        }
    }
}

//#Preview {
//    let aVerse = Verse(text: "hi")
//    TestAVerseView(verse: aVerse)
//}
