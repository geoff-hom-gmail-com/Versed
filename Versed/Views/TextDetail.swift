import SwiftUI

// (Goal) The user can update the given text. She can also see learning stats.
// (todo) (can she delete (non-example) from here? probably) (can see UI for delete contact or something; there's usually a warning/please-confirm)
// (ToDo) (Goal) The user knows that examples can't be edited. And she can't edit them.
struct TextDetail: View {
    @Bindable var passage: Passage
    
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        // (Note) In a List, the disclosure triangles work with Section(isExpanded:). But with Form, they don't seem to. Even with header empty.
        // DisclosureGroup works. Not sure the UI is ideal. Consider Post-MVP.
        
        // (MVP-post?) (still have a lot to do here, including differences between myText and examples) (then stats)
        // (what's the same/diff between here and addview?)
        // (addview is wrapped in navStack)
        // (textDetail has bindable passage)
            // (beforeText vs passage.beforeText)
        // (goal vs goalBeats)
            // (prompt)
            // (info text)
            // (header)
        Form {
            // Before.
            TextFieldSection(
                headerImage: Image(systemName: AppConstant.SFSymbol.before),
                headerLabel: AppConstant.Label.before,
                infoText: AppConstant.Info.before,
                textFieldLabel: AppConstant.Label.before,
                textFieldText: $passage.beforeText,
                textFieldPrompt: AppConstant.Prompt.before,
                textFieldLineLimit: AppConstant.LineLimit.before...AppConstant.LineLimit.max
            )
            
            // Goal.
            TextFieldSection(
                headerImage: Image(systemName: AppConstant.SFSymbol.goalText),
                headerLabel: AppConstant.Label.goalBeats,
                infoText: AppConstant.Info.goalBeats,
                textFieldLabel: AppConstant.Label.goalBeats,
                textFieldText: $passage.goalText,
                textFieldPrompt: AppConstant.Prompt.goalBeats,
                textFieldLineLimit: AppConstant.LineLimit.goal...AppConstant.LineLimit.max
            )
            
            // After.
            TextFieldSection(
                headerImage: Image(systemName: AppConstant.SFSymbol.after),
                headerLabel: AppConstant.Label.after,
                infoText: AppConstant.Info.after,
                textFieldLabel: AppConstant.Label.after,
                textFieldText: $passage.afterText,
                textFieldPrompt: AppConstant.Prompt.after,
                textFieldLineLimit: AppConstant.LineLimit.after...AppConstant.LineLimit.max
            )
            
            // Reference.
            TextFieldSection(
                headerImage: Image(systemName: AppConstant.SFSymbol.reference),
                headerLabel: AppConstant.Label.reference,
                textFieldLabel: AppConstant.Label.reference,
                textFieldText: $passage.referenceText,
                textFieldPrompt: AppConstant.Prompt.reference,
                textFieldLineLimit: AppConstant.LineLimit.reference...AppConstant.LineLimit.max
            )
        }
        .onAppear {
            // (Goal) The user sees texts as "New," until seen once.
            if passage.isNew {
                passage.isNew = false
                save()
            }
        }
        //        .listStyle(.sidebar)
        //        .formStyle(.grouped)
        .scrollDismissesKeyboard(.immediately)
        .toolbar {
            //                ToolbarItem(placement: .cancellationAction) {
            //                    Button(AppConstant.Label.reset) {
            //                        reset()
            //                    }
            //                    .disabled(isNoText)
            //                }
            ToolbarItem(placement: .confirmationAction) {
                // (toDo) (if example, don't show button) (or, if not example, button visible )
                Button("Update") {
                    //                verses.myVerses.append(
                    //                    Verse(fullText))
                    
                    // (toDo) after adding/saving, user gets feedback. (a badge on Encode ("!", "new" etc) Then after confirming, reset the textfield. It depends, too. Usually, the text needs work like beats. But it's possible it's perfectly fine. In which case it's more like it's new and the user just has to okay it in Encode.
                }
                // (Todo) (done disabled until … in theory, one can edit it later, so … disable until goal text entered at least?)
                //                    .disabled(isNoText)
            }
        }
    }
    
    private func save() {
        // (Note) Not sure if needed on device. But, in Xcode preview, helps.
        do {
            try modelContext.save()
        } catch {
            print("Failed to save: \(error)")
        }
    }
}

#Preview {
    let passage = Passage()
    TextDetail(passage: passage)
}
