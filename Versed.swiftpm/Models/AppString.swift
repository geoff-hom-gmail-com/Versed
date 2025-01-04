// (Goal) The dev can edit strings DRY-ly.
struct AppString {
    struct SFSymbol {
        // Flip Image horizontally: .environment(\.layoutDirection, .rightToLeft).
        static let answer = "exclamationmark.bubble"
        
        static let clarifier = "info.circle"
        static let clues = "sparkle.magnifyingglass"
        static let cue = "lightbulb.max"
        
        // Or "audio."
        static let hear = "ear.badge.waveform"
        
        static let play = "play"
        
        // Or "conversation." (use with "answer")
        static let question = "questionmark.bubble"
        
        // Or "read."
        static let see = "eye"
    }
    
    struct StorageKey {
        static let voiceID = "voiceID"
    }
    
    struct TestLine {
        // (Goal) The user can test a voice without having to first pick a line.
        static let defaultLine = GlobalTestLine(why: "narrative", line: "In the beginning, God created the heavens and the earth.")

        static let allLines = [
            defaultLine,
            GlobalTestLine(why: "conversational", line: "\"Do to others as you would have them do to you.\"")
        ]
    }
}
