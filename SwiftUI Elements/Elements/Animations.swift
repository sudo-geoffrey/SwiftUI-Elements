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
        VStack {
            Text("Spring Animation")
                .font(.title)
                .scaleEffect(textBig ? 1 : 1.1)
                .onTapGesture {
                    withAnimation(.spring) {
                        textBig.toggle()
                    }
                }
            RoundedRectangle(cornerRadius: 17)
                .foregroundStyle(rectangleOffset ? myGradient : myGradient2)
                .aspectRatio(1.0, contentMode: .fit)
                .frame(width: 150, height: 100)
                .offset(x: rectangleOffset ? 100 : -100, y: 0)
                .onTapGesture{
                    withAnimation(.spring){
                        rectangleOffset.toggle()
                    }
                }
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
}


struct Animations: View {
    var body: some View {
        springExample()
    }
}

#Preview {
    Animations()
}
