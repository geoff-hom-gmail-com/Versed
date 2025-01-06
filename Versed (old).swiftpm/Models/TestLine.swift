import Foundation

// (Goal) The user can test TTS voices against different texts.

// (Identifiable) (required by ForEach)
// (Hashable) (required by Picker)
struct TestLine: Identifiable, Hashable {
    // (Goal) Remove compiler warning. Was "let." Apparently bad in SwiftData with Swift 6.
    private(set) var id = UUID()
    
    // (Goal) The user knows why this line is included.
    var why: String
    
    var line: String
}

// (Goal) Dev can call AppString.TestLine.allLines. Not AppString.TestLines.all. Inside AppString.TestLine, we call GlobalTestLine. So we need this alias. (Tried MyApp/VersedApp/Versed.TestLine, but it didn't work. Not sure why.)
typealias GlobalTestLine = TestLine
