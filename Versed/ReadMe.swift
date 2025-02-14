// (Geoff Hom) (2025.2.11)

// This file describes how I comment my code.

// MARK: - (parentheses)
/*
 First, I like to use parentheses in single-line comments: (). In place of sentence capitalization and periods.

 For example, I might use:
 
    (note) (this code is a hack) (see: <link>)

 instead of:

    Note: this code is a hack. See: <link>.

 Rationale: It's easier to tell where a sentence starts and ends by (). Vs scanning for two visually-unrelated objects: a capital letter and then a tiny dot. Also, capitals are used for other things like proper nouns, or type names.

 I could use [], {}, <>, but I prefer () aesthetically.

 In my code, a properly-formed comment will always have (). It's not always about replacing periods. It's more about demarking a finished idea.
*/

// MARK: - (comment tags)
/*
 Second, I often start a comment with a tag about the type of comment. I.e., why the comment exists.
 
 For example:

     (goal) (the user can see her texts)
     (note) (this is a hack)

 "(goal)" explains why the type/variable/code *exists.* Often from the perspective of a stakeholder.
 "(note)" explains why code is written that way. This is often for hacks, etc.
*/

// MARK: - (comment position)
/*
 Third, I place comments beneath code, not above.
 
 I find my order more natural: I want to see the code first, which provides a shorter mental hook. The code should be self-explanatory. The comments then attach to the mental hook.
 
 This is related to the idea of retrieval vs review: retrieval is just better. (see: "Make It Stick")
 */

// MARK: - (code marks)
// (code marks go above code) (because of the separator lines)
// (mark order) (for a View)
// - (body)
// - (layout) (other)
// - (misc)
// - (init)
// - (preview)
// (for a model)
// - (properties)
// - (init)

// MARK: - (file location)
// (note) (this file is here vs README.md in GitHub) (because I want it viewable in Xcode) (I like ReadMe better than README) (I don't like Markdown) (my code/comments are all in Swift files, so this will look the same)
