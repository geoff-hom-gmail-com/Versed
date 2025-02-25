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
                        infoText: AppConstant.Info.editIntervals)
                ) {
                    ForEach(tempParagraphs) { paragraph in
                        Text(paragraph.text)
                        Stepper {
                            Text("(" + Paragraph.abbr(from: paragraph.interval) + ")")
                        } onIncrement: {
                            paragraph.advance()
                        } onDecrement: {
                            paragraph.rewind()
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
                updateParagraphs()
                dismiss()
            }
//            .disabled(ifNoChanges)
            // TODO: - (if no changes, disable) (Contacts does this)
            // (note) (this does provide an easy way to refresh Know badge)
            // (since a text can be updated without any real changes)
        }
    }
    
    // MARK: - (non-views)
    
    private func updateParagraphs() {
    // (goal) (paragraph with new interval behaves as user expects)
        zip(paragraphs, tempParagraphs).forEach { paragraph, tempParagraph in
            if tempParagraph.interval != paragraph.interval {
                paragraph.status = tempParagraph.status
                paragraph.readyDate = tempParagraph.readyDate
            }
        }
    }
    
    @Environment(\.dismiss) private var dismiss

    private var paragraphs: [Paragraph]
    
//    @State private var intervals: [TimeInterval]
    @State private var tempParagraphs: [Paragraph]

    // MARK: - (init(_:))
    init(_ paragraphs: [Paragraph]) {
        self.paragraphs = paragraphs
//        self.intervals = self.paragraphs.map { $0.interval }
        self.tempParagraphs = self.paragraphs.map { Paragraph(text: $0.text, readyDate: $0.readyDate, priorQuizDate: $0.priorQuizDate, status: $0.status) }
    }
}
