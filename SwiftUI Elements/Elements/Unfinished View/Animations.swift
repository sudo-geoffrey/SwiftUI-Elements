//
//  Animations.swift
//  SwiftUI Elements
//
//  Created by Geoffrey Friberg on 2/18/25.
//

import SwiftUI

struct springExample: View {
    
    let fonts: [Font] = [
            .system(.largeTitle, design: .serif),
            .system(.title, design: .monospaced),
            .system(.headline, design: .rounded),
            .system(.body, design: .default),
            .custom("AmericanTypewriter", size: 24), // Example custom font
            .custom("Chalkduster", size: 22) // Another custom font
        ]
    
    @State private var textBig: Bool = true
    @State private var rectangleOffset: Bool = false
    
    @State private var font: Font = .caption
    var body: some View {
            VStack(spacing: 15) {
                Text("Font Animation")
                    .font(.title)
                Text("Press the button!")
                    .font(font)
                Button {
                    withAnimation(.spring){
                        font = fonts.randomElement() ?? .caption
                    }
                } label: {
                    Text("Click me")
                        .font(.body)
                        .fontWeight(.semibold)
                }
                .buttonStyle(.bordered)
            }
            Spacer()
        }
    }


struct Animations: View {
    var body: some View {
        springExample()
    }
}

#Preview {
    Animations()
}
