import SwiftUI

struct EncodeView: View {
    @State private var isExpanded1: Bool = true;
    @State private var isExpanded2: Bool = true;

    var body: some View {
//        Text("Encode")
        // can download sample code on Mac Mini and check it out: https://developer.apple.com/documentation/swiftui/bringing-robust-navigation-structure-to-your-swiftui-app
        NavigationStack {
            List {
                Section("My Texts", isExpanded: $isExpanded1) {
                    // so this will be an array of all myTexts
                    // maybe For Each?
                    // it just has to display a row/text of each text start … or is it the default prompt?!
                    // ah, if it has prompts, it uses that
                    // if a verse is new, it has no prompts, so it would have only the start of the text
                    Text("For God so loved …")   
                }
                
                Section("Examples", isExpanded: $isExpanded2) {
                    // this will be all Examples; For Each?
                    
                    //  ‘Man shall not live on bread alone, but on every word that comes from the mouth of God.
                    // He humbled you, causing you to hunger and then feeding you with manna, which neither you nor your ancestors had known, to teach you that man does not live on bread alone but on every word that comes from the mouth of the Lord. 4 Your clothes did not wear out and your feet did not swell during these forty years. (Deuteronomy)
                    // separate view from data? probably
                    NavigationLink(<#T##titleKey: LocalizedStringKey##LocalizedStringKey#>, value: <#T##Hashable?#>)
                    Text("… man does not live on bread alone, but on …")   
                    // Do not put the Lord your God to the test as you did at Massah. (Deuteronomy)
                    Text("Do not put the Lord your God to the test as you did at Massah.")           
                    // how do we truncate this to one line with …? Figure out after we have nav/etc.
                    Text("Ex 3")                
                }
            }
            .listStyle(.sidebar)
            .navigationDestination(for: Verse.self) { verse in
                VerseDetails(verse: verse)
            }
        }
        
        // remminder: what if we just have empty prompts that the user can customize? No set prompts. Can start with 4. But would be very nice if user can add an arbitrary number of prompts. And choose which ones to have on jog/clue. Maybe jog/clue/mute segmented control?
        // so, we start with a List of the texts. At first, empty except for Examples. So two sections. 
        // (https://developer.apple.com/documentation/swiftui/displaying-data-in-lists#Use-Lists-for-Navigation)
        // or List(isExpanded)
    }
}

#Preview {
    EncodeView()
}
