//import SwiftUI
//import SwiftData
//
//// (Goal) The user can memorize their collection of verses. Also, she can learn how to use the app, from examples. 
//// (@Observable?) (todo) (Model would replace)
//// (final) (inheritance not considered)
//// (class) (SwiftData)
//// we may not even need this class; examples would be a separate thing; and then myVerses is just an array; we're just fetching all the verses each time from the context; depends how we use it, I guess; a User would have settings and their verses; 
//// this line is causing issues; the other model classes seem fine so far
//@Model
////@Observable
//final class Verses {
////    var myVerses = [Verse]()
//    
////    var testDate: Date = Date.now
//
//    // crashes preview and simulator; have to assign in init()
////        var testClue: Clue = Clue(q: "q", a: "a")
//    
//    // doesn't crash
////    var testClue: Clue
//
//    
//    init() {
//        // for testing; not sure how to do this better
////        myVerses = tempMyVerses
////        myVerses = tempMyVerses2
////        myVerses = tempMyVerses3
//                
////        testClue = Clue(q: "q", a: "a")
//    }
//    
//}
//
//let tempMyVerses: [Verse] = [
////    Verse("For God so loved …")
//    Verse("For God so loved the world, he gave his one and only begotton Son, that whosoever")
//
//]
//
//// For testing. 
//let tempMyVerses2: [Verse] = [
//    // Due date in future. 
//    Verse("future text", dueDate: Date.distantFuture)
//]
//
//let tempMyVerses3: [Verse] = [
//    // Due date in past.
////    Verse("past text", prompts: [Prompt(text: "Hungry for food")], dueDate: Date.distantPast)
////    Verse("past text", prompts: [Prompt(text: "Asked to prove God's providence", clarifier: "Massah")], dueDate: Date.distantPast)
////    Verse("past text", prompts: [Prompt(text: "Hungry for food")], clues: [Clue(q: "Book?", a: "Deuteronomy")], dueDate: Date.distantPast)
//    Verse("past text", 
//          prompts: [Prompt(text: "Hungry for food")], 
//          clues: [Clue(q: "Book?", a: "Deuteronomy"), 
//                  Clue(q: "q2", a: "a2"), 
//                  Clue(q: "q3", a: "a3")], 
//          dueDate: Date.distantPast)
//
//]
