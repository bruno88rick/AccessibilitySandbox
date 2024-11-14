//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by Bruno Oliveira on 14/11/24.
//

import SwiftUI

struct ContentView: View {
    let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096"
    ]
    
    //array of labes to voice over to read immediately
    let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks",
    ]
    
    let hint = "Double tap to change Image"
    
    @State private var selectedPicture = Int.random(in: 0...3)
    
    @State private var selectedPicture2 = Int.random(in: 0...3)
    
    var body: some View {
        Image(pictures[selectedPicture])
            .resizable()
            .scaledToFit()
            .onTapGesture {
                selectedPicture = Int.random(in: 0...3)
            }
            .accessibilityLabel(labels[selectedPicture])
            .accessibilityHint(hint)
            //to fix the problem that voice over says that this is an Image (we put the onTapGesture so this is a Button instead) we can do:
            .accessibilityAddTraits(.isButton)
            // to avoid voice over to say "image"
            .accessibilityRemoveTraits(.isImage)
            .padding()
        
        ///That being said, adding and removing traits wouldn't have been required at all if we had just used a regular button rather than an image with a tap gesture. This is why it's preferable to use buttons rather than onTapGesture() wherever possible, which here means code like this:

        Button {
            selectedPicture2 = Int.random(in: 0...3)
        } label: {
            Image(pictures[selectedPicture2])
                .resizable()
                .scaledToFit()
        }
        .accessibilityLabel(labels[selectedPicture2])
        .accessibilityHint(hint)
        .padding()
        
    }
}

#Preview {
    ContentView()
}
