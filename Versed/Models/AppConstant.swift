// (Note) May not need this import, technically. But then we lose pinned preview. (Xcode 16.1)
import SwiftUI

// (Goal) The dev can edit constants DRY-ly.
struct AppConstant {
    struct Badge {
        static let new = "New"
    }
    
    struct Emoji {
//        static let goalNet = "🥅"
//        static let soccerBall = "⚽️"
    }
    
    struct ExampleText {
        // (Goal) The user sees how to update text for the most common example: multiple verses.
        static let multiverse = Passage(isExample: true,
            before: "(multiverse) \"… Neither can you bear fruit unless you remain in me.\"",
            goal: "some multiverse text",
            after: "",
            reference: "notes explaining example more fully here")
        
        // (Goal) The user sees how to update text from the start of a book.
        static let start = Passage(isExample: true,
            before: "(start of Book) How does John start?",
            goal: "")
        
        // (Goal) The user sees how to update text from the end of a book.
        static let end = Passage(isExample: true,
            before: "(end of Book) ??",
            after: "(end)")
    }
    
    struct Info {
        // (Note) Why do we have an after-cue? It helps the user know when to stop reciting. It's contextual. It may be useful for backward cueing.
        static let after = "Some text after your goal. Used to cue."
        
        // (Note) What's our preferred cue? Some text before the goal. (vs notation like John 3:16) (vs questions) Why? It's contextual. Not arbitrary. Less prone to interference. It scales naturally.
        static let before = "Some text before your goal. Used to cue."
        
        static let examples = ""
        static let goal = "The text you want to know."
        static let myTexts = "Listed by before-cue."
    }
    
    struct Label {
        static let add = "Add"
        static let after = "After"
        static let before = "Before"
        static let done = "Done"
        static let examples = "Examples"
        static let goal = "Goal"
        static let help = "Help"
        static let info = "Info"
        static let know = "Know"
        static let reference = "Reference / notes"
        static let reset = "Reset"
        static let texts = "Texts"
    }
    
    struct LineLimit {
        // (Goal) The user sees a multiline text field. She knows she can enter more than just the prompt.
        static let after = 3
        
        // (Goal) The user sees a multiline text field. She knows she can enter more than just the prompt.
        static let before = 3
        
        // (Goal) The user sees a multiline text field. She knows she can enter more than just the prompt. She knows this is more important than the other fields, by its size.
        static let goal = 6
        
        // (Goal) The user sees a multiline text field. She knows she can enter more than just the prompt.
        static let reference = 2
    }
    
    struct Prompt {
        static let after = "\"If you do not remain in me, you are like a branch that is thrown away and withers …\""

        // maybe Encode will use beats prompts
        static let afterTemp = """
            If you do not remain in me,
            you are like a branch
            that is thrown away
            and withers;
            such branches are picked up,
            thrown into the fire
            and burned.”
            """
        
        // (Goal) The user sees a prompt of a typical use case.
        static let before = "\"… Neither can you bear fruit unless you remain in me.\""

        static let goal = "\"I am the vine; you are the branches. If you remain in me and I in you, you will bear much fruit; apart from me you can do nothing.\""
        
        static let reference = "(John) (NIV)"
    }
    
    struct SFSymbol {
        // The user sees a "+" in a rounded rectangle. Rounded rectangle is homage to Steve Jobs and the Mac. Also varies more from circle used for help.
        static let add = "plus.app.fill"
        
        static let after = "text.line.last.and.arrowtriangle.forward"
        
        // Flip Image horizontally: .environment(\.layoutDirection, .rightToLeft).
        static let answer = "exclamationmark.bubble"
        
        static let arrow = "arrow.right"
        
        // Not "top" or "start." (Pair with text.)
        static let before = "text.line.first.and.arrowtriangle.forward"
        
        static let brain = "brain.head.profile.fill"
        static let clarifier = "info.circle"
        static let clues = "sparkle.magnifyingglass"
        static let cue = "lightbulb.max"
        
        static let goalText = "book.pages"

        // Or "audio."
        static let hear = "ear.badge.waveform"
        
        static let help = "questionmark.circle.fill"
        static let info = "info.circle"
        static let play = "play"
        
        // Or "conversation." (use with "answer")
        static let question = "questionmark.bubble"
        
        static let reference = "text.book.closed.fill"
        static let say = "mouth"
        
        // Or "read."
        static let see = "eye"
        
        static let tap = "hand.tap"
    }
    
    struct StorageKey {
        static let voiceID = "voiceID"
    }
    
    struct TestLine {
        // (Goal) The user can test a voice without having to first pick a line.
        static let defaultLine = GlobalTestLine(why: "Harvard 2.1", line: "The boy was there when the sun rose.")

        // (Goal) The user can test with the Harvard lines, group 2.
        static let harvardLines2 = [
            defaultLine,
            GlobalTestLine(why: "2.2", line: "A rod is used to catch pink salmon."),
            GlobalTestLine(why: "2.3", line: "The source of the huge river is the clear spring."),
            GlobalTestLine(why: "2.4", line: "Kick the ball straight and follow through."),
            
            // (voice: Samantha) ("feet" funny)
            GlobalTestLine(why: "2.5", line: "Help the woman get back to her feet."),
            
            GlobalTestLine(why: "2.6", line: "A pot of tea helps to pass the evening."),
            GlobalTestLine(why: "2.7", line: "Smoky fires lack flame and heat."),
            GlobalTestLine(why: "2.8", line: "The soft cushion broke the man's fall."),
            GlobalTestLine(why: "2.9", line: "The salt breeze came across from the sea."),
            GlobalTestLine(why: "2.10", line: "The girl at the booth sold fifty bonds.")
        ]
        
        // (Goal) The user can test with lines similar to what she might hear in the app.
        // (Note) The source-of-truth for the Bible test lines is a spreadsheet. The idea is to use ChatGPT with a code example, and have it make the code below.
        static let bibleLines = [
//            GlobalTestLine(why: "narrative", line: "In the beginning, God created the heavens and the earth."),
            
            // (voice: Samantha) (too fast)
            GlobalTestLine(why: "conversational", line: "\"Do to others as you would have them do to you.\""),
            
            // (voice: Samantha) ("want" funny)
            GlobalTestLine(why: "reflective", line: "\"The Lord is my shepherd; I shall not want.\""),
            
//            GlobalTestLine(why: "formal", line: "\"Thou shalt not bear false witness against thy neighbor.\""),
//            GlobalTestLine(why: "complex", line: "\"For God so loved the world that He gave His one and only Son, that whoever believes in Him shall not perish but have eternal life.\""),
            GlobalTestLine(why: "names and places", line: "\"Now Jesus was going through the region of Samaria, near a town called Sychar.\""),
//            GlobalTestLine(why: "lists", line: "\"Blessed are the poor in spirit, the meek, the merciful, and the peacemakers.\""),
//            GlobalTestLine(why: "rhythm", line: "\"Be still, and know that I am God.\""),
//            GlobalTestLine(why: "joyful", line: "\"This is the day that the Lord has made; let us rejoice and be glad in it.\""),
//            GlobalTestLine(why: "serious", line: "\"For the wages of sin is death, but the gift of God is eternal life in Christ Jesus our Lord.\""),
//            GlobalTestLine(why: "encouraging", line: "\"Do not fear, for I am with you; do not be dismayed, for I am your God.\""),
            GlobalTestLine(why: "question", line: "Would you like to hear another verse?")
        ]
        
        static let allLines = harvardLines2 + bibleLines
    }
}
