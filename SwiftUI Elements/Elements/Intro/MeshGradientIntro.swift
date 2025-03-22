//
//  MeshGradient.swift
//  SwiftUI Elements
//
//  Created by Geoffrey Friberg on 2/25/25.
//

import SwiftUI
import Foundation

let TIME_TO_WAIT = 8.0

struct AnimatedMeshGradient: View {
    
    @Binding var welcomeTextShowing: Bool
    
    func period(_ offset: Float, _ currentNum: Float) -> Float {
        
        guard currentNum != 0 else { return 1 }
        
        let sign = [-1,1].randomElement()!
        
        return sin(difference + offset) / pow(currentNum , -1) * Float(sign)
        
    }
    
    @State var difference: Float = 0.0
    
    var mesh2: some View {
        MeshGradient (
            width: 3,
            height: 3,
            points: [
                [0.0, 0.0], [0.5, 0.0], [1.0 + sin(difference - 3), 0.0],
                [0.0, 0.5], [0.8 - sin(difference), 0.2], [1.0, 0.5],
                [0.0, 1.0], [0.5 - sin(difference + 2) , 1.0], [1.0, 1.0]
            ], colors: [
                .black, .black, .black,
                .blue, .blue, .blue,
                .green, .green, .green
            ])
        .ignoresSafeArea()
    }
    
    var mesh1: some View {
        
        MeshGradient (width: 3, height: 3, points: [
            .init(0, 0), .init(0.5 + period(1,0.5) , 0), .init (1, 0),
            .init(0, 0.5 + period(2,0.5)), .init(0.5 + period(3, 0.5), 0.5 + period(0, 0.5)), .init(1, 0.5 + period(1,0.5)),
            .init(0, 1), .init(0.5 + period(10,0.5), 1), .init (1, 1)
        ], colors: [
            .blue, .purple, .indigo,
            .orange, .red, .blue,
            .yellow, .green, .mint
        ])
        .ignoresSafeArea()
        .onAppear {
            startAnimating()
        }
    }
    
    var body: some View {
        mesh1
    }
    
    private func startAnimating() {
        Timer.scheduledTimer(withTimeInterval: welcomeTextShowing ? 5 : 1, repeats: true) { _ in
            withAnimation(.linear(duration: welcomeTextShowing ? 3 : 1)) {
                difference += Float.random(in: 0...Float(Double.pi) * 2)
            }
        }
    }
}


struct MeshGradientIntro: View {
    
    @State private var big = false
    @State private var welcomeTextShowing = false
    @State private var yOffset = 0
    @State private var xOffset = 0
    @State private var closeScreen: Bool = false
    @State private var hide: Bool = false
    
    var body: some View {
        if !closeScreen{
            ZStack {
                AnimatedMeshGradient(welcomeTextShowing: $welcomeTextShowing)
                
                Color.background
                    .ignoresSafeArea()
                    .overlay(
                        Text("Tap here")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.black) // This will be the "hole"
                            .blendMode(.destinationOut)
                            .scaleEffect(big ? 120 : 1)
                            .onTapGesture {
                                withAnimation(.spring(duration: 1)) {
                                    big = true
                                }
                                withAnimation(.spring(duration: 5)) {
                                    welcomeTextShowing = true
                                }
                                waitAndClose()
                            }
                            .offset(x: CGFloat(xOffset), y: CGFloat(yOffset))
                    )
                    .compositingGroup()
                    .onAppear {
                        textShake()
                    }
                
                Text("Welcome to SwiftUI Elements")
                    .opacity(welcomeTextShowing ? 1 : 0)
                    .foregroundStyle(.white)
                    .font(.title)
                    .bold()
                    .padding()
                    .multilineTextAlignment(.center)
            }
            .opacity(hide ? 0 : 1)
        }
    }
    
    func waitAndClose() {
        DispatchQueue.main.asyncAfter(deadline: .now() + TIME_TO_WAIT) {
            withAnimation(.easeInOut(duration: 2)) {
                hide = true
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + TIME_TO_WAIT + 2) {
            closeScreen = true
        }
    }
    
    func textShake() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: !welcomeTextShowing) { _ in
            withAnimation(.spring(duration: 0.1)) {
                yOffset = Int.random(in: -4...4)
                xOffset = Int.random(in: -2...2)
            }
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//                withAnimation(.spring(duration: 0.5)) {
//                    yOffset = 0
//                    xOffset = 0
//                }
//            }
        }
    }
}
#Preview {
    MeshGradientIntro()
}



//    var body: some View {
//            Text("Press Me")
//                .font(.title)
//                .bold()
//                .padding()
//                .background(.black.opacity(0.2))
//                .clipShape(RoundedRectangle(cornerRadius: 15))
//                .overlay(AnimatedMeshGradient().clipShape(RoundedRectangle(cornerRadius: 15))) // Apply gradient
//                .foregroundColor(.clear) // Hide default text color
//                .mask(Text("Tap Here").font(.title).bold())
//                .onTapGesture
//            {
//
//                withAnimation(.easeInOut(duration: 0.5)) {
//                    big = true
//                }
//                withAnimation(.spring(duration: 5)) {
//                    welcomeTextShowing = true
//                }
//            }
//
//
//            .frame(width: 400, height: 1000) // Large frame to allow text to expand
//            .scaleEffect(big ? 500: 1)
//            .overlay(
//                Text("Welcome to SwiftUI Elements")
//                    .opacity(welcomeTextShowing ? 1 : 0)
//                    .foregroundStyle(.white)
//                    .font(.title)
//                    .bold()
//                    .padding()
//                    .multilineTextAlignment(.center)
//            )
//    }
