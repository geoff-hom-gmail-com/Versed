import SwiftUI

// MARK: - (ExampleDetail)
struct ExampleDetail: View {
// (goal) (user can see an example) (to properly create texts)
    // MARK: - (body)
    var body: some View {
        Form {
            TextSection(type: .beforeCue, text: example.beforeCue)
            TextSection(type: .goalBeats, text: example.goal)
            TextSection(type: .afterCue, text: example.afterCue)
            TextSection(type: .notes, text: example.notes)
            TextSection(type: .tip, text: example.tip)
        }
        .navigationTitle(example.type)
    }
    
    // MARK: - (non-views)
    
    private var example: Example
    
    // MARK: - (init(_:))
    init(_ example: Example) {
        self.example = example
    }
}

// MARK: - (preview)
#Preview {
    let example = AppConstant.ExampleText.universe
    ExampleDetail(example)
}
