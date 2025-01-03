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
}
