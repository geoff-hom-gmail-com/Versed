import SwiftUI

enum AppConstant {
// (goal) (dev can edit constants DRY-ly)
    // MARK: - (Badge)
    enum Badge {
        static let new = "New"
    }
    
    // MARK: - (Date)
    enum Date {
        static let daySeconds: TimeInterval = 86400
        
        static let orderMixer = Double.random(in: 1...1.2)
        // (goal) (user sees quizzes not always in same order)
        // (note) (so we increase an interval by up to 20%) (arbitrarily chosen from Pareto)
        
        static let spacing = 2.5
        // (goal) (user sees quizzes spaced out)
        // (note) (SM-2 Easy-Factor)
    }
    
    // MARK: - (Emoji)
    enum Emoji {
//        static let goalNet = "🥅"
//        static let soccerBall = "⚽️"
    }
    
    // MARK: - (ExampleText)
    enum ExampleText {
        static let examples = [
        // (goal) (user can learn how to update text for various uses)
            AppConstant.ExampleText.multiverse,
            AppConstant.ExampleText.universe,
            AppConstant.ExampleText.start,
            AppConstant.ExampleText.end
        ]
        // (note) (example order is intentional) (multiverse is most common use case; related are universe, start, end)
        // TODO: - finish/fix examples and add here

        static let multiverse = Example(
        // (goal) (user sees how to update text for the most common example) (multiple paragraphs)
        // (note) (yes, I like the play on words of multiverse) (and universe)
            type: "multiverse",
            beforeCue: """
                \"… Neither can you bear fruit unless you remain in me.\"
                """,
            goal: """
                \"I am the 
                vine; 
                you are the 
                branches. 
                
                If you remain in me 
                and I in you, 
                you will bear 
                much fruit; 
                
                apart from me 
                you can do 
                nothing.\"
                """,
            afterCue: """
                \"If you do not remain in me, you are like a branch that is thrown away and withers …\"
                """,
            notes: """
                (John) (NIV)
                """,
            tip: """
                Make a long text easier: parse it into beats, and paragraphs. 
                
                Each paragraph is quizzed separately. So, you need to know only a paragraph at a time.
                """
        )
        
        static let universe = Example(
        // (goal) (user sees how to update text for one paragraph)
            type: "universe",
            beforeCue: """
                \"… he calls his friends and neighbors together and says, 
                
                ‘Rejoice with me; 
                I have found my lost sheep.’ 
                
                I tell you 
                that in the same way …\"
                """,
            goal: """
                \"… there will be more rejoicing in heaven 
                over
                one sinner who repents 
                than over 
                ninety-nine righteous persons …\"
                """,
            afterCue: """
                \"… who do not need to repent.\"
                """,
            notes: """
                (Luke) (NIV)
                """,
            tip: """
                Parse your text freely. 
                
                For example, according to your spoken beats.
                """
        )

        static let start = Example(
        // (goal) (user sees how to update text for a Book's start)
            type: "Book start",
            beforeCue: """
                How does the Book of John start?
                """,
            goal: """
                In the beginning was 
                the Word, 
                and the Word was 
                with God, 
                and the Word was 
                God. 
                """,
            afterCue: """
                He was with God in the beginning …
                """,
            notes: """
                (John) (NIV)
                """,
            tip: """
                A text includes a Book's start. What's the before-cue? 
                
                Try something simple, like "How does <title> start?"
                """
        )
        
        static let end = Example(
        // (goal) (user sees how to update text for a Book's end)
            type: "Book end",
            beforeCue: """
                \"… teaching them to obey everything I have commanded you.\"
                """,
            goal: """
                "And surely 
                I am with you 
                always, 
                to the very end of the age."
                """,
            afterCue: "(end)",
            notes: """
                (Matthew) (NIV)
                """,
            tip: """
                A text includes a Book's end. What's the after-cue? 
                            
                Try something simple, like "(end)."
                """
        )

        // (Goal) The user sees how to update text for a Psalm.
        static let psalm = Passage(
            beforeCue: """
                (Psalm) 
                
                How does Psalm 23 start?
                """,
            goal: """
                The Lord is my 
                shepherd, 
                I lack 
                nothing.
                """,
            afterCue: """
                He makes me lie down in green pastures …
                """,
            notes: """
                In most Books, the chapter numbers are arbitrary and divisive. In Psalms, it makes more sense.
                
                (example is from Psalm 23) (NIV)
                """)
        
        // (Goal) The user sees how to update text for overlapping/consecutive multiverses.
        // should be long enough to make sense; not so short that it's confusing where the overlap is
        static let serialMultiverse1 = ""
        
        static let serialMultiverse2 = ""
        
        // (Goal) The user sees how to update text for secular work.
        static let secularLong = Passage(
            beforeCue: """
                (secular) (long)
                
                (official) 
                

                It is not the critic who counts; not the man who points out how the strong man stumbles or where the doer of deeds could have done them better. 
                
                The credit belongs to the man who is actually in the arena, whose face is marred by dust and sweat and blood; who strives valiantly; who errs, and comes short again and again, because there is no effort without error and shortcoming; but who does actually strive to do the deeds; who knows the great enthusiasms, the great devotions; who spends himself in a worthy cause; who at the best knows in the end the triumph of high achievement, and who at the worst, if he fails, at least fails while daring greatly, so that his place shall never be with those cold and timid souls who know neither victory nor defeat. 
                
                Shame on the man of cultivated taste who permits refinement to develop into a fastidiousness that unfits him for doing the rough work of a workaday world! 
                
                ”
                """,
            goal: """
                (supermemo) (replace)
                The credit belongs to the man who’s actually in the arena, whose face is marred by dust and sweat; a man who knows the great enthusiasm and the great devotions, who spends himself in a worthy cause, who in the end knows the triumph of high achievement, so that his place shall never be with those cold and timid souls who know neither victory nor defeat
                """,
                                         // TODO: - update each with """

            afterCue: "He makes me lie down in green pastures …",
            notes: """
                This app was designed for the Bible. But secular writing can be done.
                
                (example is from Teddy Roosevelt)
                """)
        
        // (Goal) The user sees how to update text for secular work. In this case, an isolated quote. (The Bible has none.)
        static let secularShort = Passage(
            beforeCue: """
                (secular) (short)
                
                question?
                """,
            goal: """
                a smooth sea 
                never made 
                a skilled sailor
                """,
            afterCue: "",
            notes: """
                This app was designed for the Bible. But secular writing can be done.
                """)
        
        
    }
    
    // MARK: - (Info)
    enum Info {
        // (Note) Why do we have an after-cue? It helps the user know when to stop reciting. It's contextual. It may be useful for backward cueing.
        static let afterCue = "Some text after your goal. Why? To cue."
        
        // (Note) What's our preferred cue? Some text before the goal. (vs notation like John 3:16) (vs questions) Why? It's contextual. Not arbitrary. Less prone to interference. It scales naturally.
        static let beforeCue = "Some text before your goal. Why? To cue."
        
        static let examples = ""
        static let goal = "The text you want to know."
        static let goalBeats = "The text you want to know. Each paragraph is quizzed separately. Magically."
        static let myTexts = "Showing: before-cue."
    }
    
    // MARK: - (Label)
    enum Label {
        static let add = "Add"
        static let afterCue = "After"
        static let beforeCue = "Before"
        static let cancel = "Cancel"
        static let check = "Check"
        static let debug = "Debug"
        static let done = "Done"
        static let edit = "Edit"
        static let examples = "Examples"
        static let goal = "Goal"
        static let goalBeats = "(parse beats, paragraphs)"
        static let help = "Help"
        static let info = "Info"
        static let know = "Know"
        static let mistakesFixed = "Mistakes fixed?"
        static let notes = "Reference / notes"
        
        static let quizFeedback = "How'd it go?"
        // (goal) (app can request quiz feedback from user)
        
        static let reset = "Reset"
        static let texts = "Texts"
        static let tip = "Tip"
        static let unknown = "Unknown"
    }
    
    // MARK: - (LineLimit)
    enum LineLimit {
        // (Goal) The user sees a multiline text field. She knows she can enter more than just the prompt.
        static let after = 3
        
        // (Goal) The user sees a multiline text field. She knows she can enter more than just the prompt.
        static let before = 3
        
        // (Goal) The user sees a multiline text field. She knows she can enter more than just the prompt. She knows this is more important than the other fields, by its size.
        static let goal = 6
        
        // (Goal) If the user has long text, she can still navigate to other fields readily.
        // (Goal) If the text is long enough to scroll, the user knows that.
        //
        // One way is to have orphan text.
        //
        // What if the last visible line is a paragraph break? We can at least guess what line limit may avoid that most. Assume the ideal chunking is 4 lines. So paragraph breaks would be mod 5. And the middle would be mod 5 = 2.
        //
        // (Note) Another option is having scrollbars always visible. But, that isn't an easy option in iOS. (Xcode 16.1)
        static let max = 12
        
        // (Goal) If the text is long enough to scroll, the user knows that. Because the last line is partly hidden.
        static let scrollHintPadding: CGFloat = -17
        
        // (Goal) The user sees a multiline text field. She knows she can enter more than just the prompt.
        static let notes = 2
        
        static let tip = 2
        // (goal) (user sees a multiline text field. She knows she can enter more than just the prompt)
        // (note) (this is temp and a hack) (tips are for examples, so there is no editing)
    }
        
    // MARK: - (Prompt)
    enum Prompt {
        static let afterCue = "\"If you do not remain in me, you are like a branch that is thrown away and withers …\""

        static let goalBeats = """
            \"I am the 
            vine; 
            you are the 
            branches. 
            
            If you remain in me 
            and I in you, 
            you will bear 
            much fruit; 
            
            apart from me 
            you can do 
            nothing.\"
            """
        
        // (Goal) The user sees a prompt of a typical use case.
        static let beforeCue = "\"… Neither can you bear fruit unless you remain in me.\""

        static let goal = "\"I am the vine; you are the branches. If you remain in me and I in you, you will bear much fruit; apart from me you can do nothing.\""
        
        static let notes = "(John) (NIV)"
    }
    
    // MARK: - (SFSymbol)
    enum SFSymbol {
        // The user sees a "+" in a rounded rectangle. Rounded rectangle is homage to Steve Jobs and the Mac. Also varies more from circle used for help.
        static let add = "plus.app.fill"
        
        static let afterCue = "text.line.last.and.arrowtriangle.forward"
        
        // Flip Image horizontally: .environment(\.layoutDirection, .rightToLeft).
        static let answer = "exclamationmark.bubble"
        
        static let arrow = "arrow.right"
        
        // Not "top" or "start." (Pair with text.)
        static let beforeCue = "text.line.first.and.arrowtriangle.forward"
        
        static let brain = "brain.head.profile.fill"
        static let clarifier = "info.circle"
        static let clues = "sparkle.magnifyingglass"
        static let cue = "lightbulb.max"
        
        static let goalText = "book.pages"

        // Or "audio."
        static let hear = "ear.badge.waveform"
        
        static let help = "questionmark.circle.fill"
        static let info = "info.circle"
        static let notes = "text.book.closed.fill"
        static let play = "play"
        static let retry = "arrow.clockwise"
        
        // Or "conversation." (use with "answer")
        static let question = "questionmark.bubble"
        
        static let say = "mouth"
        
        // Or "read."
        static let see = "eye"
        
        static let square = "square"
        static let tap = "hand.tap"
        static let tip = "lightbulb.max"
        static let yes = "hand.thumbsup"
    }
    
    // TODO: - when Verse et al. deprecated, remove?
    // StorageKey, TestLine
    
    enum StorageKey {
        static let voiceID = "voiceID"
    }
    
    enum TestLine {
        // (Goal) The user can test a voice without having to first pick a line.
        static let defaultLine = GlobalTestLine(why: "Harvard 2.1", line: "The boy was there when the sun rose.")

        // (Goal) The user can test with the Harvard lines, group 2.
        static let harvardLines2 = [
            defaultLine,
            GlobalTestLine(why: "2.2", line: "A rod is used to catch pink salmon."),
            GlobalTestLine(why: "2.3", line: "The source of the huge river is the clear spring."),
            GlobalTestLine(why: "2.4", line: "Kick the ball straight and follow through."),
            
            // (voice: Samantha) ("feet" funny)
            GlobalTestLine(why: "2.5", line: "Help the woman get back to her feet."),
            
            GlobalTestLine(why: "2.6", line: "A pot of tea helps to pass the evening."),
            GlobalTestLine(why: "2.7", line: "Smoky fires lack flame and heat."),
            GlobalTestLine(why: "2.8", line: "The soft cushion broke the man's fall."),
            GlobalTestLine(why: "2.9", line: "The salt breeze came across from the sea."),
            GlobalTestLine(why: "2.10", line: "The girl at the booth sold fifty bonds.")
        ]
        
        // (Goal) The user can test with lines similar to what she might hear in the app.
        // (Note) The source-of-truth for the Bible test lines is a spreadsheet. The idea is to use ChatGPT with a code example, and have it make the code below.
        static let bibleLines = [
//            GlobalTestLine(why: "narrative", line: "In the beginning, God created the heavens and the earth."),
            
            // (voice: Samantha) (too fast)
            GlobalTestLine(why: "conversational", line: "\"Do to others as you would have them do to you.\""),
            
            // (voice: Samantha) ("want" funny)
            GlobalTestLine(why: "reflective", line: "\"The Lord is my shepherd; I shall not want.\""),
            
//            GlobalTestLine(why: "formal", line: "\"Thou shalt not bear false witness against thy neighbor.\""),
//            GlobalTestLine(why: "complex", line: "\"For God so loved the world that He gave His one and only Son, that whoever believes in Him shall not perish but have eternal life.\""),
            GlobalTestLine(why: "names and places", line: "\"Now Jesus was going through the region of Samaria, near a town called Sychar.\""),
//            GlobalTestLine(why: "lists", line: "\"Blessed are the poor in spirit, the meek, the merciful, and the peacemakers.\""),
//            GlobalTestLine(why: "rhythm", line: "\"Be still, and know that I am God.\""),
//            GlobalTestLine(why: "joyful", line: "\"This is the day that the Lord has made; let us rejoice and be glad in it.\""),
//            GlobalTestLine(why: "serious", line: "\"For the wages of sin is death, but the gift of God is eternal life in Christ Jesus our Lord.\""),
//            GlobalTestLine(why: "encouraging", line: "\"Do not fear, for I am with you; do not be dismayed, for I am your God.\""),
            GlobalTestLine(why: "question", line: "Would you like to hear another verse?")
        ]
        
        static let allLines = harvardLines2 + bibleLines
    }
    
    // MARK: - (Text)
    enum Text {
        static let paragraphBreak = "\n\n"
    }
}
