import SwiftUI

@main
struct VersedApp: App {
    // todo: remove after SwiftData working
//    var verses = Verses()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Verses.self)
            // ToDo (do we still need this? try removing after swiftdata works
//                .environment(verses)
        }
    }
}

// (Xcode compiler warning) (16.1)
// "Skipping duplicate build file in Compile Sources build phase: /Users/geoff-hom/work/apps/Versed/Versed.swiftpm/Assets.xcassets"
// No idea where/how that is. Couldn't find any such reference to build phase, or dupe lines, in the entire Versed.swiftpm. Including hidden files.
// Can't access build phase in Xcode, for a Swift Playground.
// Deleted Derived Data. Didn't fix.
// Tried a new, small Swift Playground and opening in Xcode. No compiler warning. (ok)
// Maybe related to empty Resources directory, since we used to have something there?
// Or because we have an icon set (test playground didn't set any icon) (which would then just be some weird compiler bug in Xcode)
// Or because we had a placeholder icon at first, and then a custom icon (but if so, still wouldn't know where that info was stored, or how to ix)
// Others have same issue: https://www.reddit.com/r/iOSProgramming/comments/1am3cjd/how_to_fix_skipping_duplicate_build_file_in/
