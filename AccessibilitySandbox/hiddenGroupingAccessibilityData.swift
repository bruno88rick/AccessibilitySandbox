//
//  hiddenGroupingAccessibilityData.swift
//  AccessibilitySandbox
//
//  Created by Bruno Oliveira on 14/11/24.
//

import SwiftUI

struct hiddenGroupingAccessibilityData: View {
    var body: some View {
        //we can tell SwiftUI that a particular image is just there to make the UI look better by using Image(decorative:), tells SwiftUI it should be ignored by VoiceOver.
        Image(decorative: "galina-n-189483")
        
        //The .accessibilityHidden() modifier turns any view completely invisible to the accessibility system:
        Image(.alesKrivec15949)
            .accessibilityHidden(true)
        
        //The last way to hide content from VoiceOver is through grouping, which lets us control how the system reads several views that are related. VoiceOver sees that as two unrelated text views, and so it will either read “Your score is” or “1000” depending on what the user has selected. Both of those are unhelpful, which is where the .accessibilityElement(children:) modifier comes in: we can apply it to a parent view, and ask it to combine children into a single accessibility element.
        
        VStack {
            Text("Your Score is")
            Text("1000")
                .font(.title)
        }
        .accessibilityElement(children: .combine)
        ///For example, this modifier above will cause both text views to be read together, with a short pause between them.
        
        //That works really well when the child views contain separate information, but in our case the children really should be read as a single entity. So, the better solution here is to use .accessibilityElement(children: .ignore) so the child views are invisible to VoiceOver, then provide a custom label to the parent, like this:
        
        VStack {
            Text("Your Score is")
            Text("2000")
                .font(.title)
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Your Score is 2000")
        ///It’s worth trying both of these to see how they differ in practice. Using .combine adds a pause between the two pieces of text, because they aren’t necessarily designed to be read together. Using .ignore and a custom label means the text is read all at once, and is much more natural.
        
        //.ignore is the default parameter for children, so you can get the same results as .accessibilityElement(children: .ignore) just by saying .accessibilityElement().
        VStack {
            Text("Your Score is")
            Text("3000")
                .font(.title)
        }
        .accessibilityElement()
        .accessibilityLabel("Your Score is 3000")
    }
}

#Preview {
    hiddenGroupingAccessibilityData()
}
