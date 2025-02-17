import SwiftData

// MARK: - (DataManager)
struct DataManager {
// (goal) (dev can save anywhere)
    static func save(_ context: ModelContext) {
    // (note) (unsure if needed on device) (in Xcode preview, helps) (sometimes)
        try? context.save()
    }
}
