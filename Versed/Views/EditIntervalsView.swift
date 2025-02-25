import SwiftUI

// MARK: - (EditIntervalsView)
struct EditIntervalsView: View {
// (goal) (user can edit a text's intervals)
    // MARK: - (body)
    var body: some View {
        NavigationStack {
        // (goal) (user has toolbar buttons)
            Form {
                Section(
                    header: SectionHeader(
                        image: Image(systemName: AppConstant.SFSymbol.goalText),
                        label: AppConstant.Label.goalBeats,
                        infoText: AppConstant.Info.goalBeats)
                ) {
                    ForEach(paragraphs.indices, id: \.self) { index in
                        Text(paragraphs[index].text)
                        let interval = intervals[index]
                        Stepper {
                            Text("(" + Paragraph.abbr(from: interval) + ")")
                        } onIncrement: {
                            intervals[index] = Paragraph.newInterval(from: interval)
                        } onDecrement: {
                            intervals[index] = Paragraph.oldInterval(from: interval)
                        }
                        .listRowSeparator(.hidden, edges: .top)
                    }
                }
            }
            .navigationTitle(AppConstant.Label.editIntervals)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                cancelButton
                doneButton
            }
        }
    }
    
    // MARK: - (views) (toolbar buttons)
    
    private var cancelButton: ToolbarItem<Void, some View> {
    // (goal) (dev can browse the calling body)
    // (goal) (user can discard edits)
        ToolbarItem(placement: .cancellationAction) {
            Button(AppConstant.Label.cancel, role: .cancel) {
                dismiss()
                // (note) (could use SwiftData's rollback())
                // (or https://www.hackingwithswift.com/quick-start/swiftdata/how-to-discard-changes-to-a-swiftdata-object)
                // (but this seems KISS. Also, don't like how "live editing" makes the Know badge recalculate on every keystroke)
            }
        }
    }
    // TODO: - (same as in EditTextView) (DRY)
    
    private var doneButton: ToolbarItem<Void, some View> {
    // (goal) (dev can browse the calling body)
        ToolbarItem(placement: .confirmationAction) {
            Button(AppConstant.Label.done) {
                updateIntervals()
                dismiss()
            }
//            .disabled(ifNoChanges)
            // TODO: - (if no changes, disable) (Contacts does this)
            // (note) (this does provide an easy way to refresh Know badge)
            // (since a text can be updated without any real changes)
        }
    }
    
    // MARK: - (non-views)
    
    private func updateIntervals() {
        // how to do this? here or passge? para?
        // well, we could just go through each para here, then update its interval (i.e. readyDate)
        // we could find it by id; or enumerate and just go by index
        // zip
        
        // TODO: - (implement)

//        passage.beforeCue = beforeCue
//        if passage.goal != goal {
//        // (note) (currently) (updateParagraphs(_:) deletes all prior paragraphs and makes new ones)
//        // (later version may be smarter and replace only changed paras)
//        // (then we wouldn't need this check)
//            passage.goal = goal
//            passage.updateParagraphs(modelContext)
//        }
    }
    
    @Environment(\.dismiss) private var dismiss

//    private var text: Passage
    // TODO: - (if text better than passage) (tidy EditTextView) (else here)
    
    private var paragraphs: [Paragraph]
    
    @State private var intervals: [TimeInterval]

    // MARK: - (init(_:))
    init(_ paragraphs: [Paragraph]) {
        self.paragraphs = paragraphs
        self.intervals = self.paragraphs.map { $0.interval }
    }
}
