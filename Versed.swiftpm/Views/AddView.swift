import SwiftUI

struct AddView: View {
    @State private var fullText: String = ""

    var body: some View {
        // For input, use Form. 
        Form {
//            Text("Add")
            Text("Enter text to remember:")
            TextField("The Kingdom of God is like …", text: $fullText, axis: .vertical)
                .lineLimit(3...)
            Button("Done") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }

        }
        
        // how hard to rig the button so that when done it will trigger/increase the encode badge? probably should just code it to add it lol
        // also need a way to delete texts/verses. I guess that's the Encode list. though if doing similar texts, one might want to copy/dup a text in the add tab. 
        // yeah, would make sense to be able to see a list of texts in AddView, especially like an Example, then select Duplicate or Add Text from
        // for non-examples, it would be like Duplicate. Hmm; maybe wait until MVP. though will def need Delete verse function by then.
    }
}

#Preview {
    AddView()
}
