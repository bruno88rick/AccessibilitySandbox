//
//  voiceInputControl.swift
//  AccessibilitySandbox
//
//  Created by Bruno Oliveira on 14/11/24.
//

import SwiftUI

struct voiceInputControl: View {
    var body: some View {
        //Voice Input lets users activate controls through names or numbers, with the names being generated automatically based on what you present. Here's a trivial example:
        
        Button("Tap me") {
            print("Button Tapped")
        }
        
        //Because that has "Tap Me" right there on the screen, it can be activated by saying "Press Tap Me". That's neat, but things are often more complicated. For example, lets say you had buttons with the names of various presidents, like this:
        
        Button("Jhon Fitzgerald Kennedy") {
            print("Button tapped")
        }
        //Button above works great as "Tap John Fitzgerald Kennedy", but wouldn't it be great to also recognize "Tap Kennedy" or perhaps even "Tap JFK"? How about recognizing all three? This is where SwiftUI needs a little extra help from us using the accessibilityInputLabels() modifier. This accepts an array of strings that can be attached to our button, so the user can trigger it in a variety of ways. So, to trigger the button with three different phrases we'd use this:
        
        Button("Jhon Fitzgerald Kennedy") {
            print("Button tapped")
        }
        .accessibilityInputLabels(["Jhon Fitzgerald Kennedy", "JFK", "Kennedy"])
        //The goal is to help the user activate your controls using whatever seems natural to them – you can provide as many strings as you want, and iOS will listen for all of them
    }
}

#Preview {
    voiceInputControl()
}
