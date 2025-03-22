//
//  ContentView.swift
//  SwiftUI Elements
//
//  Created by Geoffrey Friberg on 2/18/25.
//

import SwiftUI

struct ContentView: View {
    
    var showIntro: Bool
    
    var body: some View {
        ZStack{
            TabView{
                Tab("Blur Effects",systemImage: "pencil.and.outline") {
                    BlurEffect()
                }
                Tab("Frames", systemImage:"photo"){
                    Frames()
                }
                Tab("Grids", systemImage:"squareshape.split.3x3"){
                    Grids()
                }
                Tab("3D Rotation", systemImage:"move.3d"){
                    RotationIn3D()
                }
            }
            if showIntro {
                MeshGradientIntro()
            }
        }
    }
}

#Preview {
    ContentView(showIntro: false)
}
