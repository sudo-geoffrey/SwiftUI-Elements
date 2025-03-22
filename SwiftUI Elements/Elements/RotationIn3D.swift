//
//  MiltiLineTrailing.swift
//  SwiftUI Elements
//
//  Created by Geoffrey Friberg on 2/21/25.
//

import SwiftUI



struct RotationIn3D: View {
    @State var screenTapped: Bool = false
    var body: some View {
        ZStack {
            myGradient
                .opacity(0.5)
                .ignoresSafeArea()
            VStack() {
                Text("Hello World!")
                    .font(.largeTitle)
                    .scaleEffect(screenTapped ? 1.5 : 1)
                    .rotation3DEffect(.degrees(screenTapped ? 0 : 180), axis: (x:0, y:1, z:0))
                Text("Welcome to the world of 3D SwiftUI")
                    .font(.body)
                    .fontWeight(.light)
                    .scaleEffect(screenTapped ? 1.2 : 1)
                    .multilineTextAlignment(.center)
                    .rotation3DEffect(.degrees(screenTapped ? 0 : 180), axis: (x:0, y:1, z:0))
            }
        }
        .onTapGesture {
            withAnimation(.spring){
                screenTapped.toggle()
            }
        }
    }
}

#Preview {
    RotationIn3D()
}
