// (Goal) The dev can edit strings DRY-ly.
struct AppStrings {
    struct SFSymbols {
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
    
    struct StorageKeys {
        static let voiceID = "voiceID"
    }
    
    struct TestLines {
        // (Goal) The user can test a voice without having to first pick a line.
        static let defaultLine = TestLine(why: "narrative", line: "In the beginning, God created the heavens and the earth.")
        
        static let all = [
            defaultLine,
            TestLine(why: "conversational", line: "\"Do to others as you would have them do to you.\"")
        ]
    }
}
