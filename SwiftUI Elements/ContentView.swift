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
                Tab("Stacks",systemImage: "square.stack") {
                    Stacks_and_Gradients()
                }
                Tab("Animations", systemImage:"figure.run"){
                    Animations()
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
    ContentView(showIntro: true)
}
