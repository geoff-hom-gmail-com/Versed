import SwiftUI

// (Goal) The user can test a verse by reciting it.
struct TestAVerseView: View {
    var verse: Verse
    
    // Default: Hearing. Not reading.
    @State private var selectedSense: Sense = .hear
    
    // The user hasn't made a conscious choice yet.
    @State private var isSensePicked = false
    
    enum InputMode: String {
        case mouth, touch
    }
    
    // Default: Speaking. Not typing.
    @State private var selectedInputMode: InputMode = .mouth
    
    @State private var isInputModePicked = false
    @State private var inputModeString = ""
    @State private var recitedText = ""
    
    @State private var shouldShowVerse = false
    
    var body: some View {
        // Stick with form, or try more like a VStack?
        Form {
            Text("A verse is due!")
            
            Section() {
                // First, the user picks a sense.
                HStack {
                    Picker("Sense", selection: $selectedSense) {
                        Image(systemName: SFSymbols.hear).tag(Sense.hear)
                        Image(systemName: SFSymbols.see).tag(Sense.see)
                    }
                    .pickerStyle(.segmented)
                    Spacer()
                    Button() {
                        isSensePicked = true
                    } label: {
                        Image(systemName: SFSymbols.cue)
                    }
                }
                
                // Then, the user gets the cue. And, she can get clues.
                if isSensePicked {
                    // (ToDo) (beginner UX?) (can DRY?) (CueView(verse:sense:)?)
                    switch selectedSense {
                    case .hear:
                        HearCueView(verse: verse)
                    case .see:
                        SeeCueView(verse: verse)
                    }
                    CluesView(verse: verse, sense: selectedSense)
                }
            }
            
            // show the input-mode picker.
            if isSensePicked {
                Section() {
                    HStack {
                        // (ToDo) (spacer doesn't seem to be working) (how do we stop Picker from taking whole width?)
                        // (wait and see how it looks on iPhone first)
                        Picker("Input", selection: $selectedInputMode) {
                            Text("Speak").tag(InputMode.mouth)
                            Text("Type").tag(InputMode.touch)
                        }
                        .pickerStyle(.segmented)
                        Spacer()
                        // (ToDo) (need to work on this UI practically)
                        // (and keep in mind latest features of iOS 18 vs what I have access to in Playgrounds)
                        // Ideally, user taps Transcribe button. User knows when transcription is happening and when stopped. 
                        // User can pause to think. Unpause to resume. (or maybe that's MVP-post)
                        // Does it stop transcribing automatically, and/or when user taps a stop button? Or just a button?
                        // Is the dictation live, or after stop? What's ideal?
                        // What if the user wants to hear it back?
                        Button("Start") {
                            isInputModePicked = true
                        }
                    }
                    if isInputModePicked {
                        TextField(text: $recitedText, axis: .vertical) {
                            switch selectedInputMode {
                            case .mouth:
                                Text("Speak")
                            case .touch:
                                Text("Type")
                            }
                        }
                        .lineLimit(3...)
                        HStack {
                            Spacer()
                            // (ToDo) (test on iPhone) (if user taps left of button (e.g. anywhere in row) (does it still trigger?) 
                            // (if so, it becomes an issue since a tap in empty part of row triggers the Button and the Help)
                            // (and can't tap Help separately)
                            Button("Compare") {
                                shouldShowVerse = true
                            }
                            .disabled(shouldShowVerse)
                            HelpButton(popoverText: "(ToDo) not automatic")
                        }
                    }
                }
            }
                        
            if shouldShowVerse {
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
